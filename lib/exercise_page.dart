import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

  final List<Map<String, String>> safeExercises = const [
    {"name": "Walking", "description": "Low-impact cardio that improves circulation and stamina."},
    {"name": "Swimming", "description": "Excellent full-body workout that's easy on the joints."},
    {"name": "Prenatal yoga", "description": "Improves flexibility, reduces stress, and prepares for childbirth."},
    {"name": "Low-impact aerobics", "description": "Boosts heart rate and energy levels safely."},
    {"name": "Stationary cycling", "description": "Cardiovascular exercise with minimal risk of falling."},
    {"name": "Modified Pilates", "description": "Strengthens core muscles and improves posture."},
    {"name": "Strength training (with guidance)", "description": "Builds muscle tone and strength when done properly."},
    {"name": "Pelvic floor exercises", "description": "Strengthens muscles supporting the uterus, bladder, and bowels."},
    {"name": "Stretching", "description": "Maintains flexibility and reduces muscle tension."},
  ];

  final List<Map<String, String>> exercisesToAvoid = const [
    {"name": "Contact sports", "description": "Risk of abdominal trauma and falls."},
    {"name": "High-impact activities", "description": "Can stress joints and increase risk of injury."},
    {"name": "Hot yoga or hot Pilates", "description": "Risk of overheating and dehydration."},
    {"name": "Scuba diving", "description": "Potential risk of decompression sickness for the fetus."},
    {"name": "Activities with a high risk of falling", "description": "Increased risk of injury to mother and baby."},
    {"name": "Exercises that involve lying flat on your back after the first trimester", "description": "Can reduce blood flow to the uterus."},
    {"name": "Heavy weightlifting", "description": "Risk of injury and excessive strain."},
    {"name": "Activities at high altitudes", "description": "Less oxygen available for you and your baby."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pregnancy Exercises'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Safe Exercises During Pregnancy',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...safeExercises.map((exercise) => ExpansionTile(
            leading: const Icon(Icons.check_circle, color: Colors.green),
            title: Text(exercise['name']!),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(exercise['description']!),
              ),
            ],
          )),
          const SizedBox(height: 20),
          const Text(
            'Exercises to Avoid During Pregnancy',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...exercisesToAvoid.map((exercise) => ExpansionTile(
            leading: const Icon(Icons.cancel, color: Colors.red),
            title: Text(exercise['name']!),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(exercise['description']!),
              ),
            ],
          )),
        ],
      ),
    );
  }
}