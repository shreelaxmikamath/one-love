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

  @override
  void initState() {
    super.initState();
    _noteFocus = FocusNode();
  }

  @override
  void dispose() {
    _noteFocus.dispose();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendar(),
            SizedBox(height: 20),
            _buildNoteTextField(),
            SizedBox(height: 20),
            _buildSaveButton(),
          ],
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

  void _saveNote() async {
    var note = _noteController.text;
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
      print("Note saved successfully!");
      // Optionally, you can show a success message or navigate back
    } else {
      // Handle error case
      print("Failed to save note!");
    }
  }
}
