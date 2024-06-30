import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _timeString;
  late String _username;
  late String _email;
  late String _contactNumber;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    _loadUserInfo();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";
  }

  void _loadUserInfo() async {
    // Load user information from the database
    var response = await http.get(
      Uri.parse('http://10.0.2.2:5000/user_info'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        _username = data['username'];
        _email = data['email'];
        _contactNumber = data['contact_number'];
      });
    } else {
      print("Failed to load user information!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asteria'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              // Navigate to Chatbot screen
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("User Information"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Name: $_username"),
                        Text("Email: $_email"),
                        Text("Contact Number: $_contactNumber"),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          _timeString,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
