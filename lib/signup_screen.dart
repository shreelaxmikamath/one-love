import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: contactNumberController,
              decoration: InputDecoration(labelText: 'Contact Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var response = await http.post(
                  Uri.parse('http://10.0.2.2:5000/signup'),
                  headers: {"Content-Type": "application/json"},
                  body: json.encode({
                    "username": usernameController.text,
                    "email": emailController.text,
                    "password": passwordController.text,
                    "contact_number": contactNumberController.text,
                  }),
                );

                if (response.statusCode == 201) {
                  // Navigate to the login screen
                  print("Signup successful!");
                  Navigator.pop(context);
                } else {
                  // Show error message
                  print("Signup failed!");
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
