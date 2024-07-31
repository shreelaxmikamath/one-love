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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Gender',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                hint: const Text('Select Gender'),
                value: selectedGender,
                items: const [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                ],
                onChanged: (value) => setState(() => selectedGender = value),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text('Search by Meaning'),
                value: searchByMeaning,
                onChanged: (value) => setState(() => searchByMeaning = value ?? false),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 16),
              if (searchByMeaning)
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Enter Keyword for Meaning',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => setState(() => keyword = value),
                )
              else ...[
                const Text(
                  'Select Letter Position',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  hint: const Text('Select Letter Position'),
                  value: selectedLetterPosition,
                  items: const [
                    DropdownMenuItem(value: 'First', child: Text('First Letter')),
                    DropdownMenuItem(value: 'Last', child: Text('Last Letter')),
                  ],
                  onChanged: (value) => setState(() => selectedLetterPosition = value),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Enter Letter',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => setState(() => letter = value),
                ),
              ],
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _suggestNames,
                  icon: const Icon(Icons.search),
                  label: const Text('Suggest Names'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Suggested Names:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              suggestedNames.isEmpty
                  ? const Text('No names suggested yet.')
                  : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: suggestedNames.length,
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(suggestedNames[index]['Name'] ?? ''),
                    subtitle: Text(suggestedNames[index]['Meaning'] ?? ''),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}