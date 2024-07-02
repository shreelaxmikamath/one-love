import 'package:flutter/material.dart';
import 'shopping_preparation_checklists.dart';
import 'journaling_memories.dart';

class OthersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Others'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShoppingPreparationChecklist(),
                  ),
                );
              },
              child: Text(
                'Shopping and Preparation Checklist',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JournalingMemories(),
                  ),
                );
              },
              child: Text(
                'Journalings and Memories',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
