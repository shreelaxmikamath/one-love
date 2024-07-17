import 'package:flutter/material.dart';

class Week25Page extends StatelessWidget {
  const Week25Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 25 '),
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
              'Safe Pregnancy Exercise',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _buildSectionContent(
                'Most women can keep exercising throughout pregnancy – and exercise has lots of benefits. But as your body changes, you\'ll need to modify your workouts.'),
            const SizedBox(height: 16),
            const Text(
              'Belly Button Popping Out?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _buildSectionContent(
                'Is your innie looking more like an outie now that you\'re creeping up on your third trimester? Don\'t worry: Usually pregnancy belly button changes are temporary.'),
            const SizedBox(height: 16),
            const Text(
              'Staying Hydrated',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _buildSectionContent(
                'You\'ve probably heard it a thousand times by now, but it\'s true – staying hydrated during pregnancy is important. Try to drink about 10 glasses of water a day.'),
            const SizedBox(height: 16),
            const Text(
              'Baby Development at 25 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Gaining Baby Fat'),
            _buildSectionContent(
                'Your baby will soon exchange that long, lean look for some baby fat. Wrinkled skin will begin to smooth out, and they\'ll start to look more and more like a newborn.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Hair'),
            _buildSectionContent(
                'Your baby is growing more hair – and if you could see it, you\'d be able to discern its color and texture.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Sleeping Like a Baby'),
            _buildSectionContent(
                'Your baby spends most of their time sleeping, and cycles between rapid eye movement (REM) sleep and non-REM sleep every 20 to 40 minutes.'),
            const SizedBox(height: 32),
            const Text(
              'Your baby is about the size of a rutabaga',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('13.27 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('1.73 pounds'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy Symptoms at 25 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Thicker Hair'),
            _buildSectionContent(
                'Your hair may look fuller and more lustrous than ever due to hormonal changes. After pregnancy, the extra hair may fall out.'),
            const SizedBox(height: 16),
            _buildSectionTitle('SPD (Pelvic Girdle Pain)'),
            _buildSectionContent(
                'Pelvic girdle pain can cause discomfort and limit mobility. Discuss treatments with your healthcare provider.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Itching'),
            _buildSectionContent(
                'Moderate itching is common due to skin stretching. Use soothing methods like oatmeal baths and moisturizing lotions.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Insomnia'),
            _buildSectionContent(
                'Trouble sleeping is common as your due date approaches. Relaxation techniques can help improve sleep quality.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Dizziness'),
            _buildSectionContent(
                'Dizziness can occur due to increased blood volume and pressure on veins. Take precautions like standing up slowly and staying hydrated.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Gas and Bloating'),
            _buildSectionContent(
                'Gas and bloating are common discomforts. Adjusting your diet and considering over-the-counter remedies may provide relief.'),
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
