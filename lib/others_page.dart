// others_page.dart
import 'package:flutter/material.dart';

class OthersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Others'),
      ),
      body: Center(
        child: Text(
          'Others Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
