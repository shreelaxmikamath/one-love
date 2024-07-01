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
  late Map<String, dynamic> _profileData;

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
        _profileData = json.decode(response.body);
        return _profileData;
      } else {
        throw Exception('Failed to load profile details');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  void _updateProfileDetails(Map<String, dynamic> updatedProfileData) {
    // TODO: Send updatedProfileData to the server to update the profile
    setState(() {
      _profileData = updatedProfileData;
      _profileDetails = Future.value(updatedProfileData);
    });
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: _EditProfileForm(
            profileData: _profileData,
            onSave: _updateProfileDetails,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _editProfile,
          ),
        ],
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
                    subtitle: Text(profileData['age'].toString()),
                  ),
                  ListTile(
                    title: Text('Gender'),
                    subtitle: Text(profileData['gender']),
                  ),
                  ListTile(
                    title: Text('Weight'),
                    subtitle: Text(profileData['weight'].toString()),
                  ),
                  ListTile(
                    title: Text('Height'),
                    subtitle: Text(profileData['height'].toString()),
                  ),
                  ListTile(
                    title: Text('Diet'),
                    subtitle: Text(profileData['diet']),
                  ),
                  ListTile(
                    title: Text('Months'),
                    subtitle: Text(profileData['months'].toString()),
                  ),
                  ListTile(
                    title: Text('Children'),
                    subtitle: Text(profileData['children'].toString()),
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

class _EditProfileForm extends StatefulWidget {
  final Map<String, dynamic> profileData;
  final Function(Map<String, dynamic>) onSave;

  _EditProfileForm({required this.profileData, required this.onSave});

  @override
  __EditProfileFormState createState() => __EditProfileFormState();
}

class __EditProfileFormState extends State<_EditProfileForm> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _contactNumberController;
  late TextEditingController _ageController;
  late TextEditingController _genderController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  late TextEditingController _dietController;
  late TextEditingController _monthsController;
  late TextEditingController _childrenController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.profileData['username']);
    _emailController = TextEditingController(text: widget.profileData['email']);
    _contactNumberController = TextEditingController(text: widget.profileData['contact_number']);
    _ageController = TextEditingController(text: widget.profileData['age'].toString());
    _genderController = TextEditingController(text: widget.profileData['gender']);
    _weightController = TextEditingController(text: widget.profileData['weight'].toString());
    _heightController = TextEditingController(text: widget.profileData['height'].toString());
    _dietController = TextEditingController(text: widget.profileData['diet']);
    _monthsController = TextEditingController(text: widget.profileData['months'].toString());
    _childrenController = TextEditingController(text: widget.profileData['children'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextField(controller: _usernameController, decoration: InputDecoration(labelText: 'Username')),
          TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
          TextField(controller: _contactNumberController, decoration: InputDecoration(labelText: 'Contact Number')),
          TextField(controller: _ageController, decoration: InputDecoration(labelText: 'Age')),
          TextField(controller: _genderController, decoration: InputDecoration(labelText: 'Gender')),
          TextField(controller: _weightController, decoration: InputDecoration(labelText: 'Weight')),
          TextField(controller: _heightController, decoration: InputDecoration(labelText: 'Height')),
          TextField(controller: _dietController, decoration: InputDecoration(labelText: 'Diet')),
          TextField(controller: _monthsController, decoration: InputDecoration(labelText: 'Months')),
          TextField(controller: _childrenController, decoration: InputDecoration(labelText: 'Children')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _contactNumberController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _dietController.dispose();
    _monthsController.dispose();
    _childrenController.dispose();
    super.dispose();
  }
}
