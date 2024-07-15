import 'package:flutter/material.dart';

class Week28Page extends StatelessWidget {
  const Week28Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 28 Highlights'),
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
            _buildSectionTitle('Hello, Third Trimester!'),
            _buildSectionContent(
                'You\'re in the home stretch now. Expect more frequent checkups – every two weeks until 36 weeks, then weekly until delivery.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pregnancy Weight Gain'),
            _buildSectionContent(
                'In the third trimester, aim for about a pound of weight gain per week. You\'ll need approximately 450 extra calories daily to support your pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Development at 28 Weeks'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Brain'),
            _buildSectionContent(
                'Your baby\'s brain will triple in weight this trimester, with the cerebrum developing deep, convoluted grooves.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Senses'),
            _buildSectionContent(
                'Hearing, smell, and touch senses are fully developed and functional.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Nervous System'),
            _buildSectionContent(
                'The autonomic nervous system is maturing, controlling body temperature and rhythmic breathing movements to strengthen the lungs.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Large Eggplant',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('14.80 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('2.67 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 28',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Leg Cramps'),
            _buildSectionContent(
                'Common in the third trimester due to extra weight, swelling, and potential vitamin deficiencies. Change positions, hydrate, and gentle movement can help.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Hemorrhoids'),
            _buildSectionContent(
                'Swollen blood vessels in the pelvic area, often caused by constipation and increased uterus pressure. Manage with hydration, fiber, and medical advice if severe.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Weird Dreams'),
            _buildSectionContent(
                'Vivid and unusual dreams are common, reflecting pregnancy emotions and physical changes. Hormonal shifts and interrupted sleep contribute to their intensity.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pregnancy Rashes'),
            _buildSectionContent(
                'Rashes may arise from hormonal changes or unrelated skin conditions. PUPPP, a rare pregnancy rash, requires medical attention for relief.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Leaking Breasts'),
            _buildSectionContent(
                'Colostrum leakage, the early form of breast milk, is normal in the third trimester as your body prepares for breastfeeding. Use nursing pads if leakage is bothersome.'),
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
