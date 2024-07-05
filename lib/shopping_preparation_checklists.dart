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
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();

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

  void _addCategory() {
    setState(() {
      final newCategory = _categoryController.text.trim();
      if (newCategory.isNotEmpty) {
        shoppingPreparationChecklists.add(ShoppingPreparationChecklist(
          category: newCategory,
          items: [],
        ));
        checkedItems[newCategory] = {};
        _categoryController.clear();
      }
    });
  }

  void _addItem(String category) {
    setState(() {
      final newItem = _itemController.text.trim();
      if (newItem.isNotEmpty) {
        final categoryIndex = shoppingPreparationChecklists.indexWhere(
                (checklist) => checklist.category == category);
        if (categoryIndex != -1) {
          shoppingPreparationChecklists[categoryIndex].items.add(newItem);
          checkedItems[category]![newItem] = false;
          _itemController.clear();
        }
      }
    });
    Navigator.of(context).pop();
  }

  void _showAddItemDialog(String category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Item to $category'),
          content: TextField(
            controller: _itemController,
            decoration: InputDecoration(labelText: 'New Item'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                _addItem(category);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Preparation Checklist')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: 'New Category',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addCategory,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shoppingPreparationChecklists.length,
              itemBuilder: (context, index) {
                final checklist = shoppingPreparationChecklists[index];
                return ExpansionTile(
                  title: Text(checklist.category),
                  children: [
                    ...checklist.items.map((item) {
                      return CheckboxListTile(
                        title: Text(item),
                        value: checkedItems[checklist.category]![item] ?? false,
                        onChanged: (bool? value) {
                          setState(() {
                            if (checkedItems.containsKey(checklist.category)) {
                              checkedItems[checklist.category]![item] =
                                  value ?? false;
                            }
                          });
                        },
                      );
                    }).toList(),
                    ListTile(
                      title: Text('Add new item'),
                      trailing: Icon(Icons.add),
                      onTap: () => _showAddItemDialog(checklist.category),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ChecklistPage()));
}
