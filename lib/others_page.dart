import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'checklist_page.dart'; // Import your ChecklistPage here

class OthersPage extends StatelessWidget {
  Future<int> getUserId() async {
    var url = Uri.parse('http://10.0.2.2:5000/getUserId'); // Replace with your actual backend server URL

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var userId = int.parse(jsonDecode(response.body)['user_id']);
        return userId;
      } else {
        throw Exception('Failed to load user ID');
      }
    } catch (e) {
      throw Exception('Error fetching user ID: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Others Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                try {
                  int userId = await getUserId();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChecklistPage(userId: userId), // Pass userId as int
                    ),
                  );
                } catch (e) {
                  print('Error: $e');
                  // Handle error fetching userId
                }
              },
              child: Text('Go to Checklist'),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
