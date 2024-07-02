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
                _saveProfile(); // Call _saveProfile method to initiate saving
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveProfile() {
    // Prepare updated profile data
    Map<String, dynamic> updatedProfileData = {
      'user_id': _profileData['user_id'],
      'full_name': _profileData['full_name'],
      'username': _profileData['username'],
      'email': _profileData['email'],
      'contact_number': _profileData['contact_number'],
      'age': int.tryParse(_profileData['age']) ?? 0,  // Ensure 'age' is parsed to int
      'weight': int.tryParse(_profileData['weight']) ?? 0,  // Ensure 'weight' is parsed to int
      'height': int.tryParse(_profileData['height']) ?? 0,  // Ensure 'height' is parsed to int
      'diet': _profileData['diet'],
      'months': int.tryParse(_profileData['months']) ?? 0,  // Ensure 'months' is parsed to int
      'children': int.tryParse(_profileData['children']) ?? 0,  // Ensure 'children' is parsed to int
    };

    // Call onSave method to update profile details
    _updateProfileDetails(updatedProfileData);
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
                    subtitle: Text(profileData['full_name'] ?? 'N/A'),
                  ),
                  ListTile(
                    title: Text('Username'),
                    subtitle: Text(profileData['username'] ?? 'N/A'),
                  ),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text(profileData['email'] ?? 'N/A'),
                  ),
                  ListTile(
                    title: Text('Contact Number'),
                    subtitle: Text(profileData['contact_number'] ?? 'N/A'),
                  ),
                  ListTile(
                    title: Text('Age'),
                    subtitle: Text(profileData['age']?.toString() ?? 'N/A'),
                  ),
                  ListTile(
                    title: Text('Weight'),
                    subtitle: Text(profileData['weight']?.toString() ?? 'N/A'),
                  ),
                  ListTile(
                    title: Text('Height'),
                    subtitle: Text(profileData['height']?.toString() ?? 'N/A'),
                  ),
                  ListTile(
                    title: Text('Diet'),
                    subtitle: Text(profileData['diet'] ?? 'N/A'),
                  ),
                  ListTile(
                    title: Text('Months'),
                    subtitle: Text(profileData['months']?.toString() ?? 'N/A'),
                  ),
                  ListTile(
                    title: Text('Children'),
                    subtitle: Text(profileData['children']?.toString() ?? 'N/A'),
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
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  late TextEditingController _dietController;
  late TextEditingController _monthsController;
  late TextEditingController _childrenController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.profileData['full_name'] ?? '');
    _usernameController = TextEditingController(text: widget.profileData['username'] ?? '');
    _emailController = TextEditingController(text: widget.profileData['email'] ?? '');
    _contactNumberController = TextEditingController(text: widget.profileData['contact_number'] ?? '');
    _ageController = TextEditingController(text: widget.profileData['age']?.toString() ?? '');
    _weightController = TextEditingController(text: widget.profileData['weight']?.toString() ?? '');
    _heightController = TextEditingController(text: widget.profileData['height']?.toString() ?? '');
    _dietController = TextEditingController(text: widget.profileData['diet'] ?? '');
    _monthsController = TextEditingController(text: widget.profileData['months']?.toString() ?? '');
    _childrenController = TextEditingController(text: widget.profileData['children']?.toString() ?? '');
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
              widget.profileData['full_name'] = value; // Update profileData
            },
          ),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
            onChanged: (value) {
              widget.profileData['username'] = value; // Update profileData
            },
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            onChanged: (value) {
              widget.profileData['email'] = value; // Update profileData
            },
          ),
          TextField(
            controller: _contactNumberController,
            decoration: InputDecoration(labelText: 'Contact Number'),
            onChanged: (value) {
              widget.profileData['contact_number'] = value; // Update profileData
            },
          ),
          TextField(
            controller: _ageController,
            decoration: InputDecoration(labelText: 'Age'),
            onChanged: (value) {
              widget.profileData['age'] = value; // Update profileData
            },
          ),
          TextField(
            controller: _weightController,
            decoration: InputDecoration(labelText: 'Weight'),
            onChanged: (value) {
              widget.profileData['weight'] = value; // Update profileData
            },
          ),
          TextField(
            controller: _heightController,
            decoration: InputDecoration(labelText: 'Height'),
            onChanged: (value) {
              widget.profileData['height'] = value; // Update profileData
            },
          ),
          TextField(
            controller: _dietController,
            decoration: InputDecoration(labelText: 'Diet'),
            onChanged: (value) {
              widget.profileData['diet'] = value; // Update profileData
            },
          ),
          TextField(
            controller: _monthsController,
            decoration: InputDecoration(labelText: 'Months'),
            onChanged: (value) {
              widget.profileData['months'] = value; // Update profileData
            },
          ),
          TextField(
            controller: _childrenController,
            decoration: InputDecoration(labelText: 'Children'),
            onChanged: (value) {
              widget.profileData['children'] = value; // Update profileData
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
    _weightController.dispose();
    _heightController.dispose();
    _dietController.dispose();
    _monthsController.dispose();
    _childrenController.dispose();
    super.dispose();
  }
}
