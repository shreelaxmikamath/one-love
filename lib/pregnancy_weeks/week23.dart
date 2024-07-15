import 'package:flutter/material.dart';

class Week23Page extends StatelessWidget {
  const Week23Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 23 Highlights'),
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
                'For most expecting moms, exercise is not only safe, it\'s recommended for a healthy pregnancy.'),
            const SizedBox(height: 16),
            const Text(
              'Top Pregnancy Foods',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _buildSectionContent(
                'Salmon helps with fetal brain development. Eggs help prevent certain birth defects. Avocados can ward off leg cramps. And that\'s only the beginning! Here are the best foods for pregnancy.'),
            const SizedBox(height: 16),
            const Text(
              'Baby Development at 23 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Hearing You'),
            _buildSectionContent(
                'Your baby can hear sounds from outside your body now, such as your voice or your partner\'s. Research shows babies learn to recognize their mother\'s voice inside the womb, and show a clear preference for her voice over others.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Digestive System'),
            _buildSectionContent(
                'The wave-like movements that propel food along your baby\'s digestive tract begin now. As with swallowing, it\'s just practice for your baby\'s system at this point since there\'s no actual food to move.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Movement'),
            _buildSectionContent(
                'Those subtle flutters you\'ve noticed may begin to feel stronger. Instead of something like butterfly wings, baby movements will evolve into gentle kicks and jabs. At 23 weeks, you can begin making note of patterns associated with your baby\'s movement. Are they more active after you eat? Do they get a little wild when you lie down for the night?'),
            const SizedBox(height: 32),
            const Text(
              'Your baby is about the size of a large mango',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('12.05 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('1.25 pounds'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy Symptoms at 23 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Linea Nigra'),
            _buildSectionContent(
                'Also called the pregnancy line, the linea nigra is a dark, vertical line most pregnant women develop on their growing baby bump during their second trimester. After your pregnancy, the linea nigra should fade over a few weeks to months, though in some women it may not disappear entirely.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Breast Changes'),
            _buildSectionContent(
                'Now that you\'re in the second half of pregnancy, you might notice that the veins in your breasts are more prominent and your areolas (the pigmented area around your nipples) are darkening. As your due date draws near, your breasts might leak colostrum.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pregnancy Cravings'),
            _buildSectionContent(
                'Now that your appetite has likely returned (perhaps stronger than ever), you might be having intense cravings. It\'s fine to eat what sounds good – just don\'t let any unhealthy cravings overpower your need for nutritious food during pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Vision Changes'),
            _buildSectionContent(
                'Many women have mild and temporary vision changes during pregnancy, such as becoming more nearsighted or having blurry vision. Pay attention to vision changes because some can signal serious health complications during pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Forgetfulness'),
            _buildSectionContent(
                'Some expecting moms experience minor, manageable forgetfulness, often attributed to sleep disruptions, changing hormones, stress, and brain changes. Having pregnancy brain doesn\'t mean you aren\'t as smart and capable as ever.'),
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
