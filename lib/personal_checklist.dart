import 'package:flutter/material.dart';

class PersonalChecklist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Checklist'),
      ),
      body: Center(
        child: Text(
          'Personal Checklist Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
