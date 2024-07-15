import 'package:flutter/material.dart';

class Week20Page extends StatelessWidget {
  const Week20Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 20 Highlights'),
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
            _buildSectionTitle('Fundal height'),
            _buildSectionContent(
                'From now on, your doctor will measure your belly to track your baby\'s growth. The height in centimeters typically matches the number of weeks you\'re pregnant, starting around 24 weeks.'),
            const SizedBox(height: 16),
            const Text(
              'Baby development at 20 weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),
            _buildSectionTitle('Baby hiccups'),
            _buildSectionContent(
                'Your baby may start experiencing hiccups, which are normal and feel like rhythmic jerking movements. This usually begins between 16 and 22 weeks.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Taste development'),
            _buildSectionContent(
                'Your baby\'s taste buds are developing, and they can taste flavors from the amniotic fluid, influenced by what you eat during pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Size comparison'),
            _buildSectionContent(
                'Your baby is about the size of a banana – approximately 10.12 inches head to toe and weighs around 11.68 ounces.'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 20',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Itchy skin'),
            _buildSectionContent(
                'You may experience itching around your belly and breasts due to stretching skin. Avoid scratching and use moisturizer for relief.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Restless sleep'),
            _buildSectionContent(
                'Finding a comfortable sleeping position can be challenging. Try lying on your side with pillows for support.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Hair and nail changes'),
            _buildSectionContent(
                'Many expectant mothers notice thicker hair and faster nail growth, which are normal pregnancy changes.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Lower back pain'),
            _buildSectionContent(
                'Increased back pain is common due to your growing uterus and hormonal changes. Exercise and relaxation techniques can help.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Constipation'),
            _buildSectionContent(
                'Constipation is common in pregnancy. Drink plenty of water, eat fiber-rich foods, and consider your prenatal vitamin options.'),
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
