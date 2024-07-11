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
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return ListTile(
            title: Text(
              'Doctor: ${appointment['doctor_name']}',
              style: TextStyle(fontSize: 16.0),
            ),
            subtitle: Text(
              'Date: ${appointment['appointment_date']}\n'
                  'Time: ${appointment['appointment_time']}\n'
                  'Status: ${appointment['status']}',
              style: TextStyle(fontSize: 14.0),
            ),
          );
        },
      ),
    );
  }
}
