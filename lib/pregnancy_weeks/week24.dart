import 'package:flutter/material.dart';

class Week24Page extends StatelessWidget {
  const Week24Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 24 '),
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
            const Text(
              'Pregnancy Glow',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _buildSectionContent(
                'The pregnancy glow you\'ve likely heard so much about isn\'t a myth. Changing hormones, above-average oil production, and increased blood flow can make your skin look flushed, shiny, and even radiant.'),
            const SizedBox(height: 16),
            const Text(
              'Nesting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _buildSectionContent(
                'Feeling a strong urge to clean and organize your home? You\'re probably nesting. Preparing your "nest" for a new baby is an instinct common in humans and animals.'),
            const SizedBox(height: 16),
            const Text(
              'Baby Development at 24 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Lungs'),
            _buildSectionContent(
                'Respiratory sacs at the tips of the smallest branches of your baby\'s lungs are growing and multiplying, adding more surface area for the exchange of oxygen and carbon dioxide.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Gaining Weight'),
            _buildSectionContent(
                'Your baby cuts a pretty lean figure at this point, but their body is filling out proportionally, and soon they\'ll start to plump up. Their skin is still thin and translucent.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Raising an Eyebrow'),
            _buildSectionContent(
                'Tiny eyebrows grew on your baby\'s face just a few weeks ago. Now your baby may practice working their facial muscles and raising them.'),
            const SizedBox(height: 32),
            const Text(
              'Your baby is about the size of an ear of corn',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('12.68 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('1.48 pounds'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy Symptoms at 24 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Rashes'),
            _buildSectionContent(
                'If you\'re experiencing new skin symptoms, like itchiness, hyperpigmentation, raised bumps, or hives, check in with your doctor or midwife. Most rashes during pregnancy are related to allergies, contact dermatitis, or skin infections.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Spotting'),
            _buildSectionContent(
                'During the second trimester, some women experience spotting or light bleeding. This is typically harmless but consult your healthcare provider for reassurance.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Mood Swings'),
            _buildSectionContent(
                'Hormonal changes, stress, and physical discomfort can lead to dramatic mood swings during pregnancy. Seek support from your healthcare provider if you feel overwhelmed.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Shortness of Breath'),
            _buildSectionContent(
                'Feeling short of breath is common as your body adjusts to pregnancy. Contact your healthcare provider if you have severe symptoms.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Increased Appetite'),
            _buildSectionContent(
                'Your increased appetite is natural as your body needs more nutrients. Focus on balanced meals and healthy snacks to support your pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Melasma'),
            _buildSectionContent(
                'Melasma, dark patches of skin, can appear due to hormonal changes during pregnancy. Use sunscreen and protective clothing to minimize it.'),
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
