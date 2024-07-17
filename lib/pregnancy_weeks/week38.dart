import 'package:flutter/material.dart';

class Week38Page extends StatelessWidget {
  const Week38Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 38 '),
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
            _buildSectionTitle('You\'re Almost There!'),
            _buildSectionContent(
                'Most women give birth within two weeks of their due date. Get ready!'),
            const SizedBox(height: 16),
            _buildSectionTitle('The Nesting Instinct'),
            _buildSectionContent(
                'Feel bursts of energy to clean, organize, and prepare for baby.'),
            const SizedBox(height: 16),
            const Text(
              'Baby Development at 38 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle("Baby's Nails"),
            _buildSectionContent(
                'Fully formed fingernails and toenails, ready for a trim after birth.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Looking Good'),
            _buildSectionContent(
                'Your baby has a layer of fat for smooth skin and has shed most of their lanugo.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Leek',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('19.41 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('7.13 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 38',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Swollen Ankles'),
            _buildSectionContent(
                'Some swelling is normal; watch for sudden or excessive swelling.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Trouble Sleeping'),
            _buildSectionContent(
                'Insomnia may be worse now; practice good sleep hygiene.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Crazy Dreams'),
            _buildSectionContent(
                'Intense dreams are common, possibly related to hormone changes.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Lightning Crotch'),
            _buildSectionContent(
                'Sudden, sharp pain in the pelvis or groin due to baby\'s position.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Different Vaginal Discharge'),
            _buildSectionContent(
                'Changes in discharge as labor nears; contact provider if concerning.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Heartburn'),
            _buildSectionContent(
                'Persistent heartburn and indigestion may worsen; manage with small meals and elevated sleep position.'),
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
