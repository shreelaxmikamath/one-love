import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'profile_prompt_screen.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  String initialCountry = 'IN'; // Initial selected country code
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 12), // Added space
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            const SizedBox(height: 12), // Added space
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12), // Added space
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 12), // Added space
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              initialValue: number,
              textFieldController: contactNumberController,
              inputDecoration: const InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(),
              ),
              formatInput: false, // Disable auto-formatting
              maxLength: 10, // Limit to 10 digits
            ),
            const SizedBox(height: 20), // Larger space before the button
            ElevatedButton(
              onPressed: () async {
                // Validate input fields
                if (usernameController.text.isEmpty ||
                    fullNameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    contactNumberController.text.isEmpty ||
                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emailController.text) ||
                    !RegExp(r'^[0-9]{10}$').hasMatch(contactNumberController.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please fill in all fields correctly."),
                  ));
                  return; // Exit function if any field is empty or format is incorrect
                }

                // Debug print statements for input values
                print('Username: ${usernameController.text}');
                print('Full Name: ${fullNameController.text}');
                print('Email: ${emailController.text}');
                print('Password: ${passwordController.text}');
                print('Contact Number: ${contactNumberController.text}');

                var signupData = {
                  "username": usernameController.text,
                  "full_name": fullNameController.text,
                  "email": emailController.text,
                  "password": passwordController.text,
                  "contact_number": contactNumberController.text,
                };
                print('Signup Data: $signupData');

                var response = await http.post(
                  Uri.parse('http://10.0.2.2:5000/signup'),
                  headers: {"Content-Type": "application/json"},
                  body: json.encode(signupData),
                );

                print('Signup Response: ${response.body}');

                if (response.statusCode == 201) {
                  var responseData = json.decode(response.body);
                  String userId = responseData['user_id'].toString(); // Convert user_id to String
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePromptScreen(
                        userId: userId,
                        fullName: fullNameController.text,
                        username: usernameController.text,
                        email: emailController.text,
                        contactNumber: contactNumberController.text,
                      ),
                    ),
                  );
                } else if (response.statusCode == 409) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Username already exists. Please choose a different username."),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Signup failed. Please try again later."),
                  ));
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SignupScreen(),
  ));
}
