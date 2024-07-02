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

  Future<void> _updateProfileDetails(Map<String, dynamic> updatedProfileData) async {
    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:5000/save_profile'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updatedProfileData),
      );

      if (response.statusCode == 200) {
        setState(() {
          _profileData = updatedProfileData;
          _profileDetails = Future.value(updatedProfileData);
        });
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
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
                _updateProfileDetails(_profileData);
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
                    title: Text('Full Name'),
                    subtitle: Text(profileData['full_name']),
                  ),
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
  late TextEditingController _fullNameController;
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
    _fullNameController = TextEditingController(text: widget.profileData['full_name']);
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
          TextField(
            controller: _fullNameController,
            decoration: InputDecoration(labelText: 'Full Name'),
            onChanged: (value) {
              // Update full name in profileData when text changes
              widget.profileData['full_name'] = value;
            },
          ),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
            onChanged: (value) {
              widget.profileData['username'] = value;
            },
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            onChanged: (value) {
              widget.profileData['email'] = value;
            },
          ),
          TextField(
            controller: _contactNumberController,
            decoration: InputDecoration(labelText: 'Contact Number'),
            onChanged: (value) {
              widget.profileData['contact_number'] = value;
            },
          ),
          TextField(
            controller: _ageController,
            decoration: InputDecoration(labelText: 'Age'),
            onChanged: (value) {
              widget.profileData['age'] = int.tryParse(value) ?? 0;
            },
          ),
          TextField(
            controller: _genderController,
            decoration: InputDecoration(labelText: 'Gender'),
            onChanged: (value) {
              widget.profileData['gender'] = value;
            },
          ),
          TextField(
            controller: _weightController,
            decoration: InputDecoration(labelText: 'Weight'),
            onChanged: (value) {
              widget.profileData['weight'] = int.tryParse(value) ?? 0;
            },
          ),
          TextField(
            controller: _heightController,
            decoration: InputDecoration(labelText: 'Height'),
            onChanged: (value) {
              widget.profileData['height'] = int.tryParse(value) ?? 0;
            },
          ),
          TextField(
            controller: _dietController,
            decoration: InputDecoration(labelText: 'Diet'),
            onChanged: (value) {
              widget.profileData['diet'] = value;
            },
          ),
          TextField(
            controller: _monthsController,
            decoration: InputDecoration(labelText: 'Months'),
            onChanged: (value) {
              widget.profileData['months'] = int.tryParse(value) ?? 0;
            },
          ),
          TextField(
            controller: _childrenController,
            decoration: InputDecoration(labelText: 'Children'),
            onChanged: (value) {
              widget.profileData['children'] = int.tryParse(value) ?? 0;
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
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

  void _saveProfile() {
    // Prepare updated profile data
    Map<String, dynamic> updatedProfileData = {
      'user_id': widget.profileData['user_id'],
      'full_name': _fullNameController.text,
      'username': _usernameController.text,
      'email': _emailController.text,
      'contact_number': _contactNumberController.text,
      'age': int.tryParse(_ageController.text) ?? 0,
      'gender': _genderController.text,
      'weight': int.tryParse(_weightController.text) ?? 0,
      'height': int.tryParse(_heightController.text) ?? 0,
      'diet': _dietController.text,
      'months': int.tryParse(_monthsController.text) ?? 0,
      'children': int.tryParse(_childrenController.text) ?? 0,
    };

    // Call onSave method to update profile details
    widget.onSave(updatedProfileData);
  }
}

