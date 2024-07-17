import 'package:flutter/material.dart';

class Week32Page extends StatelessWidget {
  const Week32Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 32 '),
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
            _buildSectionTitle('Changing Positions'),
            _buildSectionContent(
                'Your baby is likely getting into the ideal head-down position for birth.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Able to Survive and Thrive'),
            _buildSectionContent(
                'Babies born between 32 and 34 weeks, though needing NICU care, often have good outcomes.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Movement'),
            _buildSectionContent(
                'Monitor your baby\'s kicks; report any changes to your doctor or midwife.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Development at 32 Weeks'),
            const SizedBox(height: 16),
            _buildSectionTitle('Storing Minerals'),
            _buildSectionContent(
                'Your baby is storing iron, calcium, and phosphorus for early life.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Lungs'),
            _buildSectionContent(
                'Lung development continues as your baby practices breathing amniotic fluid.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Genitalia'),
            _buildSectionContent(
                'For boys, external genitalia is formed, and testicles are descending. For girls, uterus and ovaries are in place.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Jicama',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('16.93 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('4.30 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 32',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Lightning Crotch'),
            _buildSectionContent(
                'Experience sharp pelvic pains caused by baby\'s pressure.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Swollen Hands and Face'),
            _buildSectionContent(
                'Manage edema with hydration, exercise, and elevation; watch for signs of preeclampsia.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Itching Skin'),
            _buildSectionContent(
                'Skin stretching may cause itching; seek medical advice if severe.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Stretch Marks'),
            _buildSectionContent(
                'Normal as skin stretches; fades over time postpartum.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Varicose Veins'),
            _buildSectionContent(
                'Common in pregnancy; manage with activity, breaks, and proper posture.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Appetite Changes'),
            _buildSectionContent(
                'Decreased hunger due to baby\'s size; focus on small, nutritious meals.'),
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
