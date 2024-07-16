import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class AppointmentsPage extends StatefulWidget {
  final String userId;
  final bool isEditing;
  final Map<String, dynamic>? appointment;

  const AppointmentsPage({
    Key? key,
    required this.userId,
    this.isEditing = false,
    this.appointment,
  }) : super(key: key);

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedDoctor;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final _reasonController = TextEditingController();
  List<Map<String, dynamic>> _doctors = [];

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
    if (widget.isEditing && widget.appointment != null) {
      _selectedDoctor = widget.appointment!['doctor_id']?.toString();
      _selectedDate = DateTime.parse(widget.appointment!['appointment_date']);

      List<String> timeParts = widget.appointment!['appointment_time'].split(':');
      _selectedTime = TimeOfDay(
          hour: int.parse(timeParts[0]),
          minute: int.parse(timeParts[1])
      );

      _reasonController.text = widget.appointment!['reason'];
    }
  }

  Future<void> _fetchDoctors() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:5000/doctors'));
      if (response.statusCode == 200) {
        List<dynamic> doctorsData = json.decode(response.body);
        setState(() {
          _doctors = List<Map<String, dynamic>>.from(doctorsData);
        });
      } else {
        throw Exception('Failed to fetch doctors');
      }
    } catch (e) {
      print('Error fetching doctors: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load doctors. Please try again.')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _submitAppointment() async {
    if (_formKey.currentState!.validate() && _selectedDoctor != null && _selectedDate != null && _selectedTime != null) {
      final baseUrl = 'http://10.0.2.2:5000/appointments';
      final url = widget.isEditing
          ? Uri.parse('$baseUrl/${widget.appointment!['id']}')
          : Uri.parse(baseUrl);

      final appointmentData = {
        'user_id': widget.userId,
        'doctor_id': _selectedDoctor,
        'appointment_date': DateFormat('yyyy-MM-dd').format(_selectedDate!),
        'appointment_time': '${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
        'reason': _reasonController.text,
      };

      try {
        final response = widget.isEditing
            ? await http.put(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(appointmentData),
        )
            : await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(appointmentData),
        );

        print('Server response status code: ${response.statusCode}');
        print('Server response body: ${response.body}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          Navigator.pop(context, true);
        } else {
          String errorMessage;
          try {
            errorMessage = json.decode(response.body)['error'] ?? 'Unknown error occurred';
          } catch (e) {
            errorMessage = 'Failed to parse server response: ${response.body}';
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to ${widget.isEditing ? 'update' : 'save'} appointment: $errorMessage')),
          );
        }
      } catch (e) {
        print('Exception caught: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Network error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit Appointment' : 'New Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedDoctor,
                items: [
                  DropdownMenuItem<String>(
                    value: null,
                    child: Text('Select a doctor'),
                  ),
                  ..._doctors.map((doctor) {
                    return DropdownMenuItem<String>(
                      value: doctor['id'].toString(),
                      child: Text(doctor['name']),
                    );
                  }).toList(),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedDoctor = value;
                  });
                },
                validator: (value) => value == null ? 'Please select a doctor' : null,
              ),
              ListTile(
                title: Text(_selectedDate == null ? 'Select Date' : DateFormat('yyyy-MM-dd').format(_selectedDate!)),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              ListTile(
                title: Text(_selectedTime == null ? 'Select Time' : _selectedTime!.format(context)),
                trailing: const Icon(Icons.access_time),
                onTap: () => _selectTime(context),
              ),
              TextFormField(
                controller: _reasonController,
                decoration: const InputDecoration(labelText: 'Reason for Appointment'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the reason for the appointment';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitAppointment,
                child: Text(widget.isEditing ? 'Update Appointment' : 'Create Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }
}