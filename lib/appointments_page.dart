import 'package:flutter/material.dart';

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  List<String> _doctors = ['Dr. Smith', 'Dr. Jones', 'Dr. Williams'];
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedDoctor;
  String? _symptoms;

  Map<DateTime, Map<String, dynamic>> _appointments = {}; // Store appointments with additional data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Select Doctor'),
              items: _doctors.map((doctor) {
                return DropdownMenuItem<String>(
                  value: doctor,
                  child: Text(doctor),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDoctor = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );

                if (pickedDate != null && pickedDate != _selectedDate) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              child: Text(
                _selectedDate == null ? 'Select Date' : 'Selected Date: ${_selectedDate!.toString().split(' ')[0]}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime ?? TimeOfDay.now(),
                );

                if (pickedTime != null && pickedTime != _selectedTime) {
                  setState(() {
                    _selectedTime = pickedTime;
                  });
                }
              },
              child: Text(
                _selectedTime == null ? 'Select Time' : 'Selected Time: ${_selectedTime!.format(context)}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Symptoms'),
              onChanged: (value) {
                setState(() {
                  _symptoms = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedDoctor == null || _selectedDate == null || _selectedTime == null
                  ? null
                  : () {
                if (_symptoms == null) {
                  _symptoms = ''; // Handle case where no symptoms are entered
                }

                DateTime combinedDateTime = DateTime(
                  _selectedDate!.year,
                  _selectedDate!.month,
                  _selectedDate!.day,
                  _selectedTime!.hour,
                  _selectedTime!.minute,
                );

                setState(() {
                  _appointments[combinedDateTime] = {
                    'doctor': _selectedDoctor!,
                    'symptoms': _symptoms!,
                  };
                });

                Navigator.pop(context);
              },
              child: Text('Book Appointment'),
            ),
            SizedBox(height: 20),
            if (_selectedDate != null && _selectedTime != null)
              Text(
                'Selected Date and Time: ${_selectedDate!.toString().split(' ')[0]} at ${_selectedTime!.format(context)}',
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
