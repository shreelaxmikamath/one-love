import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var response = await http.post(
                  Uri.parse('http://10.0.2.2:5000/login'),
                  headers: {"Content-Type": "application/json"},
                  body: json.encode({
                    "username": usernameController.text,
                    "password": passwordController.text,
                  }),
                );

                if (response.statusCode == 200) {
                  var responseBody = json.decode(response.body);
                  String userId = responseBody['user_id'].toString();

                  // Ensure is_profile_complete is a bool, default to false if not present
                  bool isProfileComplete = responseBody['is_profile_complete'] ?? false;

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen(userId: userId)),
                  );
                } else {
                  print("Login failed!");
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: const Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}