import 'package:flutter/material.dart';
import 'shopping_preparation_checklists.dart';

class OthersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Others Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChecklistPage(), // or whatever your target page is
              ),
            );
          },
          child: Text('Go to Checklist'),
        ),
      ),
    );
  }
}
