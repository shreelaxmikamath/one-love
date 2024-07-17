import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NutritionRecommendationPage extends StatefulWidget {
  @override
  _NutritionRecommendationPageState createState() => _NutritionRecommendationPageState();
}

class _NutritionRecommendationPageState extends State<NutritionRecommendationPage> {
  final _formKey = GlobalKey<FormState>();
  int? _pregnancyWeek;
  double? _weight;
  double? _height;
  String? _activityLevel;
  Map<String, dynamic>? _recommendation;
  bool _isLoading = false;

  final List<String> _activityLevels = ['Sedentary', 'Lightly Active', 'Moderately Active', 'Very Active'];

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
        _recommendation = null;
      });

      try {
        final response = await http.post(
          Uri.parse('http://10.0.2.2:5000/nutrition_recommendation'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            'pregnancy_week': _pregnancyWeek,
            'weight': _weight,
            'height': _height,
            'activity_level': _activityLevel,
          }),
        );

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          setState(() {
            _recommendation = json.decode(response.body);
          });
        } else {
          throw Exception('Failed to get recommendation: ${response.statusCode} ${response.body}');
        }
      } catch (e) {
        print('Error details: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nutrition Recommendation')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Pregnancy Week'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pregnancy week';
                  }
                  return null;
                },
                onSaved: (value) => _pregnancyWeek = int.parse(value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
                onSaved: (value) => _weight = double.parse(value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Height (cm)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your height';
                  }
                  return null;
                },
                onSaved: (value) => _height = double.parse(value!),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Activity Level'),
                items: _activityLevels.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your activity level';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _activityLevel = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                child: _isLoading ? CircularProgressIndicator() : Text('Get Recommendation'),
              ),
              SizedBox(height: 20),
              if (_recommendation != null) ...[
                Text('Recommended Daily Intake:',
                    style: Theme.of(context).textTheme.titleLarge),
                Text('Calories: ${_recommendation!['calories'].toStringAsFixed(2)} kcal'),
                Text('Protein: ${_recommendation!['protein'].toStringAsFixed(2)} g'),
                Text('Carbohydrates: ${_recommendation!['carbs'].toStringAsFixed(2)} g'),
                Text('Fat: ${_recommendation!['fat'].toStringAsFixed(2)} g'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}