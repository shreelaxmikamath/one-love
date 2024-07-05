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
  bool _isEditing = false;
  Map<String, dynamic>? _userInfo;
  bool _isLoading = true;

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
    _fetchUserInfo();
  }

  Future<void> _fetchUserInfo() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5000/user_info?user_id=${widget.userId}'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _userInfo = json.decode(response.body);
          _initControllers();
          _isLoading = false;
        });
      } else {
        print('Failed to load user info');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching user info: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _initControllers() {
    _fullNameController = TextEditingController(text: _userInfo?['full_name'] ?? '');
    _usernameController = TextEditingController(text: _userInfo?['username'] ?? '');
    _emailController = TextEditingController(text: _userInfo?['email'] ?? '');
    _contactNumberController = TextEditingController(text: _userInfo?['contact_number'] ?? '');
    _ageController = TextEditingController(text: _userInfo?['age']?.toString() ?? '');
    _weightController = TextEditingController(text: _userInfo?['weight']?.toString() ?? '');
    _heightController = TextEditingController(text: _userInfo?['height']?.toString() ?? '');
    _dietController = TextEditingController(text: _userInfo?['diet'] ?? '');
    _monthsController = TextEditingController(text: _userInfo?['months']?.toString() ?? '');
    _childrenController = TextEditingController(text: _userInfo?['children']?.toString() ?? '');
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value ?? 'N/A'),
        ],
      ),
    );
  }

  Widget _buildEditableRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  Future<void> _saveChanges() async {
    final updatedInfo = {
      "user_id": widget.userId,
      "full_name": _fullNameController.text,
      "username": _usernameController.text,
      "email": _emailController.text,
      "contact_number": _contactNumberController.text,
      "age": _ageController.text,
      "weight": _weightController.text,
      "height": _heightController.text,
      "diet": _dietController.text,
      "months": _monthsController.text,
      "children": _childrenController.text,
    };

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/save_profile'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updatedInfo),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')),
        );
        setState(() {
          _isEditing = false;
          _fetchUserInfo(); // Refresh the user info
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile')),
        );
      }
    } catch (e) {
      print('Error saving profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred while saving')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: [
          if (!_isLoading && _userInfo != null)
            IconButton(
              icon: Icon(_isEditing ? Icons.cancel : Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                  if (!_isEditing) {
                    _fetchUserInfo(); // Reset to original values if cancelling
                  }
                });
              },
            ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _userInfo == null
          ? Center(child: Text('Failed to load user information'))
          : SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_isEditing) ...[
              _buildEditableRow('Full Name', _fullNameController),
              _buildEditableRow('Username', _usernameController),
              _buildEditableRow('Email', _emailController),
              _buildEditableRow('Contact Number', _contactNumberController),
              _buildEditableRow('Age', _ageController),
              _buildEditableRow('Weight', _weightController),
              _buildEditableRow('Height', _heightController),
              _buildEditableRow('Diet', _dietController),
              _buildEditableRow('Months', _monthsController),
              _buildEditableRow('Children', _childrenController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Save Changes'),
              ),
            ] else ...[
              _buildInfoRow('Full Name', _userInfo?['full_name']),
              _buildInfoRow('Username', _userInfo?['username']),
              _buildInfoRow('Email', _userInfo?['email']),
              _buildInfoRow('Contact Number', _userInfo?['contact_number']),
              _buildInfoRow('Age', _userInfo?['age']?.toString()),
              _buildInfoRow('Weight', _userInfo?['weight']?.toString()),
              _buildInfoRow('Height', _userInfo?['height']?.toString()),
              _buildInfoRow('Diet', _userInfo?['diet']),
              _buildInfoRow('Months', _userInfo?['months']?.toString()),
              _buildInfoRow('Children', _userInfo?['children']?.toString()),
            ],
          ],
        ),
      ),
    );
  }
}