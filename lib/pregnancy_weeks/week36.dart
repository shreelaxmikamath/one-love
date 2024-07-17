import 'package:flutter/material.dart';

class Week36Page extends StatelessWidget {
  const Week36Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 36 '),
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
            _buildSectionTitle('Getting in Position'),
            _buildSectionContent(
                'Most babies have turned head down by now. If your baby is breech, your provider may try to manually turn them.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Weekly Prenatal Visits'),
            _buildSectionContent(
                'Visits are now weekly until delivery, monitoring blood pressure, weight, urine, and any complications.'),
            const SizedBox(height: 16),
            _buildSectionTitle('If You Give Birth This Week'),
            _buildSectionContent(
                'Babies born at 36 weeks are considered "late preterm" and have similar health outcomes to full-term infants.'),
            const SizedBox(height: 16),
            const Text(
              'Baby Development at 36 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle("Baby's Lungs"),
            _buildSectionContent(
                'Baby\'s lungs are fully developed, preparing for their first breath after birth.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Bones Are Hardening'),
            _buildSectionContent(
                'Bones are firming up, though some are still cartilage that will ossify over time. Newborns have more bones than adults.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Making Meconium'),
            _buildSectionContent(
                'Baby is shedding lanugo and vernix, swallowing them along with other fluids to produce meconium.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Head of Romaine Lettuce',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('18.62 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('6.20 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 36',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Cramping'),
            _buildSectionContent(
                'Normal throughout pregnancy, including Braxton Hicks. Call your provider if cramps become regular.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Headaches'),
            _buildSectionContent(
                'Common in pregnancy due to hormonal changes and dehydration. Seek medical advice for severe headaches.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Vaginal Discharge'),
            _buildSectionContent(
                'Monitor changes; thick discharge may indicate mucus plug loss or early labor.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Dizziness'),
            _buildSectionContent(
                'Caused by cardiovascular changes and pressure from growing uterus. Take precautions to avoid falls.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pelvic Pain'),
            _buildSectionContent(
                'Common due to hormonal changes and weight gain. Various treatments are available for relief.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby Drops'),
            _buildSectionContent(
                'Feeling increased pressure in your lower abdomen as baby settles into position. Breathing may become easier.'),
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
