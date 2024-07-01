import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'profile_prompt_screen.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

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
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
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
                    "full_name": fullNameController.text,
                    "email": emailController.text,
                    "password": passwordController.text,
                    "contact_number": contactNumberController.text,
                  }),
                );

                if (response.statusCode == 201) {
                  var responseData = json.decode(response.body);
                  String userId = responseData['user_id'].toString(); // Convert user_id to String
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePromptScreen(userId: userId),
                    ),
                  );
                } else if (response.statusCode == 409) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Username already exists. Please choose a different username."),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Signup failed. Please try again later."),
                  ));
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
