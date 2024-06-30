import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfilePromptScreen extends StatelessWidget {
  final String userId;
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController dietController = TextEditingController();
  final TextEditingController monthsController = TextEditingController();
  final TextEditingController childrenController = TextEditingController();

  ProfilePromptScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextField(
              controller: genderController,
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: 'Weight'),
            ),
            TextField(
              controller: heightController,
              decoration: InputDecoration(labelText: 'Height'),
            ),
            TextField(
              controller: dietController,
              decoration: InputDecoration(labelText: 'Diet (Vegetarian/Non-Vegetarian)'),
            ),
            TextField(
              controller: monthsController,
              decoration: InputDecoration(labelText: 'How many months?'),
            ),
            TextField(
              controller: childrenController,
              decoration: InputDecoration(labelText: 'Number of children'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var response = await http.post(
                  Uri.parse('http://10.0.2.2:5000/save_profile'),
                  headers: {"Content-Type": "application/json"},
                  body: json.encode({
                    "user_id": userId,
                    "age": ageController.text,
                    "gender": genderController.text,
                    "weight": weightController.text,
                    "height": heightController.text,
                    "diet": dietController.text,
                    "months": monthsController.text,
                    "children": childrenController.text,
                  }),
                );

                if (response.statusCode == 200) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  print("Failed to save profile information!");
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
