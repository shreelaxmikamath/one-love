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
    final url = 'http://10.0.2.2:5000/get_appointments?user_id=${widget.userId}'; // Use the userId passed from constructor
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        appointments = jsonDecode(response.body) as List<dynamic>;
      });
    } else {
      // Handle error fetching appointments
      print('Failed to fetch appointments: ${response.statusCode}');
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
        child: CircularProgressIndicator(), // Show loading indicator while fetching
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
              subtitle: Text('Doctor: ${appointment['doctor_name']}\nStatus: ${appointment['status']}'), // Display status here
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
