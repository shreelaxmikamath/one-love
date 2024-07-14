import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BabyNamesPage extends StatefulWidget {
  @override
  _BabyNamesPageState createState() => _BabyNamesPageState();
}

class _BabyNamesPageState extends State<BabyNamesPage> {
  String? selectedLetter;
  String? selectedGender;
  List<String> suggestedNames = [];

  void _suggestNames() async {
    if (selectedLetter != null && selectedGender != null) {
      String letter = '';

      // Show a dialog to input the letter
      showDialog(
        context: context,
        builder: (context) {
          String userInput = '';
          return AlertDialog(
            title: Text('Enter Letter'),
            content: TextField(
              onChanged: (value) {
                userInput = value;
              },
              decoration: InputDecoration(hintText: 'Enter a letter'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  letter = userInput;
                  Navigator.of(context).pop();
                  _fetchSuggestedNames(letter);
                },
                child: Text('Submit'),
              ),
            ],
          );
        },
      );
    }
  }

  void _fetchSuggestedNames(String letter) async {
    var response = await http.post(
      Uri.parse('http://10.0.2.2:5000/suggest_names'), // Replace with your Flask API URL
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'letter_position': selectedLetter,
        'letter': letter,
        'gender': selectedGender,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        suggestedNames = List<String>.from(json.decode(response.body));
      });
    } else {
      print("Failed to fetch names!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baby Names Suggestion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              hint: Text('Select Letter Position'),
              value: selectedLetter,
              items: [
                DropdownMenuItem(child: Text('First Letter'), value: 'First'),
                DropdownMenuItem(child: Text('Last Letter'), value: 'Last'),
              ],
              onChanged: (value) {
                setState(() {
                  selectedLetter = value;
                });
              },
            ),
            DropdownButton<String>(
              hint: Text('Select Gender'),
              value: selectedGender,
              items: [
                DropdownMenuItem(child: Text('Male'), value: 'Male'),
                DropdownMenuItem(child: Text('Female'), value: 'Female'),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: _suggestNames,
              child: Text('Suggest Names'),
            ),
            SizedBox(height: 20),
            Text('Suggested Names:', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: suggestedNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(suggestedNames[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
