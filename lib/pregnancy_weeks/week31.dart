import 'package:flutter/material.dart';

class Week31Page extends StatelessWidget {
  const Week31Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 31'),
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
            _buildSectionTitle('Chores to Avoid'),
            _buildSectionContent(
                'At 31 weeks, avoid unsafe chores like moving furniture and using strong chemicals.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Healthy Pregnancy Recipes'),
            _buildSectionContent(
                'Nourish yourself and your baby with healthy pregnancy foods.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Development at 31 Weeks'),
            const SizedBox(height: 16),
            _buildSectionTitle('Fattening Up'),
            _buildSectionContent(
                'Your baby is beginning to plump up with accumulated fat under their skin.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Movements'),
            _buildSectionContent(
                'Feel your baby stretch, kick, and somersault – signs of a healthy, active baby.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Brain'),
            _buildSectionContent(
                'Brain development is accelerating with significant growth in the cerebrum.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Coconut',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('16.46 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('3.86 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 31',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Braxton Hicks Contractions'),
            _buildSectionContent(
                'Experience occasional uterine tightening, which are Braxton Hicks contractions. Ensure hydration to minimize discomfort.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Leaky Breasts'),
            _buildSectionContent(
                'Colostrum leakage is normal as your body prepares for breastfeeding. Use nursing pads if needed.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Frequent Urination'),
            _buildSectionContent(
                'Increased need to urinate due to hormonal changes and pressure on your bladder.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Back Pain'),
            _buildSectionContent(
                'Lower back pain is common as your uterus grows and shifts your center of gravity.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Trouble Sleeping'),
            _buildSectionContent(
                'Struggling with sleep due to baby movements, discomfort, and frequent bathroom trips. Experiment with different sleeping positions and environments for relief.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Sciatica'),
            _buildSectionContent(
                'Experience sharp or dull pain radiating from lower back down to legs due to pressure on the sciatic nerve. Manage with gentle exercises and ask your provider for suitable treatments.'),
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
