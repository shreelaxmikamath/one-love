import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmergencyContactForm extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController relationshipController = TextEditingController();

  Future<void> saveEmergencyContact(BuildContext context) async {
    String url = 'http://localhost:5000/add_emergency_contact';
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': 1, // Replace with actual user_id
        'full_name': fullNameController.text,
        'phone_number': phoneNumberController.text,
        'relationship': relationshipController.text,
      }),
    );

    if (response.statusCode == 201) {
      // Successfully saved
      print('Emergency contact added successfully!');
      Navigator.pop(context); // Go back to the previous page
    } else {
      // Failed to save
      print('Failed to add emergency contact.');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to save emergency contact.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contact Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Emergency Contact Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            TextField(
              controller: relationshipController,
              decoration: InputDecoration(
                labelText: 'Relationship',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveEmergencyContact(context); // Call function to save contact
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
