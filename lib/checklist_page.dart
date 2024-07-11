import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChecklistPage extends StatefulWidget {
  final int userId;

  ChecklistPage({required this.userId});

  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  List<dynamic> _categories = [];
  List<dynamic> _items = [];
  int? _selectedCategoryId;
  final _categoryNameController = TextEditingController();
  final _itemNameController = TextEditingController();
  Map<int, bool> _categoryVisibility = {};

  Future<void> _loadCategories() async {
    var url = Uri.parse('http://10.0.2.2:5000/categories/${widget.userId}');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          _categories = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error loading categories: $e');
    }
  }

  Future<void> _loadItems(int categoryId) async {
    var url = Uri.parse('http://10.0.2.2:5000/items/${widget.userId}/$categoryId');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          _items = jsonDecode(response.body);
          // Ensure each item has an 'isSelected' field based on 'is_done'
          _items = _items.map((item) => {
            ...item,
            'isSelected': item['is_done'] == true || item['is_done'] == 1, // Handle both boolean and integer
          }).toList();
        });
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      throw Exception('Error loading items: $e');
    }
  }

  Future<void> _addCategory(String categoryName) async {
    var url = Uri.parse('http://10.0.2.2:5000/categories');
    try {
      var response = await http.post(url, headers: {
        'Content-Type': 'application/json',
      }, body: jsonEncode({
        'user_id': widget.userId,
        'category_name': categoryName,
      }));

      if (response.statusCode == 201) {
        _loadCategories();
      } else {
        throw Exception('Failed to add category');
      }
    } catch (e) {
      throw Exception('Error adding category: $e');
    }
  }

  Future<void> _addItem(int categoryId, String itemName) async {
    var url = Uri.parse('http://10.0.2.2:5000/items');
    try {
      var response = await http.post(url, headers: {
        'Content-Type': 'application/json',
      }, body: jsonEncode({
        'user_id': widget.userId,
        'category_id': categoryId,
        'item_name': itemName,
      }));

      if (response.statusCode == 201) {
        _loadItems(categoryId);
      } else {
        throw Exception('Failed to add item');
      }
    } catch (e) {
      throw Exception('Error adding item: $e');
    }
  }

  Future<void> _deleteCategory(int categoryId) async {
    var url = Uri.parse('http://10.0.2.2:5000/categories/$categoryId');
    try {
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        _loadCategories();
      } else {
        throw Exception('Failed to delete category');
      }
    } catch (e) {
      throw Exception('Error deleting category: $e');
    }
  }

  Future<void> _deleteItem(int itemId) async {
    var url = Uri.parse('http://10.0.2.2:5000/items/$itemId');
    try {
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        _loadItems(_selectedCategoryId!);
      } else {
        throw Exception('Failed to delete item');
      }
    } catch (e) {
      throw Exception('Error deleting item: $e');
    }
  }

  Future<void> _updateItem(int itemId, bool isDone) async {
    var url = Uri.parse('http://10.0.2.2:5000/items/$itemId');
    try {
      var response = await http.patch(url, headers: {
        'Content-Type': 'application/json',
      }, body: jsonEncode({
        'is_done': isDone,
      }));
      if (response.statusCode == 200) {
        // Update the local state
        setState(() {
          var item = _items.firstWhere((item) => item['id'] == itemId);
          item['isSelected'] = isDone;
          item['is_done'] = isDone;
        });
      } else {
        throw Exception('Failed to update item');
      }
    } catch (e) {
      throw Exception('Error updating item: $e');
    }
  }

  void _showAddItemDialog(BuildContext context, int categoryId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: TextField(
            controller: _itemNameController,
            decoration: InputDecoration(
              labelText: 'Item Name',
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _addItem(categoryId, _itemNameController.text);
                Navigator.of(context).pop();
                _itemNameController.clear();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showAddCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Category'),
          content: TextField(
            controller: _categoryNameController,
            decoration: InputDecoration(
              labelText: 'Category Name',
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _addCategory(_categoryNameController.text);
                Navigator.of(context).pop();
                _categoryNameController.clear();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }
  void _toggleCategoryVisibility(int categoryId) {
    setState(() {
      if (_selectedCategoryId == categoryId) {
        _selectedCategoryId = null;
        _items = [];
      } else {
        _selectedCategoryId = categoryId;
        _loadItems(categoryId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checklist Page')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final categoryId = _categories[index]['id'];
                final isVisible = _selectedCategoryId == categoryId;

                return Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(_categories[index]['category_name']),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteCategory(categoryId);
                          },
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              _showAddItemDialog(context, categoryId);
                            },
                          ),
                          IconButton(
                            icon: Icon(isVisible ? Icons.visibility_off : Icons.remove_red_eye),
                            onPressed: () {
                              _toggleCategoryVisibility(categoryId);
                            },
                          ),
                        ],
                      ),
                      if (isVisible)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _items.length,
                          itemBuilder: (context, itemIndex) {
                            return ListTile(
                              title: Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: _items[itemIndex]['isSelected'] == true || _items[itemIndex]['isSelected'] == 1,
                                    onChanged: (bool? value) {
                                      _updateItem(_items[itemIndex]['id'], value ?? false);
                                    },
                                  ),
                                  Text(_items[itemIndex]['item_name']),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _deleteItem(_items[itemIndex]['id']);
                                },
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showAddCategoryDialog(context);
            },
            child: Text('Add Category'),
          ),
        ],
      ),
    );
  }
}