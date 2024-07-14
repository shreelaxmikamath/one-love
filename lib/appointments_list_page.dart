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
  List<dynamic> appointments = []; // List to store appointments

  @override
  void initState() {
    super.initState();
    fetchAppointments(); // Fetch appointments when the page loads
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
          ? Center(
        child: CircularProgressIndicator(),
      )
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
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteAppointment(appointment['appointment_date'], appointment['appointment_time']);
                },
              ),
              onTap: () {
                // You can add navigation to appointment details if needed
              },
            ),
          );
        },
      ),
    );
  }
}
