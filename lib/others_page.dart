import 'package:flutter/material.dart';
import 'checklist.dart';  // Import the checklist.dart file

class OthersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Others Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChecklistPage(), // Navigate to ChecklistPage
                  ),
                );
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
