import 'package:flutter/material.dart';

class Week16Page extends StatelessWidget {
  const Week16Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 16 '),
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
            _buildSectionTitle('Baby kicks coming soon'),
            _buildSectionContent(
                'You\'ll probably start feeling your baby move between 16 and 22 weeks, most likely when you\'re sitting or lying quietly. Veteran moms usually notice the first subtle flutters, known as "quickening," earlier than first-time moms.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pregnancy glow'),
            _buildSectionContent(
                'Glowing skin during pregnancy isn\'t a myth – it\'s a real thing that happens thanks to fluctuating hormone levels and increased blood flow. You\'re most likely to have a pregnancy glow in the second trimester.'),
            const SizedBox(height: 32),
            const Text(
              'Baby development at 16 weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Delicate baby skin'),
            _buildSectionContent(
                'Your baby\'s skin is thin and translucent. It will thicken and develop as your pregnancy progresses, but will continue to be almost transparent for quite some time.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Scalp patterning'),
            _buildSectionContent(
                'On your baby\'s scalp, hair follicles are forming a pattern that will remain for life. This patterning sets the stage for how your baby\'s hair will grow. New hair follicles don\'t form after birth, so babies are born with all the hair follicles they\'ll ever have.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Heart at work'),
            _buildSectionContent(
                'Your baby\'s heart is now pumping about 25 quarts of blood each day, and this amount will continue to increase as your little one develops.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby is about the size of an avocado'),
            _buildSectionContent(
                'LENGTH: 7.32 inches (head to toe)\nWEIGHT: 5.15 ounces'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 16',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Round ligament pain'),
            _buildSectionContent(
                'As your amazing uterus grows, the round ligaments that support it are thickening and stretching. Unfortunately, this can lead to a sharp, stabbing pain on one or both sides of your abdomen called round ligament pain. If this happens, try to stop and rest – round ligament pain should ease up quickly. If you still feel cramping after resting, call your doctor or midwife.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Gas and bloating'),
            _buildSectionContent(
                'Your body is producing way more gas than usual thanks to the hormone progesterone, which relaxes muscles throughout your body – including your digestive tract. Those relaxed muscles slow down your digestion, leading to more gas and bloating and uncomfortable sensations in your gut. To get relief from gas, eat smaller, more frequent meals and take your time when eating. Avoid carbonated drinks and the artificial sweetener sorbitol. And get moving – a quick walk can get your digestion moving.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Back pain'),
            _buildSectionContent(
                'Many women experience back pain during pregnancy. As your uterus expands, it weakens your abdominal muscles and puts extra strain on your lower back. Hormonal changes also loosen your joints and relax the ligaments that attach your pelvic bones to your spine, causing unsteadiness and pain. Exercises such as weight training, prenatal yoga, walking, swimming, and pelvic tilts can help strengthen muscles and reduce discomfort. You can also ask your partner or a friend to give you a pregnancy massage for back pain, or book a prenatal massage with a practitioner.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Breast changes'),
            _buildSectionContent(
                'You\'ve probably noticed breast changes like sore nipples, breast tenderness, prominent veins, pigment changes, and more pronounced bumps on your areolas. Sometimes pregnant women develop lumps and bumps in their breasts, too. These are usually harmless and could be milk-filled cysts (galactoceles) or benign breast tumors (fibroadenomas). It\'s unusual for a woman to develop anything serious (like breast cancer) during pregnancy. But let your provider know about any lumps that are hard or otherwise concerning.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Forgetfulness'),
            _buildSectionContent(
                'Is "pregnancy brain" real? Researchers aren\'t sure, but many moms-to-be report having moments of absentmindedness and trouble focusing. No one knows exactly why this happens, but it seems likely that a combination of stress and anxiety, fatigue, and hormones could lead to forgetfulness during pregnancy. If you\'re having trouble keeping track of things in your daily life, try simplifying wherever possible, asking for help, and using your phone\'s calendar and other apps to stay organized.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pregnancy headaches'),
            _buildSectionContent(
                'Headaches during pregnancy are common, and can be caused by stress, dehydration, lack of sleep, cutting back on caffeine, hormonal changes, and other regular things. If you have a severe headache in the second or third trimester, however, it could be a sign of preeclampsia. Call your provider if you have a bad headache or a headache for the first time.'),
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
