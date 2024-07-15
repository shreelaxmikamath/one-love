import 'package:flutter/material.dart';

class Week21Page extends StatelessWidget {
  const Week21Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 21 Highlights'),
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
            _buildSectionTitle('Baby kicks'),
            _buildSectionContent(
                'Your baby\'s movements are becoming stronger, and others may be able to feel the kicks when placing a hand on your belly.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Swimming during pregnancy'),
            _buildSectionContent(
                'Swimming is a great exercise during pregnancy, offering low-impact relief for aches and allowing you to feel weightless in the water as your belly grows.'),
            const SizedBox(height: 16),
            const Text(
              'Baby development at 21 weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby\'s taste buds'),
            _buildSectionContent(
                'Your baby now has functional taste buds and can taste flavors from the amniotic fluid.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Sucking reflex'),
            _buildSectionContent(
                'The sucking reflex is developing, and your baby can suck their thumb, which you may have seen on ultrasound scans.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby\'s skin'),
            _buildSectionContent(
                'Your baby\'s skin is still wrinkled and translucent, appearing red due to visible blood vessels.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Size comparison'),
            _buildSectionContent(
                'Your baby is about the size of a carrot – approximately 10.79 inches head to toe and weighing around 14.07 ounces.'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 21',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Varicose veins'),
            _buildSectionContent(
                'Increased pressure from your growing uterus can lead to varicose veins. Manage them with daily exercise, elevation of legs, and wearing compression socks.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Bleeding gums'),
            _buildSectionContent(
                'Pregnancy gingivitis may cause gums to bleed during brushing or flossing. Maintain good oral hygiene and regular dental visits.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Clumsiness'),
            _buildSectionContent(
                'Changes in your center of gravity can cause clumsiness. Take precautions to avoid falls and injuries.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Braxton Hicks contractions'),
            _buildSectionContent(
                'You may start feeling Braxton Hicks contractions, which are practice contractions. They are normal unless they become regular or painful.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Heartburn'),
            _buildSectionContent(
                'Heartburn is common due to pregnancy hormones and physical changes. Manage it with lifestyle adjustments and discuss remedies with your doctor.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Weight gain'),
            _buildSectionContent(
                'You may be gaining about a pound per week at this stage of pregnancy. Monitor weight gain based on your health needs and consult your healthcare provider for guidance.'),
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
