import 'package:flutter/material.dart';

class Week34Page extends StatelessWidget {
  const Week34Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 34'),
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
            _buildSectionTitle('Keeping Tabs on Your Baby'),
            _buildSectionContent(
                'Provider measures fundal height or uses ultrasound to estimate baby\'s size.'),
            const SizedBox(height: 16),
            const Text(
              'Baby Development at 34 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Growing Nails'),
            _buildSectionContent(
                'Baby\'s fingernails reach fingertips; toenails will by 38 weeks.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Chubby Limbs'),
            _buildSectionContent(
                'Baby\'s arms and legs are filling out with fat deposits.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Senses'),
            _buildSectionContent(
                'Baby can respond to sounds, light, and touch; ears will be fully formed next week.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Cantaloupe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('17.84 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('5.24 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 34',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Aches and Pains'),
            _buildSectionContent(
                'Pelvic pain, lower-back pain, round ligament pain, and sciatica are common.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Constipation'),
            _buildSectionContent(
                'Progesterone relaxes muscles, slowing digestion; manage with water, fiber, and gentle stool softeners.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Braxton Hicks'),
            _buildSectionContent(
                'Irregular contractions are common; rest, hydration, and changing positions can help.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Fatigue'),
            _buildSectionContent(
                'Physical strain and restless nights contribute to tiredness; discuss with provider for management strategies.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Vaginal Discharge'),
            _buildSectionContent(
                'Normal discharge includes leukorrhea and occasional spotting; report changes to your provider.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Leaking Breasts'),
            _buildSectionContent(
                'Colostrum leakage is normal; use nursing pads if needed, but no need to pump.'),
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
