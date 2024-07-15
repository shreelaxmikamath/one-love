import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklist App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChecklistPage(userId: 1), // Replace with your user ID logic
    );
  }
}

class ChecklistPage extends StatefulWidget {
  final int userId;

  const ChecklistPage({super.key, required this.userId});

  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  List<Category> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/categories?user_id=${widget.userId}'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        categories = data.map((item) => Category.fromJson(item)).toList();
        isLoading = false;
      });
    } else {
      print('Failed to fetch categories');
    }
  }

  Future<void> addCategory(String name) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/categories'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'user_id': widget.userId, 'name': name}),
    );
    if (response.statusCode == 201) {
      fetchCategories();
    } else {
      print('Failed to add category');
    }
  }

  Future<void> deleteCategory(int categoryId) async {
    final response = await http.delete(Uri.parse('http://10.0.2.2:5000/categories/$categoryId'));
    if (response.statusCode == 200) {
      fetchCategories();
    } else {
      print('Failed to delete category');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : categories.isEmpty
          ? const Center(child: Text('Empty'))
          : ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryTile(
            category: categories[index],
            onDelete: () => deleteCategory(categories[index].id),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newCategoryName = '';
              return AlertDialog(
                title: const Text('Add New Category'),
                content: TextField(
                  onChanged: (value) {
                    newCategoryName = value;
                  },
                  decoration: const InputDecoration(hintText: "Enter category name"),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Add'),
                    onPressed: () {
                      if (newCategoryName.isNotEmpty) {
                        addCategory(newCategoryName);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Category {
  final int id;
  final String name;
  List<ChecklistItem> items = [];
  bool isExpanded = false;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ChecklistItem {
  final int id;
  final String name;
  bool isChecked;

  ChecklistItem({required this.id, required this.name, this.isChecked = false});

  factory ChecklistItem.fromJson(Map<String, dynamic> json) {
    return ChecklistItem(
      id: json['id'],
      name: json['name'],
      isChecked: json['is_checked'] == 1,
    );
  }
}

class CategoryTile extends StatefulWidget {
  final Category category;
  final VoidCallback onDelete;

  const CategoryTile({super.key, required this.category, required this.onDelete});

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  bool _isExpanded = false;

  void toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded && widget.category.items.isEmpty) {
      fetchItems();
    }
  }

  Future<void> fetchItems() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/checklist_items/${widget.category.id}'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        widget.category.items = data.map((item) => ChecklistItem.fromJson(item)).toList();
      });
    } else {
      print('Failed to fetch items');
    }
  }

  Future<void> addItem(String name) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/checklist_items'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'category_id': widget.category.id, 'name': name}),
    );
    print('Request: ${response.request}');
    print('Response: ${response.statusCode} - ${response.body}');
    if (response.statusCode == 201) {
      fetchItems();
    } else {
      print('Failed to add item. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  Future<void> deleteItem(int itemId) async {
    final response = await http.delete(Uri.parse('http://10.0.2.2:5000/checklist_items/$itemId'));
    if (response.statusCode == 200) {
      fetchItems();
    } else {
      print('Failed to delete item');
    }
  }

  Future<void> updateItem(int itemId, bool isChecked) async {
    final response = await http.put(
      Uri.parse('http://10.0.2.2:5000/checklist_items/$itemId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'is_checked': isChecked ? 1 : 0}), // Update the is_checked value
    );
    if (response.statusCode != 200) {
      print('Failed to update item');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Text(widget.category.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: _isExpanded ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                      onPressed: toggleExpansion,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            String newItemName = '';
                            return AlertDialog(
                              title: const Text('Add New Item'),
                              content: TextField(
                                onChanged: (value) {
                                  newItemName = value;
                                },
                                decoration: const InputDecoration(hintText: "Enter item name"),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Add'),
                                  onPressed: () {
                                    if (newItemName.isNotEmpty) {
                                      addItem(newItemName);
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: widget.onDelete,
                    ),
                  ],
                ),
              ),
              if (_isExpanded)
                Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                ),
              if (_isExpanded)
                Column(
                  children: widget.category.items.isEmpty
                      ? [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Empty'),
                    )
                  ]
                      : widget.category.items.map((item) {
                    return ListTile(
                      title: Text(item.name),
                      leading: Checkbox(
                        value: item.isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            item.isChecked = value!;
                            updateItem(item.id, item.isChecked);
                          });
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteItem(item.id),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
