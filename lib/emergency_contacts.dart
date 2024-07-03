import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmergencyContactsPage extends StatefulWidget {
  @override
  _EmergencyContactsPageState createState() => _EmergencyContactsPageState();
}

class _EmergencyContactsPageState extends State<EmergencyContactsPage> {
  List<String> emergencyContacts = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                addContact();
              },
              child: Text('Add Contact'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Emergency Contacts List:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: emergencyContacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(emergencyContacts[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        removeContact(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addContact() async {
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();

    if (name.isNotEmpty && phone.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse('http://10.0.2.2:5000/emergency_contact'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'name': name,
            'phone': phone,
          }),
        );

        if (response.statusCode == 201) {
          setState(() {
            String contactInfo = '$name - $phone';
            emergencyContacts.add(contactInfo);
            nameController.clear();
            phoneController.clear();
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Emergency contact added successfully')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add contact. Please try again later.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both name and phone number')),
      );
    }
  }

  void removeContact(int index) {
    setState(() {
      emergencyContacts.removeAt(index);
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: EmergencyContactsPage(),
  ));
}