import 'package:flutter/material.dart';

class Week19Page extends StatelessWidget {
  const Week19Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 19 '),
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
              'Baby development at 19 weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Fingerprints'),
            _buildSectionContent(
                'The skin on your baby\'s fingers and toes has formed distinct patterns. These fingerprints (and toeprints) are now permanent and unique – even among identical twins!'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby\'s senses'),
            _buildSectionContent(
                'Your baby\'s sensory development is exploding. Their brain is designating specialized areas for smell, taste, hearing, vision, and touch.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Vernix caseosa'),
            _buildSectionContent(
                'A white, waxy coating called vernix caseosa is forming on your baby\'s skin. Vernix has many benefits: It protects and moisturizes your baby\'s skin, protects against harmful bacteria, and helps the lungs and digestive tract develop.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby is about the size of an heirloom tomato'),
            _buildSectionContent(
                'LENGTH: 9.45 inches (head to toe)\nWEIGHT: 9.63 ounces'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 19',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Round ligament pain'),
            _buildSectionContent(
                'As your uterus grows, the ligaments that connect it to your pelvis stretch and thicken. This can cause a sharp, stabbing pain called round ligament pain. The sensation may feel like it starts deep inside your groin and moves upward and outward on either side to the top of your hips. If round ligament pain strikes, stop and rest if you can, and avoid movements or positions that trigger it. Round ligament pain is brief, and should ease quickly.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Abdominal pain'),
            _buildSectionContent(
                'If you\'re having abdominal cramping and it doesn\'t go away with rest, call your doctor or midwife. Also call if the cramping causes severe pain, or is accompanied by another symptom like fever or dizziness. Another warning sign: You have pain in the upper abdomen, or your abdomen is unusually sensitive to touch, especially when pressure is released (this could signal an abdominal infection).'),
            const SizedBox(height: 16),
            _buildSectionTitle('Skin changes'),
            _buildSectionContent(
                'Are the palms of your hands red? It\'s from extra estrogen. You may also have patches of darkened skin on your upper lip, cheeks, and forehead – that\'s called melasma, or the "mask of pregnancy." Pregnancy hormones act on the cells that contain melanin, which can also lead to darkening of your nipples, freckles, scars, underarms, inner thighs, and vulva. Also, you\'ll probably see a darkened line running from your belly button to your pubic bone – that\'s the linea nigra, or "dark line." All these changes in pigmentation should fade after pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Nosebleeds'),
            _buildSectionContent(
                'One in five pregnant women have nosebleeds. Due to increased blood volume, pregnancy causes the blood vessels in your nose to expand, which makes them break and bleed more often. This is more likely to happen if you have a cold or allergies, or you\'re in particularly dry air. If you get a bloody nose during pregnancy, sit down and lean forward while keeping your head higher than your heart. Pinch the lower part of your nose with your thumb and index finger for 10 to 15 minutes, breathing through your mouth. You can also apply cold to the bridge of your nose to constrict the blood vessels and slow the bleeding.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Shortness of breath'),
            _buildSectionContent(
                'Feeling out of breath lately? You\'re not imagining it – you need more oxygen during pregnancy, and your body adapts by inhaling and exhaling more air with each breath. Plus, later in pregnancy your breathing might feel more labored as your growing uterus puts pressure on your diaphragm. If you\'re feeling breathless, pause and rest. But if your shortness of breath is sudden or severe, or you have other troubling symptoms like a rapid or irregular heartbeat, call your provider. If you can\'t reach them, call 911 or go to the ER.'),
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
