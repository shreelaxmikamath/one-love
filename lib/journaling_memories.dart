import 'package:flutter/material.dart';

class JournalingMemories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journaling and Memories'),
      ),
      body: Center(
        child: Text(
          'Journaling and Memories Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
