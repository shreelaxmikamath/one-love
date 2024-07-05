import 'package:flutter/material.dart';

class ChecklistPage extends StatefulWidget {
  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  List<Category> categories = [];

  void _addCategory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String categoryName = "";
        return AlertDialog(
          title: Text("Add Category"),
          content: TextField(
            onChanged: (value) {
              categoryName = value;
            },
            decoration: InputDecoration(hintText: "Category Name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Add"),
              onPressed: () {
                setState(() {
                  categories.add(Category(name: categoryName, items: []));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteCategory(int index) {
    setState(() {
      categories.removeAt(index);
    });
  }

  void _addItem(int categoryIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String itemName = "";
        return AlertDialog(
          title: Text("Add Item"),
          content: TextField(
            onChanged: (value) {
              itemName = value;
            },
            decoration: InputDecoration(hintText: "Item Name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Add"),
              onPressed: () {
                setState(() {
                  categories[categoryIndex].items.add(ChecklistItem(name: itemName));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(int categoryIndex, int itemIndex) {
    setState(() {
      categories[categoryIndex].items.removeAt(itemIndex);
    });
  }

  void _toggleItem(int categoryIndex, int itemIndex) {
    setState(() {
      categories[categoryIndex].items[itemIndex].isChecked =
      !categories[categoryIndex].items[itemIndex].isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addCategory,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Row(
              children: [
                Expanded(child: Text(categories[index].name)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _addItem(index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteCategory(index),
                ),
              ],
            ),
            children: [
              ...categories[index].items.map((item) {
                int itemIndex = categories[index].items.indexOf(item);
                return ListTile(
                  leading: Checkbox(
                    value: item.isChecked,
                    onChanged: (value) {
                      _toggleItem(index, itemIndex);
                    },
                  ),
                  title: Text(item.name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteItem(index, itemIndex),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}

class Category {
  String name;
  List<ChecklistItem> items;

  Category({required this.name, required this.items});
}

class ChecklistItem {
  String name;
  bool isChecked;

  ChecklistItem({required this.name, this.isChecked = false});
}
