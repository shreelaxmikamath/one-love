import 'package:flutter/material.dart';

class Week27Page extends StatelessWidget {
  const Week27Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 27 '),
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
            _buildSectionTitle('Taking Naps'),
            _buildSectionContent(
                'Naps are a great way to improve sleep during pregnancy. More than half of pregnant women take naps during the work week, and about 60 percent nap on weekends.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Vitamin B12 during Pregnancy'),
            _buildSectionContent(
                'Vitamin B12 is crucial for your baby\'s developing brain and spinal cord.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Development at 27 Weeks'),
            const SizedBox(height: 16),
            _buildSectionTitle('Opening Their Eyes'),
            _buildSectionContent(
                'Your baby can now open and close their eyes. They may even respond to light by moving.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Hiccups in the Womb'),
            _buildSectionContent(
                'Feeling rhythmic movements? Those are likely fetal hiccups, which are normal and can be a delightful sensation.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Getting Ready to Breathe'),
            _buildSectionContent(
                'Your baby\'s lungs are producing surfactant, a substance that helps keep the air sacs open for breathing after birth.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Head of Cauliflower',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('14.41 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('2.33 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 27',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Extra Body Hair'),
            _buildSectionContent(
                'Pregnancy hormones can cause thicker, fuller hair growth, including on your face and body. Safe hair removal methods include waxing, tweezing, and shaving.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Restless Legs'),
            _buildSectionContent(
                'Restless leg syndrome (RLS) may cause discomfort in your legs, especially when trying to relax or sleep. Managing with exercise, stretching, and proper nutrition can help.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Urinary Incontinence'),
            _buildSectionContent(
                'Many pregnant women experience urinary leakage due to hormonal changes and increased fluid volume. Pelvic floor exercises and avoiding caffeine can help.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Swelling'),
            _buildSectionContent(
                'Swelling, especially in feet and ankles, is common due to increased fluid retention and pressure on veins. Managing with elevation, hydration, and proper posture is recommended.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Weight Gain'),
            _buildSectionContent(
                'Monitor weight gain to stay within recommended guidelines. Consult your healthcare provider for personalized advice on nutrition and weight management during pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pelvic Pain'),
            _buildSectionContent(
                'Pelvic pain can increase as pregnancy progresses. Supportive devices and exercises like Kegels can help alleviate discomfort.'),
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
