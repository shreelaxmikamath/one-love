import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AppointmentsListPage extends StatefulWidget {
  final String userId;

  AppointmentsListPage({required this.userId});

  @override
  _AppointmentsListPageState createState() => _AppointmentsListPageState();
}

class _AppointmentsListPageState extends State<AppointmentsListPage> {
  List<dynamic> appointments = [];

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    final url = 'http://10.0.2.2:5000/get_appointments?user_id=${widget.userId}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        appointments = jsonDecode(response.body) as List<dynamic>;
      });
    } else {
      print('Failed to fetch appointments: ${response.statusCode}');
    }
  }

  Future<void> updateAppointment(String appointmentDate, String appointmentTime) async {
    final updatedDetails = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        DateTime newDate = DateTime.parse(appointmentDate);
        TimeOfDay newTime = TimeOfDay(
          hour: int.parse(appointmentTime.split(':')[0]),
          minute: int.parse(appointmentTime.split(':')[1]),
        );

        return AlertDialog(
          title: Text('Update Appointment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: newDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      newDate = pickedDate;
                    });
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(labelText: 'Select Date'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${newDate.day}/${newDate.month}/${newDate.year}'),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  final pickedTime = await showTimePicker(
                    context: context,
                    initialTime: newTime,
                  );
                  if (pickedTime != null) {
                    setState(() {
                      newTime = pickedTime;
                    });
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(labelText: 'Select Time'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${newTime.hour.toString().padLeft(2, '0')}:${newTime.minute.toString().padLeft(2, '0')}'),
                      Icon(Icons.access_time),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop({
                  'date': newDate.toIso8601String(),
                  'time': '${newTime.hour}:${newTime.minute}',
                });
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );

    if (updatedDetails != null) {
      final url = 'http://10.0.2.2:5000/update_appointment';
      final response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'user_id': widget.userId,
          'appointment_date': appointmentDate,
          'appointment_time': appointmentTime,
          'new_date': updatedDetails['date'],
          'new_time': updatedDetails['time'],
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          var appointmentIndex = appointments.indexWhere((appt) =>
          appt['appointment_date'] == appointmentDate &&
              appt['appointment_time'] == appointmentTime);

          if (appointmentIndex != -1) {
            appointments[appointmentIndex]['appointment_date'] = updatedDetails['date'];
            appointments[appointmentIndex]['appointment_time'] = updatedDetails['time'];
          }
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Appointment updated successfully')));
      } else {
        print('Failed to update appointment: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update appointment')));
      }
    }
  }

  Future<void> deleteAppointment(String appointmentDate, String appointmentTime) async {
    final url = 'http://10.0.2.2:5000/delete_appointment';
    final response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'user_id': widget.userId,
        'appointment_date': appointmentDate,
        'appointment_time': appointmentTime,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        appointments.removeWhere((appointment) =>
        appointment['appointment_date'] == appointmentDate &&
            appointment['appointment_time'] == appointmentTime);
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Appointment deleted successfully')));
    } else {
      print('Failed to delete appointment: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to delete appointment')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments List'),
      ),
      body: appointments.isEmpty
          ? Center(child: Text('No Appointments Yet!!'))
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              title: Text('${appointment['appointment_date']} - ${appointment['appointment_time']}'),
              subtitle: Text('Doctor: ${appointment['doctor_name']} - Status: ${appointment['status']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      updateAppointment(appointment['appointment_date'], appointment['appointment_time']);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteAppointment(appointment['appointment_date'], appointment['appointment_time']);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}