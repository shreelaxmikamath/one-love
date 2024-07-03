import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'notifications_page.dart';

class CalendarPage extends StatefulWidget {
  final String userId;

  CalendarPage({required this.userId});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _selectedDate = DateTime.now();
  late TextEditingController _noteController = TextEditingController();
  late FocusNode _noteFocus;
  List<Map<String, dynamic>> _savedNotes = []; // List to store saved notes with IDs

  @override
  void initState() {
    super.initState();
    _noteFocus = FocusNode();
    _fetchNotes(); // Fetch notes for the initial selected date
  }

  @override
  void dispose() {
    _noteFocus.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _fetchNotes() async {
    var response = await http.get(Uri.parse('http://10.0.2.2:5000/get_notes?user_id=${widget.userId}&date=${_selectedDate.toString().substring(0, 10)}'));
    if (response.statusCode == 200) {
      setState(() {
        _savedNotes = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    }
  }

  void _saveNote() async {
    var note = _noteController.text;
    if (note.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter a note.")));
      return;
    }

    var response = await http.post(
      Uri.parse('http://10.0.2.2:5000/save_note'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "user_id": widget.userId,
        "date": _selectedDate.toString().substring(0, 10),
        "note": note,
      }),
    );

    if (response.statusCode == 200) {
      _fetchNotes(); // Refresh notes after saving a new one
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Note saved successfully!")));
      _noteController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to save note!")));
    }
  }

  void _editNote(int noteId, String newNote) async {
    var response = await http.put(
      Uri.parse('http://10.0.2.2:5000/edit_note'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "note_id": noteId,
        "note": newNote,
      }),
    );

    if (response.statusCode == 200) {
      _fetchNotes(); // Refresh notes after editing
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Note edited successfully!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to edit note!")));
    }
  }

  void _deleteNote(int noteId) async {
    var response = await http.delete(
      Uri.parse('http://10.0.2.2:5000/delete_note'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"note_id": noteId}),
    );

    if (response.statusCode == 200) {
      _fetchNotes(); // Refresh notes after deleting
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Note deleted successfully!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to delete note!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage(userId: widget.userId)),
              );
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          _noteFocus.unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCalendar(),
                SizedBox(height: 20),
                _buildNoteTextField(),
                SizedBox(height: 20),
                _buildSaveButton(),
                SizedBox(height: 20),
                _buildSavedNotes(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      focusedDay: _selectedDate,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDate, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDate = selectedDay;
          _fetchNotes(); // Fetch notes for the new selected date
        });
      },
    );
  }

  Widget _buildNoteTextField() {
    return TextField(
      focusNode: _noteFocus,
      controller: _noteController,
      decoration: InputDecoration(
        labelText: 'Add Note',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        _saveNote();
      },
      child: Text('Save Note'),
    );
  }

  Widget _buildSavedNotes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _savedNotes.map((note) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saved Note:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(note['note']),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _noteController.text = note['note'];
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Edit Note'),
                        content: TextField(
                          controller: _noteController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              _editNote(note['id'], _noteController.text);
                              Navigator.of(context).pop();
                            },
                            child: Text('Save'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteNote(note['id']);
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }
}
