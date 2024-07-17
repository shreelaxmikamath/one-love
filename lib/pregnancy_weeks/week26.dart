import 'package:flutter/material.dart';

class Week26Page extends StatelessWidget {
  const Week26Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 26 '),
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
            _buildSectionTitle('Pregnancy Nutrition'),
            _buildSectionContent(
                'It\'s essential to get enough of key nutrients like calcium, iron, iodine, choline, vitamin A, vitamin C, vitamin D, vitamin B6, vitamin B12, folic acid, and omega-3 fatty acids.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Development at 26 Weeks'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Lungs'),
            _buildSectionContent(
                'Your baby has started to inhale and exhale small amounts of amniotic fluid, which is essential for lung development.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Responding to Sounds'),
            _buildSectionContent(
                'Your baby can hear your voice and may even respond to it with changes in their heartbeat, breathing, and movement. They may startle at loud noises.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Testicles Dropping'),
            _buildSectionContent(
                'If you\'re having a boy, his testicles have begun to descend into his scrotum – a process that takes about two to three months.'),
            const SizedBox(height: 16),
            const Text(
              'Your baby is about the size of a scallion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('13.82 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('2.01 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 26',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Lower-Back Pain'),
            _buildSectionContent(
                'Lower back pain is common due to your growing uterus and hormonal changes. Staying active with low-impact cardio and practicing relaxation techniques can help.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Braxton Hicks Contractions'),
            _buildSectionContent(
                'These are irregular uterine contractions that can be uncomfortable but are not usually painful or regular like true contractions. Stay hydrated and change positions if they occur.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Headaches'),
            _buildSectionContent(
                'Mild headaches can be caused by hormonal changes, exhaustion, hunger, or dehydration. Severe or persistent headaches should be reported to your healthcare provider.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Constipation'),
            _buildSectionContent(
                'Increased progesterone levels can lead to constipation. Stay hydrated, eat a high-fiber diet, and consider safe stool softeners if needed.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Stretch Marks'),
            _buildSectionContent(
                'As your belly grows, you may notice stretch marks on your stomach, breasts, and thighs. Prevention includes gradual weight gain and moisturizing.'),
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
