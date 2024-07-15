import 'package:flutter/material.dart';

class Week35Page extends StatelessWidget {
  const Week35Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 35 Highlights'),
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
            _buildSectionTitle('Ready to Drop'),
            _buildSectionContent(
                'Baby may drop into your pelvis, relieving lung pressure but increasing bladder pressure. This is a sign your body is preparing for labor.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Late-Pregnancy Dreams'),
            _buildSectionContent(
                'Hormonal changes and sleep disturbances lead to vivid and often bizarre dreams about pregnancy, labor, and your baby.'),
            const SizedBox(height: 16),
            const Text(
              'Baby Development at 35 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Amniotic Fluid'),
            _buildSectionContent(
                'Baby is cushioned by about a quart of amniotic fluid, which decreases as birth approaches.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Poop and Pee'),
            _buildSectionContent(
                'Baby\'s kidneys are fully developed; they produce urine, which fills the amniotic fluid. Meconium, baby\'s first bowel movement, is accumulating in intestines.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Sleep Patterns'),
            _buildSectionContent(
                'Baby has distinct sleeping cycles, noticeable by movements; active when awake, less movement when asleep.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Honeydew Melon',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('18.23 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('5.72 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 35',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Heartburn'),
            _buildSectionContent(
                'Increased pressure from uterus causes heartburn; manage with diet adjustments and elevated sleeping position.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Clumsiness'),
            _buildSectionContent(
                'Shift in center of gravity, hormonal changes, and swollen feet contribute to feeling clumsier than usual.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Headaches'),
            _buildSectionContent(
                'Common triggers include fatigue, hunger, dehydration, and hormonal changes. Manage with lifestyle adjustments and consult your provider for severe headaches.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Hemorrhoids'),
            _buildSectionContent(
                'Common in late pregnancy due to increased pressure and constipation. Manage with hydration, fiber, and gentle treatments.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Linea Nigra'),
            _buildSectionContent(
                'Dark vertical line on belly due to hormonal changes; temporary and fades post-pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Vision Changes'),
            _buildSectionContent(
                'Common temporary changes include blurry vision and dry eyes; severe changes may indicate serious conditions like preeclampsia.'),
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
