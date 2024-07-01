import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  List<String> _savedNotes = []; // List to store saved notes

  @override
  void initState() {
    super.initState();
    _noteFocus = FocusNode();
  }

  @override
  void dispose() {
    _noteFocus.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: GestureDetector(
        onTap: () {
          // When the user taps anywhere on the screen, unfocus the text field to dismiss the keyboard
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
                SizedBox(height: 20), // Adjusted spacing for layout
                _buildSavedNotes(), // Display saved notes
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
            Text(note),
            SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }

  void _saveNote() async {
    var note = _noteController.text;
    if (note.isEmpty) {
      // Display a snackbar or alert to inform the user to enter a note
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter a note.")));
      return;
    }

    // Replace with your API endpoint to save note to the database
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
      // Note saved successfully
      setState(() {
        _savedNotes.add(note); // Add new note to the list of saved notes
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Note saved successfully!")));
    } else {
      // Handle error case
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to save note!")));
    }

    // Clear text field after saving note
    _noteController.clear();
  }
}
