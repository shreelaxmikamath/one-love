// insights_page.dart
import 'package:flutter/material.dart';

class InsightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'),
      ),
      body: Center(
        child: Text(
          'Insights Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
