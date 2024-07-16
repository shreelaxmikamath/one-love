import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'appointments_page.dart';

class AppointmentsListPage extends StatefulWidget {
  final String userId;

  const AppointmentsListPage({Key? key, required this.userId}) : super(key: key);

  @override
  _AppointmentsListPageState createState() => _AppointmentsListPageState();
}

class _AppointmentsListPageState extends State<AppointmentsListPage> {
  List<Map<String, dynamic>> _appointments = [];

  @override
  void initState() {
    super.initState();
    _fetchAppointments();
  }

  Future<void> _fetchAppointments() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5000/appointments/${widget.userId}'),
      );

      if (response.statusCode == 200) {
        List<dynamic> appointmentsData = json.decode(response.body);
        setState(() {
          _appointments = List<Map<String, dynamic>>.from(appointmentsData);
        });
      } else {
        throw Exception('Failed to fetch appointments');
      }
    } catch (e) {
      print('Error fetching appointments: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load appointments. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _deleteAppointment(int appointmentId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://10.0.2.2:5000/appointments/$appointmentId'),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Appointment deleted successfully.'),
            duration: Duration(seconds: 2),
          ),
        );
        _fetchAppointments();
      } else {
        throw Exception('Failed to delete appointment');
      }
    } catch (e) {
      print('Error deleting appointment: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete appointment. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _editAppointment(Map<String, dynamic> appointment) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentsPage(
          userId: widget.userId,
          isEditing: true,
          appointment: appointment,
        ),
      ),
    );

    if (result == true) {
      _fetchAppointments();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
      ),
      body: ListView.builder(
        itemCount: _appointments.length,
        itemBuilder: (context, index) {
          final appointment = _appointments[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text('Dr. ${appointment['doctor_name']}'),
              subtitle: Text(
                '${appointment['appointment_date']} at ${appointment['appointment_time']}\n'
                    'Reason: ${appointment['reason']}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _editAppointment(appointment),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteAppointment(appointment['id']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppointmentsPage(userId: widget.userId),
            ),
          );

          if (result == true) {
            _fetchAppointments();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}