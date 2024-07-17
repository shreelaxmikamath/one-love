import 'package:flutter/material.dart';

class Week14Page extends StatelessWidget {
  const Week14Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 14 '),
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
            _buildSectionTitle('Welcome to your second trimester!'),
            _buildSectionContent(
                'This is many moms\' favorite part of pregnancy. You\'ll feel your baby move, see them on an ultrasound, and get a break from some unpleasant early and late pregnancy symptoms.'),
            const SizedBox(height: 32),
            const Text(
              'Baby development at 14 weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Making faces'),
            _buildSectionContent(
                'Thanks to brain impulses, your baby\'s facial muscles are getting a workout. Those tiny features can squint, frown, and grimace. Your baby is also making sucking and chewing movements.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Growing hair'),
            _buildSectionContent(
                'Soft baby hair is coming: Hair follicles have started to form deep in your baby\'s skin. Around 20 weeks, fine downy hair will sprout from these follicles on your baby\'s eyebrows, upper lip, and chin.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your active baby'),
            _buildSectionContent(
                'Though you can\'t feel those tiny punches and kicks yet, your baby is quite active and has flexible hands and feet.'),
            const SizedBox(height: 16),
            _buildSectionTitle('They grow so fast!'),
            _buildSectionContent(
                'You may wonder why this week\'s fetal length measurement (below) is so much bigger than last week\'s. Your baby hasn\'t doubled in length in a week – there\'s just a change in how they\'re measured at 14 weeks (from head to bottom to head to toe).'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby is about the size of a lemon'),
            _buildSectionContent(
                'LENGTH: 5.79 inches (head to toe)\nWEIGHT: 3.28 ounces'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 14',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('No more morning sickness?'),
            _buildSectionContent(
                'Your energy is likely returning, and your queasiness may have eased by now. If not, hang on – chances are good that morning sickness will soon be behind you if it\'s not already. Although it\'s uncommon, some expecting moms will still feel nauseated months from now. Tell your healthcare provider at your next appointment if you\'re still having nausea or vomiting.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Starting to show'),
            _buildSectionContent(
                'The top of your uterus is a bit above your pubic bone, which may be enough to push your tummy out a tad. Starting to show can be quite a thrill, giving you and your partner visible evidence of the baby you\'re waiting for. If you\'re curious about how other women look at 14 weeks pregnant, check out our pregnant bellies photo gallery.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Bleeding gums'),
            _buildSectionContent(
                'About half of pregnant women have swollen, red, tender gums that bleed when flossed or brushed. This gum inflammation, called pregnancy gingivitis, is partly caused by hormonal changes that make your gums more sensitive to the bacteria in plaque. Be sure to brush your teeth twice daily, and floss daily.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Round ligament pain'),
            _buildSectionContent(
                'On either side of your uterus, you have two ligaments that stretch and thicken to accommodate your growing belly. These changes may cause round ligament pain. It can feel like a short, stabbing pain in response to movement, or a dull ache after an especially active day. If round ligament pain strikes, try to stop and rest, pay attention to your posture, change positions, gently massage the area, or take a warm bath. Some women find that wearing a maternity belt for extra support helps relieve the pain.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Increased appetite'),
            _buildSectionContent(
                'Pregnancy hunger starts and peaks in the second trimester. Your body is working hard to support your baby, and that requires plenty of energy. Your meals are also fueling your body\'s pregnancy changes – which include a much higher blood volume, your growing breasts and uterus, and increased fat stores. You need an extra 300 to 350 calories per day in the second trimester. If you\'re wondering how it all fits together, learn about planning healthy pregnancy meals.'),
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
