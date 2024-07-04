import 'package:flutter/material.dart';

class PrescriptionsPage extends StatelessWidget {
  final List<String> _prescriptions = ['Prescription 1', 'Prescription 2']; // Example data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Prescriptions'),
      ),
      body: ListView.builder(
        itemCount: _prescriptions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_prescriptions[index]),
          );
        },
      ),
    );
  }
}
