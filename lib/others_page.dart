import 'package:flutter/material.dart';
import 'checklist_page.dart';

class OthersPage extends StatelessWidget {
  final int userId;

  const OthersPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Others Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChecklistPage(userId: userId)),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Set button background to white
          ),
          child: const Text(
            'Go to Checklist Page',
            style: TextStyle(color: Colors.black), // Set text color to black
          ),
        ),
      ),
    );
  }
}