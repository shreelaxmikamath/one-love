import 'package:flutter/material.dart';

class BabyShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baby Shopping List'),
      ),
      body: Center(
        child: Text(
          'Baby Shopping List Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
