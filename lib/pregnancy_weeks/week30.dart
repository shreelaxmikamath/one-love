import 'package:flutter/material.dart';

class Week30Page extends StatelessWidget {
  const Week30Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 30 Highlights'),
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
            _buildSectionTitle('Baby Development at 30 Weeks'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Skin'),
            _buildSectionContent(
                'Your baby\'s skin cells are producing melanin, but their permanent skin tone will develop after birth.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Hair'),
            _buildSectionContent(
                'Lanugo, the fine hair covering your baby, is mostly falling out now, leaving more hair on their head.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Eyes'),
            _buildSectionContent(
                'Your baby can open their eyes wide and may see dim shapes. Pupils are beginning to react to light.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Large Cabbage',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('15.95 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('3.44 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 30',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Belly Button Changes'),
            _buildSectionContent(
                'Your expanding uterus may cause your belly button to protrude (become an "outie"). It may also feel sensitive or uncomfortable.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Brown Discharge'),
            _buildSectionContent(
                'Brown discharge may occur due to hormonal changes. It\'s usually normal, but contact your provider if you have concerns.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Fatigue'),
            _buildSectionContent(
                'Increased fatigue in the third trimester is common. Ensure you\'re eating well, staying hydrated, and resting when needed.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Swelling'),
            _buildSectionContent(
                'Swelling in your ankles and feet is normal as pregnancy progresses. Monitor for excessive swelling that could indicate a problem.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Mood Swings'),
            _buildSectionContent(
                'Mood swings can return due to hormonal changes and stress. Seek help if mood swings become severe or persistent.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Shortness of Breath'),
            _buildSectionContent(
                'Shortness of breath is common as your baby grows and puts pressure on your diaphragm. Seek medical advice for sudden or severe symptoms.'),
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
