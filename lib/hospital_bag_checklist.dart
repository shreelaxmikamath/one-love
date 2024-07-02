import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HospitalBagChecklistPage extends StatefulWidget {
  final int userId;

  HospitalBagChecklistPage({Key? key, required this.userId}) : super(key: key);

  @override
  _HospitalBagChecklistPageState createState() =>
      _HospitalBagChecklistPageState();
}

class _HospitalBagChecklistPageState extends State<HospitalBagChecklistPage> {
  List<Map<String, dynamic>> checklistItems = [];

  @override
  void initState() {
    super.initState();
    fetchChecklistItems();
  }

  Future<void> fetchChecklistItems() async {
    final response = await http.get(
      Uri.parse('http://localhost:5000/checklist_items?user_id=${widget.userId}'),
    );

    if (response.statusCode == 200) {
      setState(() {
        checklistItems = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      });
    } else {
      // Handle error
      print('Failed to load checklist items');
    }
  }

  Future<void> addItem(String itemName) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/add_checklist_item'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': widget.userId,
        'item_name': itemName,
      }),
    );

    if (response.statusCode == 201) {
      fetchChecklistItems(); // Refresh checklist after adding item
    } else {
      // Handle error
      print('Failed to add item');
    }
  }

  Future<void> updateItem(int itemId, bool checked) async {
    final response = await http.put(
      Uri.parse('http://localhost:5000/update_checklist_item'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'item_id': itemId,
        'checked': checked,
      }),
    );

    if (response.statusCode == 200) {
      fetchChecklistItems(); // Refresh checklist after updating item
    } else {
      // Handle error
      print('Failed to update item');
    }
  }

  Future<void> deleteItem(int itemId) async {
    final response = await http.delete(
      Uri.parse('http://localhost:5000/delete_checklist_item/$itemId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      fetchChecklistItems(); // Refresh checklist after deleting item
    } else {
      // Handle error
      print('Failed to delete item');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Bag Checklist'),
      ),
      body: ListView.builder(
        itemCount: checklistItems.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(checklistItems[index]['item_name']),
            value: checklistItems[index]['checked'],
            onChanged: (bool? checked) {
              if (checked != null) {
                updateItem(checklistItems[index]['id'], checked);
              }
            },
            secondary: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                deleteItem(checklistItems[index]['id']);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController controller = TextEditingController();
              return AlertDialog(
                title: Text('Add New Item'),
                content: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Enter item name',
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      String itemName = controller.text.trim();
                      if (itemName.isNotEmpty) {
                        addItem(itemName);
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
