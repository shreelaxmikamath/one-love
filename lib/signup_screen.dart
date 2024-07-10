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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 12), // Added space
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            SizedBox(height: 12), // Added space
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 12), // Added space
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 12), // Added space
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: number,
              textFieldController: contactNumberController,
              inputDecoration: InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(),
              ),
              formatInput: false, // Disable auto-formatting
              maxLength: 10, // Limit to 10 digits
            ),
            SizedBox(height: 20), // Larger space before the button
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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

void main() {
  runApp(MaterialApp(
    home: SignupScreen(),
  ));
}
