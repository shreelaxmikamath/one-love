import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountPage extends StatefulWidget {
  final String userId;

  AccountPage({required this.userId});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late Future<Map<String, dynamic>> _profileDetails;

  @override
  void initState() {
    super.initState();
    _profileDetails = _loadProfileDetails();
  }

  Future<Map<String, dynamic>> _loadProfileDetails() async {
    try {
      var response = await http.get(
        Uri.parse('http://10.0.2.2:5000/user_info?user_id=${widget.userId}'),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load profile details');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _profileDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var profileData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Username'),
                    subtitle: Text(profileData['username']),
                  ),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text(profileData['email']),
                  ),
                  ListTile(
                    title: Text('Contact Number'),
                    subtitle: Text(profileData['contact_number']),
                  ),
                  ListTile(
                    title: Text('Age'),
                    subtitle: Text(profileData['age']),
                  ),
                  ListTile(
                    title: Text('Gender'),
                    subtitle: Text(profileData['gender']),
                  ),
                  ListTile(
                    title: Text('Weight'),
                    subtitle: Text(profileData['weight']),
                  ),
                  ListTile(
                    title: Text('Height'),
                    subtitle: Text(profileData['height']),
                  ),
                  ListTile(
                    title: Text('Diet'),
                    subtitle: Text(profileData['diet']),
                  ),
                  ListTile(
                    title: Text('Months'),
                    subtitle: Text(profileData['months']),
                  ),
                  ListTile(
                    title: Text('Children'),
                    subtitle: Text(profileData['children']),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
