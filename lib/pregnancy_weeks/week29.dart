import 'package:flutter/material.dart';

class Week29Page extends StatelessWidget {
  const Week29Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 29 '),
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
            _buildSectionTitle('Feeling Hiccups'),
            _buildSectionContent(
                'Your baby\'s hiccups in the womb are normal and help in lung maturation.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Weight Gain'),
            _buildSectionContent(
                'During the third trimester, aim for about a pound of weight gain per week. Focus on staying active and eating a variety of healthy foods.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Development at 29 Weeks'),
            const SizedBox(height: 16),
            _buildSectionTitle('Building Bone Strength'),
            _buildSectionContent(
                'Your baby\'s bones are hardening with the absorption of calcium.'),
                const SizedBox(height: 16),
            _buildSectionTitle('Nerve Protection'),
            _buildSectionContent(
                'A protective covering of myelin is forming around your baby\'s nerves.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Preparing to Breathe'),
            _buildSectionContent(
                'Your baby\'s respiratory system continues to develop, producing surfactant to aid in breathing after birth.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Butternut Squash',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('15.47 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('3.04 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 29',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Anemia'),
            _buildSectionContent(
                'Low iron levels can lead to anemia, causing symptoms like fatigue. Your provider may recommend iron supplements.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Cramping'),
            _buildSectionContent(
                'Mild cramping is common, but severe cramping could indicate a more serious issue like preterm labor. Contact your provider if concerned.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Heartburn'),
            _buildSectionContent(
                'Progesterone and your growing uterus can worsen heartburn. Manage by eating smaller meals, avoiding lying down after eating, and staying hydrated.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Lightheadedness'),
            _buildSectionContent(
                'Changes in your cardiovascular system may cause occasional lightheadedness. Stay hydrated and avoid sudden movements.'),
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
