import 'package:flutter/material.dart';

class ShoppingPreparationChecklist {
  String category;
  List<String> items;

  ShoppingPreparationChecklist({required this.category, required this.items});
}

List<ShoppingPreparationChecklist> shoppingPreparationChecklists = [
  ShoppingPreparationChecklist(
    category: "Important Document",
    items: [
      "Photo ID",
      "Hospital form",
      "Insurance details",
      "Birthing plan (if you have one)",
    ],
  ),
  ShoppingPreparationChecklist(
    category: "Personal Items",
    items: [
      "Eyeglasses (if you do wear them)",
      "Charger and cell phone",
      "USB charger cable",
      "Portable power bank",
    ],
  ),
  ShoppingPreparationChecklist(
    category: "Comfort Items",
    items: [
      "2-3 pairs of non-skid socks",
      "A warm sweater or robe",
    ],
  ),
  ShoppingPreparationChecklist(
    category: "Snacks",
    items: [
      "Sugar-free candy",
      "Non-perishable snacks",
    ],
  ),
  ShoppingPreparationChecklist(
    category: "Clothing",
    items: [
      "Maternity bras (without an underwire)",
      "Lightweight clothes",
      "Comfortable maternity clothes to wear in the hospital",
    ],
  ),
  ShoppingPreparationChecklist(
    category: "Toiletries",
    items: [
      "Toothbrush",
      "Toothpaste",
      "Deodorant",
      "Lip balm",
      "Face wash",
      "Headband or rubber bands",
      "Moisturizer",
      "Shampoo",
      "Conditioner",
    ],
  ),
];

class ChecklistPage extends StatefulWidget {
  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  Map<String, Map<String, bool>> checkedItems = {};

  @override
  void initState() {
    super.initState();
    // Initialize checkedItems map with false for each item
    shoppingPreparationChecklists.forEach((category) {
      checkedItems[category.category] = {};
      category.items.forEach((item) {
        checkedItems[category.category]![item] = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Preparation Checklist')),
      body: ListView.builder(
        itemCount: shoppingPreparationChecklists.length,
        itemBuilder: (context, index) {
          final checklist = shoppingPreparationChecklists[index];
          return ExpansionTile(
            title: Text(checklist.category),
            children: checklist.items.map((item) {
              return CheckboxListTile(
                title: Text(item),
                value: checkedItems[checklist.category]![item] ?? false,
                onChanged: (bool? value) {
                  setState(() {
                    if (checkedItems.containsKey(checklist.category)) {
                      checkedItems[checklist.category]![item] = value ?? false;
                    }
                  });
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ChecklistPage()));
}
