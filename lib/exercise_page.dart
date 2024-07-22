import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final List<Map<String, String>> allExercises = const [
    {"name": "Walking", "description": "Low-impact cardio that improves circulation and stamina.", "intensity": "low"},
    {"name": "Swimming", "description": "Excellent full-body workout that's easy on the joints.", "intensity": "moderate"},
    {"name": "Prenatal yoga", "description": "Improves flexibility, reduces stress, and prepares for childbirth.", "intensity": "low"},
    {"name": "Low-impact aerobics", "description": "Boosts heart rate and energy levels safely.", "intensity": "moderate"},
    {"name": "Stationary cycling", "description": "Cardiovascular exercise with minimal risk of falling.", "intensity": "moderate"},
    {"name": "Modified Pilates", "description": "Strengthens core muscles and improves posture.", "intensity": "moderate"},
    {"name": "Strength training (with guidance)", "description": "Builds muscle tone and strength when done properly.", "intensity": "high"},
    {"name": "Pelvic floor exercises", "description": "Strengthens muscles supporting the uterus, bladder, and bowels.", "intensity": "low"},
    {"name": "Stretching", "description": "Maintains flexibility and reduces muscle tension.", "intensity": "low"},
  ];

  int _trimester = 1;
  String _fitnessLevel = 'Beginner';
  List<Map<String, String>> _recommendedExercises = [];
  bool _showRecommendations = false;

  void _updateRecommendations() {
    setState(() {
      _recommendedExercises = _getRecommendedExercises(_trimester, _fitnessLevel);
      _showRecommendations = true;
    });
  }

  List<Map<String, String>> _getRecommendedExercises(int trimester, String fitnessLevel) {
    if (trimester == 1) {
      return allExercises.where((e) => e['intensity'] == 'low' || e['intensity'] == 'moderate').toList();
    } else if (trimester == 2) {
      if (fitnessLevel == 'Beginner') {
        return allExercises.where((e) => e['intensity'] == 'low' || e['intensity'] == 'moderate').toList();
      } else {
        return allExercises;
      }
    } else {
      return allExercises.where((e) => e['intensity'] == 'low').toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pregnancy Exercises'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          DropdownButton<int>(
            value: _trimester,
            items: [1, 2, 3].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('Trimester $value'),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _trimester = newValue!;
                _showRecommendations = false;
              });
            },
          ),
          DropdownButton<String>(
            value: _fitnessLevel,
            items: ['Beginner', 'Intermediate', 'Advanced'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _fitnessLevel = newValue!;
                _showRecommendations = false;
              });
            },
          ),
          ElevatedButton(
            onPressed: _updateRecommendations,
            child: Text('Get Recommendations'),
          ),
          if (_showRecommendations) ...[
            const SizedBox(height: 20),
            const Text(
              'Recommended Exercises',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ..._recommendedExercises.map((exercise) => ExpansionTile(
              leading: const Icon(Icons.check_circle, color: Colors.green),
              title: Text(exercise['name']!),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(exercise['description']!),
                ),
              ],
            )),
          ],
        ],
      ),
    );
  }
}