import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  late double _height = 0.0;
  late double _weight = 0.0;
  late int _monthsPregnant = 0;
  late bool _hasDiabetes = false;
  late String _currentExerciseLevel = "";
  late String _exercisePreferences = "";
  late String _medicalHistory = "";
  String _userId = "";

  final _formKey = GlobalKey<FormState>();
  final List<String> _exerciseLevels = ["Easy", "Moderate", "Tough"];

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
  }

  void _fetchCurrentUser() async {
    _userId = "current_user_id"; // Placeholder for current user ID
    print("Fetched User ID: $_userId");
    _fetchUserProfile();
  }

  void _fetchUserProfile() async {
    try {
      var response = await http.get(
        Uri.parse('http://10.0.2.2:5000/user_info?user_id=$_userId'), // Replace with your endpoint
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          _height = data['height'];
          _weight = data['weight'];
          _monthsPregnant = data['months'];
          _hasDiabetes = data['hasDiabetes'];
          _currentExerciseLevel = data['currentExerciseLevel'];
          _exercisePreferences = data['exercisePreferences'];
          _medicalHistory = data['medicalHistory'];
        });
        print("User profile fetched successfully for user ID: $_userId");
      } else {
        print("Failed to load user profile details! Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }

  void _onStartExercisePressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Implement your logic to suggest exercises based on user details and additional features
      print("Starting exercise for user...");
      // Example: Navigate to another page or show exercise recommendations
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter your health details:',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: _height.toString(),
                  decoration: const InputDecoration(labelText: 'Height (cm)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _height = double.parse(value!);
                  },
                ),
                TextFormField(
                  initialValue: _weight.toString(),
                  decoration: const InputDecoration(labelText: 'Weight (kg)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _weight = double.parse(value!);
                  },
                ),
                TextFormField(
                  initialValue: _monthsPregnant.toString(),
                  decoration: const InputDecoration(labelText: 'Months Pregnant'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter months pregnant';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _monthsPregnant = int.parse(value!);
                  },
                ),
                SwitchListTile(
                  title: const Text('Has Diabetes'),
                  value: _hasDiabetes,
                  onChanged: (value) {
                    setState(() {
                      _hasDiabetes = value;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _currentExerciseLevel.isEmpty ? null : _currentExerciseLevel,
                  decoration: const InputDecoration(labelText: 'Current Exercise Level'),
                  items: _exerciseLevels.map((String level) {
                    return DropdownMenuItem<String>(
                      value: level,
                      child: Text(level),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _currentExerciseLevel = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your current exercise level';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _currentExerciseLevel = value!;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _exercisePreferences.isEmpty ? null : _exercisePreferences,
                  decoration: const InputDecoration(labelText: 'Exercise Preferences'),
                  items: [
                    DropdownMenuItem(
                      value: 'Walking',
                      child: Text('Walking'),
                    ),
                    DropdownMenuItem(
                      value: 'Swimming',
                      child: Text('Swimming'),
                    ),
                    DropdownMenuItem(
                      value: 'Prenatal Yoga',
                      child: Text('Prenatal Yoga'),
                    ),
                    DropdownMenuItem(
                      value: 'Modified Pilates',
                      child: Text('Modified Pilates'),
                    ),
                    DropdownMenuItem(
                      value: 'Stationary Cycling',
                      child: Text('Stationary Cycling'),
                    ),
                    DropdownMenuItem(
                      value: 'Water Aerobics',
                      child: Text('Water Aerobics'),
                    ),
                    DropdownMenuItem(
                      value: 'Dancing (Zumba, Dance Aerobics)',
                      child: Text('Dancing (Zumba, Dance Aerobics)'),
                    ),
                    DropdownMenuItem(
                      value: 'Low-impact Aerobics',
                      child: Text('Low-impact Aerobics'),
                    ),
                    DropdownMenuItem(
                      value: 'Light Weight Training',
                      child: Text('Light Weight Training'),
                    ),
                    DropdownMenuItem(
                      value: 'Stretching Exercises',
                      child: Text('Stretching Exercises'),
                    ),
                    DropdownMenuItem(
                      value: 'Pelvic Floor Exercises (Kegel exercises)',
                      child: Text('Pelvic Floor Exercises (Kegel exercises)'),
                    ),
                    DropdownMenuItem(
                      value: 'Tai Chi',
                      child: Text('Tai Chi'),
                    ),
                    DropdownMenuItem(
                      value: 'Barre Workouts',
                      child: Text('Barre Workouts'),
                    ),

                    DropdownMenuItem(
                      value: 'Gentle Jogging/Running',
                      child: Text('Gentle Jogging/Running'),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      _exercisePreferences = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your exercise preferences';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _exercisePreferences = value!;
                  },
                ),
                TextFormField(
                  initialValue: _medicalHistory,
                  decoration: const InputDecoration(labelText: 'Medical History'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your medical history';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _medicalHistory = value!;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _onStartExercisePressed,
                  child: const Text('Start Exercise'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Exercise App',
    home: ExercisePage(),
  ));
}
