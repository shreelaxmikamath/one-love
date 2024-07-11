import 'package:flutter/material.dart';
import 'checklist_page.dart';

class OthersPage extends StatelessWidget {
  final int userId;

  OthersPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Others Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChecklistPage(userId: userId)),
            );
          },
          child: Text('Go to Checklist Page'),
        ),
      ),
    );
  }
}
