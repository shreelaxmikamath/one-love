import 'package:flutter/material.dart';

class Week6Page extends StatelessWidget {
  const Week6Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 6'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Highlights this Week',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSectionTitle('Your first ultrasound scan'),
            _buildSectionContent(
              'Many newly pregnant women get their first ultrasound scan at around this time. '
                  'If you do, you might be able to hear your baby\'s heartbeat! '
                  'You\'ll also get a more accurate due date from your first scan report. '
                  'At this stage, it\'s likely to be a transvaginal scan.',
            ),
            _buildSectionTitle('Morning sickness relief'),
            _buildSectionContent(
              'Nausea and vomiting, often called morning sickness (even though it can strike at any time of the day), might start around this week. '
                  'Try to have small meals throughout the day to help keep nausea at bay. '
                  'Snacking on bland foods, drinking ginger tea, and sniffing limes can also relieve nausea.',
            ),
            _buildSectionTitle('Spotting or bleeding'),
            _buildSectionContent(
              'Many women get light bleeding or spotting around this week. It can be because of breakthrough bleeding or implantation bleeding. '
                  'Both these causes are considered harmless and usually cause very light bleeding that stops in a day or two. '
                  'Inform your doctor however so she can check that all is well with your pregnancy.',
            ),
            _buildSectionTitle('How many months is 6 weeks pregnant?'),
            _buildSectionContent(
              'You\'re in the second week of your second month!',
            ),
            const SizedBox(height: 20),
            const Text(
              'Baby Development at 6 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSectionContent(
              'Your baby\'s facial features are starting to form. He has dark spots where his eyes will form and tiny holes for nostrils. '
                  'His arms and legs are beginning to emerge.\n\n'
                  'Your baby’s heart is dividing into four chambers and is beating twice as fast as yours, at 160 beats a minute.\n\n'
                  'See what your baby looks like now, and read more about his development at six weeks.',
            ),
            _buildSectionTitle('Your baby is the size of a lentil (dal)'),
            _buildSectionContent(
              'Your baby is the size of a lentil (dal).',
            ),
            const SizedBox(height: 20),
            const Text(
              'Pregnancy Symptoms at 6 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSectionContent(
              'The outside world won’t see any sign of the dramatic developments taking place inside you, but you’re probably already experiencing some common pregnancy symptoms, such as morning sickness.\n\n'
                  'Although it’s difficult to prevent morning sickness completely, thankfully there are plenty of ways to ease your nausea.\n\n'
                  'See your doctor if sickness is making your life miserable or if you really can\'t keep any food or fluids in.\n\n'
                  'Even though the changes inside may be making you very tired, you might not get a peaceful rest at night. Your hormones and increased blood flow to your kidneys can result in frequent urination, which might be sending you to the washroom at night.\n\n'
                  'And you\'ll probably find it hard to get comfortable in bed if your breasts are painful.\n\n'
                  'Check out our tips on getting a good night’s sleep in pregnancy.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Body at 6 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSectionContent(
              'If you haven\'t already, make sure you go for your first prenatal appointment this week. Key to a healthy pregnancy is to be followed by your obstetrician regularly.\n\n'
                  'Your first ultrasound scan will give you an accurate due date and check how many babies you are carrying. During the scan, you might hear your baby\'s heartbeat for the first time.\n\n'
                  'If you\'ve had spotting, your doctor might ask you to get a transvaginal scan to ensure all is well. Rest assured that a bit of spotting at the time you would have usually had your period is considered normal.\n\n'
                  'At your first check-up, your doctor will give you a long list of routine blood tests to get done. These are important to help your doctor give you the right medical care through your pregnancy.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Pregnancy Diet at 6 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSectionContent(
              'By now you are probably taking your daily folic acid supplement and eating foods rich in folate and iron. But besides what you should be eating, it\'s important to also know what you shouldn\'t eat in pregnancy.\n\n'
                  'Unfortunately, there are a lot of myths around what is harmful, not all of which are true. To help you decide what to avoid, we\'ve rounded up what you shouldn\'t eat as well as addressed some of the most common pregnancy diet myths:\n\n'
                  '• What isn\'t safe to eat during pregnancy\n'
                  '• Can heating foods cause a miscarriage?\n'
                  '• Is it safe to eat papaya (papita)?\n'
                  '• Is it safe to eat nuts and dried fruit in pregnancy?\n'
                  '• Do I need to include whole milk and ghee in my diet during pregnancy?\n'
                  '• Will drinking milk with saffron make my baby \'fair\'?\n\n'
                  'Also see our diet tips for the second month of pregnancy.',
            ),
            const SizedBox(height: 20),
            const Text(
              'BabyCenter Mum Tip of the Week',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSectionContent(
              'Smelling ginger helped me so much! This was helpful when smells got overpowering, especially when walking around outside. I would carry a piece with me and just sniff it, and the feeling of nausea would leave.\n'
                  '- Nasreensmom',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        content,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
