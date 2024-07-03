import 'package:flutter/material.dart';
import 'hospital_bag_checklist.dart'; // Import the correct file
import 'baby_shopping_list.dart';
import 'personal_checklist.dart';

class ShoppingPreparationChecklist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shopping and Preparation Checklist'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Hospital Bag'),
              Tab(text: 'Baby Shopping'),
              Tab(text: 'Personal'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HospitalBagChecklistPage(userId: 1), // Adjust userId as per your requirement
            BabyShoppingList(),
            PersonalChecklist(),
          ],
        ),
      ),
    );
  }
}
