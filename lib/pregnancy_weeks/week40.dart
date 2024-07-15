import 'package:flutter/material.dart';

class Week40Page extends StatelessWidget {
  const Week40Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 40 Highlights'),
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
            _buildSectionTitle('You Made It!'),
            _buildSectionContent(
                'Congratulations! You\'ve reached your due date. Your pregnancy is full term and your baby is fully developed.'),
            const SizedBox(height: 16),
            _buildSectionTitle('How to Get Labor Going'),
            _buildSectionContent(
                'Natural methods like walking and having safe, comfortable sex may help, though results vary.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Staying Positive'),
            _buildSectionContent(
                'Practice affirmations to ease anxiety and stay positive about labor and delivery.'),
            const SizedBox(height: 16),
            const Text(
              'Baby Development at 40 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('How Big Will Your Baby Be?'),
            _buildSectionContent(
                'Average newborn weight is between 7 and 8 pounds, with a length of about 20 inches.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Skin Color'),
            _buildSectionContent(
                'Babies of all ethnicities are born with reddish-purple skin that changes to pinkish-red shortly after birth.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Soft Spots'),
            _buildSectionContent(
                'Your baby\'s skull consists of separate bones joined by flexible tissue, allowing for growth and development.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Small Pumpkin',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('20.08 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('7.98 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 40',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Ripening Cervix'),
            _buildSectionContent(
                'Your cervix may show signs of softening, thinning, and dilation as labor approaches, but it\'s not a precise predictor.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Water Breaking'),
            _buildSectionContent(
                'Less than 15% of women experience their water breaking before contractions start. If unsure, contact your healthcare provider.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Back Pain'),
            _buildSectionContent(
                'With your baby\'s increased weight and pregnancy-related changes, back pain is common. Seek relief through gentle activities and rest.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Contractions'),
            _buildSectionContent(
                'Distinguish between Braxton Hicks contractions and real labor contractions based on pain intensity, regularity, and persistence.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Insomnia'),
            _buildSectionContent(
                'Difficulty sleeping affects many women at this stage. Establishing a bedtime routine and restorative activities can help.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pelvic Pain and Pressure'),
            _buildSectionContent(
                'As your baby descends into your pelvis, you may experience increased pelvic discomfort. Manage with rest and gentle positioning.'),
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
