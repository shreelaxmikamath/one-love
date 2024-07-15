import 'package:flutter/material.dart';

class Week8Page extends StatelessWidget {
  const Week8Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 8 Highlights'),
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
            _buildSectionTitle('Your Baby\'s Hands and Feet'),
            _buildSectionContent(
                'Little fingers and toes are sprouting on your baby\'s hands and feet. At this stage, they are webbed, but as they grow more, the webbing will disappear. Nerves, bones, and muscles are developing inside your baby\'s tiny limbs.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Breast Changes'),
            _buildSectionContent(
                'Your breasts may be painful and swollen. If your regular bras are feeling tight, buy a few good maternity bras for support.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Get Plenty of Fluids'),
            _buildSectionContent(
                'It\'s important to drink enough when you\'re pregnant, especially if you\'re losing fluids by vomiting. Aim to have a minimum of 8 glasses of water a day. You might need more if the weather is very hot.'),
            const SizedBox(height: 16),
            _buildSectionTitle('How Many Months is 8 Weeks Pregnant?'),
            _buildSectionContent(
                'You\'re in the fourth week of your second month!'),
            const SizedBox(height: 32),
            const Text(
              'Baby Development at 8 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'This is a critical period in your baby’s development. His brain continues to become more complex as nerves branch out and connect to each other.'),
            _buildSectionContent(
                'From next week, your baby will no longer be called an embryo – he\'ll be a fetus. This means that the basic building blocks of his body are almost in place.'),
            _buildSectionContent(
                'Your baby’s arms are getting longer and his hands now meet in front of his chest. The embryonic tail is almost gone, and will eventually be replaced by a tailbone (coccyx).'),
            _buildSectionContent(
                'See how your baby looks up close this week and read more about his development at eight weeks pregnant.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby at 8 Weeks'),
            _buildSectionContent(
                '- Size: Your baby is the size of a kidney bean (rajma).\n- Length: 1.6 cm head to bottom.\n- Weight: 20 grams.'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy Symptoms at 8 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'Though you\'re unlikely to have gained much weight, parts of you are certainly growing, like your breasts. Make sure you support your changing breasts with the right kind of bra for pregnancy.'),
            _buildSectionContent(
                'The amount of blood circulating in your body is also increasing. By the end of pregnancy, you\'ll have 45 to 50 per cent more blood running through your veins. This increased blood flow, pregnancy hormones and your growing womb (uterus) can make you prone to varicose veins.'),
            _buildSectionContent(
                'Varicose veins happen when blood collects in weak spots in your veins, causing them to bulge under your skin. Symptoms often start to appear in the first trimester.'),
            _buildSectionContent(
                'Varicose veins will most likely appear on your legs, although it\'s possible to get them around your rectal area (piles) or genitals (vulval varicose veins). It\'s unlikely that they will cause you any serious problems. But you should mention them to your doctor at your next appointment.'),
            _buildSectionContent(
                'The pregnancy hormones that can lead to varicose veins are the same ones that make your blood pressure drop in the first trimester giving you the feeling of dizziness. See what you can do about dizziness in pregnancy.'),
            const SizedBox(height: 32),
            const Text(
              'What You Can Do at 8 Weeks Pregnant',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'If you haven\'t had any scans yet, your doctor will ask you to get one now. Your first scan will help to determine your due date more accurately and will tell you if you\'re having one or more babies. You\'ll also be able to hear your baby\'s heartbeat for the first time.'),
            _buildSectionContent(
                'Now that you\'re pregnant, you should try to get into a regular and safe exercise routine. Staying active can really help you build up your stamina and strength for labour and birth.'),
            _buildSectionContent(
                'Not all exercises are safe in pregnancy though. Make sure you run your exercise choice by your doctor before starting on anything to be certain it\'s suitable in your case. Also, know when it\'s definitely not safe to exercise in pregnancy!'),
            _buildSectionContent(
                'While it\'s fine to continue with your usual household chores, there are a few you might need to do slightly differently now that you\'re pregnant. Find out which household chores to avoid in pregnancy.'),
            _buildSectionContent(
                'Also be sure to keep the room well ventilated if you use cleaning chemicals such as bleach or toilet cleaners. The scent or fumes might trigger nausea.'),
            const SizedBox(height: 32),
            const Text(
              'Your Pregnancy Diet at 8 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'Morning sickness can strike any time during the day, not just in the morning. It can put you off food you usually loved or just off eating altogether.'),
            _buildSectionContent(
                'You can modify your eating habits to cope with morning sickness better in the following ways:'),
            _buildSectionContent(
                '- Take more frequent but smaller meals and snacks rather than three big meals.\n- Have cold foods such as fruit, sandwiches, salads or snacks. These might go down better than hot foods.\n- Eat something before getting out of bed in the morning and keep some snacks on your bedside in case you get hungry during the night.\n- Drink eight to 12 glasses of fluids in your day.'),
            _buildSectionContent(
                'For ideas on what to eat, see our healthy pregnancy snack suggestions and our pregnancy meal plans for the first trimester.'),
            const SizedBox(height: 32),
            const Text(
              'BabyCenter Mum Tip of the Week',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'I was experiencing nausea all day. This simple water mix has helped me a lot. Put mashed ginger, mint leaves and lemon juice in a bottle and fill it with filtered water. Cool and keep sipping throughout the day. Ginger will settle your stomach and make you less nauseous.\n- NewMomDiaries'),
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
