import 'package:flutter/material.dart';

class Week33Page extends StatelessWidget {
  const Week33Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 33 '),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Highlights this Week',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('More Prenatal Visits'),
            _buildSectionContent(
                'Third-trimester visits are frequent; high-risk pregnancies may require even more visits.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Is that Pee?'),
            _buildSectionContent(
                'Amniotic sac typically doesn\'t rupture until labor starts.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Development at 33 Weeks'),
            const SizedBox(height: 16),
            _buildSectionTitle('Skull Flexibility'),
            _buildSectionContent(
                'Baby\'s skull bones remain flexible to ease birth process; they won\'t fully fuse until adulthood.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Skin'),
            _buildSectionContent(
                'Baby\'s skin is smoothing out and becoming less transparent.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Movement'),
            _buildSectionContent(
                'Less somersaults due to limited space, but movement remains consistent.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Pineapple',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('17.36 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('4.77 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 33',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Trouble Sleeping'),
            _buildSectionContent(
                'Difficulty finding a comfortable position due to belly size and physical discomfort.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Wrist Pain'),
            _buildSectionContent(
                'Carpal tunnel syndrome may cause pain and numbness in hands and wrists due to swelling.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Swollen Labia'),
            _buildSectionContent(
                'Normal symptom due to increased blood flow and pressure; manage with rest and compression.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Frequent Urination'),
            _buildSectionContent(
                'Increased frequency due to pressure on the bladder; manage by monitoring fluid intake and emptying bladder completely.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Shortness of Breath'),
            _buildSectionContent(
                'Common due to uterus pressing against diaphragm; severe symptoms should be reported to your provider.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pregnancy Brain'),
            _buildSectionContent(
                'Difficulty concentrating and remembering; manage with rest, reminders, and support.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(fontSize: 16),
    );
  }
}
