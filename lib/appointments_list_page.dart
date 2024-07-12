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

    if (!mounted) return; // Check if the widget is still mounted

    if (response.statusCode == 200) {
      setState(() {
        appointments = jsonDecode(response.body) as List<dynamic>;
      });
    } else {
      print('Failed to fetch appointments: ${response.statusCode}');
    }
  }

  Future<void> editAppointment(String appointmentId, String status) async {
    final url = 'http://10.0.2.2:5000/edit_appointment';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'appointment_id': appointmentId,
        'status': status,
      }),
    );

    if (!mounted) return; // Check if the widget is still mounted

    if (response.statusCode == 200) {
      fetchAppointments(); // Refresh the list after editing
    } else {
      print('Failed to edit appointment: ${response.statusCode}');
    }
  }

  Future<void> deleteAppointment(String appointmentId) async {
    final url = 'http://10.0.2.2:5000/delete_appointment';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'appointment_id': appointmentId,
      }),
    );

    if (!mounted) return; // Check if the widget is still mounted

    if (response.statusCode == 200) {
      fetchAppointments(); // Refresh the list after deletion
    } else {
      print('Failed to delete appointment: ${response.statusCode}');
      print('Response body: ${response.body}');
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    String? newStatus = await showDialog<String>(
                      context: context,
                      builder: (context) {
                        String? selectedStatus;
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text('Edit Appointment Status'),
                              content: DropdownButton<String>(
                                value: selectedStatus,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedStatus = newValue;
                                  });
                                },
                                items: <String>[
                                  'Pending',
                                  'Confirmed',
                                  'Cancelled'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(selectedStatus);
                                  },
                                  child: Text('Save'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );

                    if (newStatus != null) {
                      await editAppointment(appointment['id'].toString(), newStatus);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    bool? confirm = await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Delete Appointment'),
                          content: Text('Are you sure you want to delete this appointment?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );

                    if (confirm == true) {
                      await deleteAppointment(appointment['id'].toString());
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
