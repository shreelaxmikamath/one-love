import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PrescriptionsPage extends StatefulWidget {
  final String userId;

  PrescriptionsPage({required this.userId});

  @override
  _PrescriptionsPageState createState() => _PrescriptionsPageState();
}

class _PrescriptionsPageState extends State<PrescriptionsPage> {
  List<dynamic> prescriptions = []; // List to store prescriptions

  @override
  void initState() {
    super.initState();
    fetchPrescriptions(); // Fetch prescriptions when the page loads
  }

  Future<void> fetchPrescriptions() async {
    final url = 'http://10.0.2.2:5000/get_prescriptions?user_id=${widget.userId}'; // Use the userId passed from constructor
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        prescriptions = jsonDecode(response.body) as List<dynamic>;
      });
    } else {
      // Handle error fetching prescriptions
      print('Failed to fetch prescriptions: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Prescriptions'),
      ),
      body: prescriptions.isEmpty
          ? Center(
        child: CircularProgressIndicator(), // Show loading indicator while fetching
      )
          : ListView.builder(
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Doctor: ${prescriptions[index]['doctor_name'] ?? 'No Doctor Name'}',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Diagnosis: ${prescriptions[index]['diagnosis'] ?? 'No Diagnosis'}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Medications: ${prescriptions[index]['medications'] ?? 'No Medications'}',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Instructions: ${prescriptions[index]['instructions'] ?? 'No Instructions'}',
                    style: TextStyle(fontSize: 14.0),
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
