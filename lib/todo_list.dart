import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoListPage extends StatefulWidget {
  final String userId;

  const TodoListPage({Key? key, required this.userId}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Map<String, dynamic>> _todos = [];

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  void _fetchTodos() async {
    var response = await http.get(Uri.parse('http://YOUR_FLASK_SERVER_IP:5000/get_todos?user_id=${widget.userId}'));
    if (response.statusCode == 200) {
      setState(() {
        _todos = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Todo List for User ID: ${widget.userId}'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todos[index]['todo']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
