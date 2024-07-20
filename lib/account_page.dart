import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_screen.dart';
import 'main.dart'; // Import MyApp to access the themeNotifier
import 'themes.dart'; // Import themes

class AccountPage extends StatefulWidget {
  final String userId;

  const AccountPage({super.key, required this.userId});

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
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
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
          const SnackBar(content: Text('Profile updated successfully')),
        );
        setState(() {
          _isEditing = false;
          _fetchUserInfo(); // Refresh the user info
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update profile')),
        );
      }
    } catch (e) {
      print('Error saving profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred while saving')),
      );
    }
  }

  Future<void> _deleteAccount() async {
    try {
      final response = await http.delete(
        Uri.parse('http://10.0.2.2:5000/delete_account'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"user_id": widget.userId}),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account deleted successfully')),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
        );
      } else {
        try {
          final responseData = json.decode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to delete account: ${responseData['error']}')),
          );
          print('Failed to delete account: ${responseData['error']}');
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to delete account: Unexpected response from server')),
          );
          print('Failed to delete account: Unexpected response from server');
        }
      }
    } catch (e) {
      print('Error deleting account: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred while deleting account')),
      );
    }
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        actions: [
          if (!_isLoading && _userInfo != null) ...[
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
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Logout') {
                  _logout();
                } else if (value == 'Delete Account') {
                  _deleteAccount();
                } else if (value == 'Change Theme') {
                  _showThemeSelectionDialog(context);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'Logout',
                  child: Text('Logout'),
                ),
                const PopupMenuItem(
                  value: 'Delete Account',
                  child: Text('Delete Account'),
                ),
                const PopupMenuItem(
                  value: 'Change Theme',
                  child: Text('Change Theme'),
                ),
              ],
              icon: const Icon(Icons.settings),
            ),
          ],
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _userInfo == null
          ? const Center(child: Text('Failed to load user information'))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveChanges,
                child: const Text('Save Changes'),
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

  void _showThemeSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Pastel Pink Theme'),
                onTap: () {
                  MyApp.themeNotifier.value = pastelPinkTheme;
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Pastel Blue Theme'),
                onTap: () {
                  MyApp.themeNotifier.value = pastelBlueTheme;
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Pastel Green Theme'),
                onTap: () {
                  MyApp.themeNotifier.value = pastelGreenTheme;
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
