import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BabyNamesPage extends StatefulWidget {
  const BabyNamesPage({super.key});

  @override
  _BabyNamesPageState createState() => _BabyNamesPageState();
}

class _BabyNamesPageState extends State<BabyNamesPage> {
  String? selectedLetterPosition;
  String? selectedGender;
  String? letter;
  bool searchByMeaning = false;
  String? keyword;
  List<Map<String, dynamic>> suggestedNames = [];

  Future<void> _suggestNames() async {
    if (selectedGender == null || (searchByMeaning && keyword == null) ||
        (!searchByMeaning && (selectedLetterPosition == null || letter == null))) {
      _showErrorDialog('Please fill in all required fields.');
      return;
    }

    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:5000/suggest_names'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'letter_position': searchByMeaning ? 'Meaning' : selectedLetterPosition,
          'letter': letter,
          'gender': selectedGender,
          'keyword_for_meaning': keyword,
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          suggestedNames = List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        _showErrorDialog('Failed to fetch names. Please try again.');
      }
    } catch (e) {
      _showErrorDialog('An error occurred. Please check your connection and try again.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Baby Names Suggestion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              hint: const Text('Select Gender'),
              value: selectedGender,
              items: const [
                DropdownMenuItem(value: 'Male', child: Text('Male')),
                DropdownMenuItem(value: 'Female', child: Text('Female')),
              ],
              onChanged: (value) => setState(() => selectedGender = value),
            ),
            CheckboxListTile(
              title: const Text('Search by Meaning'),
              value: searchByMeaning,
              onChanged: (value) => setState(() => searchByMeaning = value ?? false),
            ),
            if (searchByMeaning)
              TextField(
                decoration: const InputDecoration(labelText: 'Enter Keyword for Meaning'),
                onChanged: (value) => setState(() => keyword = value),
              )
            else ...[
              DropdownButton<String>(
                hint: const Text('Select Letter Position'),
                value: selectedLetterPosition,
                items: const [
                  DropdownMenuItem(value: 'First', child: Text('First Letter')),
                  DropdownMenuItem(value: 'Last', child: Text('Last Letter')),
                ],
                onChanged: (value) => setState(() => selectedLetterPosition = value),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Enter Letter'),
                onChanged: (value) => setState(() => letter = value),
              ),
            ],
            ElevatedButton(
              onPressed: _suggestNames,
              child: const Text('Suggest Names'),
            ),
            const SizedBox(height: 20),
            const Text('Suggested Names:', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: suggestedNames.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(suggestedNames[index]['Name'] ?? ''),
                  subtitle: Text(suggestedNames[index]['Meaning'] ?? ''),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}