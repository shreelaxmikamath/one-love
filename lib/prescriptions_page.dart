import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prescriptions Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PrescriptionsPage(),
    );
  }
}

class PrescriptionsPage extends StatefulWidget {
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
    final url = 'http://10.0.2.2:5000/get_prescriptions?user_id=1'; // Replace with your API endpoint
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
          return ListTile(
            title: Text(
              prescriptions[index]['medicine_name'] ?? 'No Name',
              style: TextStyle(fontSize: 16.0),
            ),
            subtitle: Text(
              prescriptions[index]['instructions'] ?? 'No Instructions',
              style: TextStyle(fontSize: 14.0),
            ),
          );
        },
      ),
    );
  }
}
