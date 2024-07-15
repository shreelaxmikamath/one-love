import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppointmentsPage extends StatefulWidget {
  final String userId;

  const AppointmentsPage({super.key, required this.userId});

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  List<String> _doctors = [];
  String? _selectedDoctor;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  final TextEditingController _reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  Future<void> _fetchDoctors() async {
    try {
      final response = await http.get(
          Uri.parse('http://10.0.2.2:5000/doctors'));

      if (response.statusCode == 200) {
        List<dynamic> doctorsData = json.decode(response.body);

        setState(() {
          _doctors = doctorsData
              .map<String>((doctor) => doctor['name'].toString())
              .toList();
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print('Error fetching doctors: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load doctors. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
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
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _bookAppointment() async {
    if (_selectedDoctor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a doctor'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    String reason = _reasonController.text.trim();
    DateTime selectedDateTime = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );

    Map<String, dynamic> appointmentData = {
      'user_id': widget.userId,
      'doctor_name': _selectedDoctor,
      'appointment_date': selectedDateTime.toIso8601String(),
      'appointment_time': '${_selectedTime.hour}:${_selectedTime.minute}',
      'reason': reason,
    };

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/book_appointment'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(appointmentData),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Appointment booked successfully!'),
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.of(context).pop();
      } else {
        print('Book appointment failed: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to book appointment. Please try again.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print('Error booking appointment: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error booking appointment. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedDoctor,
                    hint: const Text('Select a doctor', style: TextStyle(color: Colors.black)), // Add style here
                    onChanged: (newValue) {
                      setState(() {
                        _selectedDoctor = newValue;
                      });
                    },
                    items: _doctors.map((doctor) {
                      return DropdownMenuItem<String>(
                        value: doctor,
                        child: Text(doctor, style: const TextStyle(color: Colors.black)), // Add style here as well
                      );
                    }).toList(),
                    dropdownColor: Colors.white,
                    style: const TextStyle(color: Colors.black), // Add this line to set the general text style
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () => _selectDate(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${_selectedDate.day}/${_selectedDate
                          .month}/${_selectedDate.year}'),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () => _selectTime(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_selectedTime.format(context)),
                      const Icon(Icons.access_time),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),Container(
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                controller: _reasonController,
                decoration: const InputDecoration(
                  labelText: 'Reason for Appointment',
                  labelStyle: TextStyle(color: Colors.black), // Add this line
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 24),
      ElevatedButton(
        onPressed: _bookAppointment,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.pink[50], // Add this line to make the button background white
        ),
        child: const Text(
          'Book Appointment',
          style: TextStyle(color: Colors.black), // Add this line
        ),
      ),
          ],
        ),
      ),
    );
  }
}