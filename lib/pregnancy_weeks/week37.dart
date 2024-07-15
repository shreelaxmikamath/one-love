import 'package:flutter/material.dart';

class Week37Page extends StatelessWidget {
  const Week37Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 37 Highlights'),
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
            _buildSectionTitle('Labor Approaching'),
            _buildSectionContent(
                'You could go into labor soon. Most women give birth within two weeks before or after their due date.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Cervix Check'),
            _buildSectionContent(
                'Your doctor may check your cervix for effacement and dilation, which are signs that labor may be approaching.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Almost to the Finish Line'),
            _buildSectionContent(
                'Your baby is not considered full term until 39 weeks, allowing for full maturation of their brain, lungs, and nervous system.'),
            const SizedBox(height: 16),
            const Text(
              'Baby Development at 37 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle("Your Baby's Hair"),
            _buildSectionContent(
                'Many babies have a full head of hair at birth, which may change in color and texture over time.'),
            const SizedBox(height: 16),
            _buildSectionTitle("Your Baby's Eyes"),
            _buildSectionContent(
                'Your baby may not show their final eye color at birth, with changes possible over the first year.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Gaining Weight'),
            _buildSectionContent(
                'Your baby continues to gain weight and develop a layer of fat for warmth after birth.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Bunch of Swiss Chard',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('19.02 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('6.68 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 37',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Practice Contractions'),
            _buildSectionContent(
                'Braxton Hicks contractions may increase in frequency and intensity, helping prepare your body for labor.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Breasts Leaking'),
            _buildSectionContent(
                'You may notice leaking colostrum from your breasts, preparing for your baby\'s first feedings.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Vaginal Discharge or Spotting'),
            _buildSectionContent(
                'Increased discharge, including mucus plug or bloody show, may indicate approaching labor.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Feeling Movement'),
            _buildSectionContent(
                'Monitor your baby\'s movements; contact your provider if you notice decreased activity.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Gas and Bloating'),
            _buildSectionContent(
                'Common discomforts due to baby crowding your digestive organs. Manage with smaller meals and gentle exercise.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Lower Back Pain'),
            _buildSectionContent(
                'A common issue in late pregnancy. Practice good posture and consider exercises like swimming or prenatal massage for relief.'),
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
