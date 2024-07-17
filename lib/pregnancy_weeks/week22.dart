import 'package:flutter/material.dart';

class Week22Page extends StatelessWidget {
  const Week22Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 22'),
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
            _buildSectionTitle('Baby development at 22 weeks'),
            _buildSectionContent(
                'Your baby now has visible hair on their head, eyebrows, and fine lanugo on their body. A layer of fat is forming under the skin, preparing for a chubby appearance later.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Hearing your heartbeat'),
            _buildSectionContent(
                'Your baby can hear sounds inside your body, like your breathing, heartbeat, and digestion. These sounds will become clearer as their hearing continues to develop.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Size comparison'),
            _buildSectionContent(
                'Your baby is about the size of a spaghetti squash – approximately 11.42 inches head to toe and weighing around 1.05 pounds.'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 22',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Acne'),
            _buildSectionContent(
                'Pregnancy acne can occur due to hormonal changes. Consult your provider before using any acne medications.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Spider veins'),
            _buildSectionContent(
                'Spider veins are common during pregnancy due to increased blood volume and pressure on veins. Manage them with exercise, elevation, and compression socks.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Diarrhea'),
            _buildSectionContent(
                'Diarrhea can happen during pregnancy, often due to hormonal changes or late pregnancy before labor. Stay hydrated and consult your provider for safe antidiarrheal options.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Swelling'),
            _buildSectionContent(
                'Some swelling, or edema, is normal in pregnancy. Watch for signs of preeclampsia or deep vein thrombosis (DVT) if swelling is severe or sudden.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Leg cramps'),
            _buildSectionContent(
                'Leg cramps may occur, especially at night. Stretch, massage, apply heat, and stay hydrated to manage them.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pelvic pain'),
            _buildSectionContent(
                'Pelvic pain can result from pregnancy-related changes. Use support belts, physical therapy, and consult your provider for pain relief options.'),
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
