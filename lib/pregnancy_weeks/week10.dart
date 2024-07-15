import 'package:flutter/material.dart';

class Week10Page extends StatelessWidget {
  const Week10Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 10 Highlights'),
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
            _buildSectionTitle('Your Baby\'s Heart'),
            _buildSectionContent(
                'Your baby\'s heart is now fully developed with its four chambers and beating rapidly to keep the blood circulating in your baby\'s body. You\'ll probably hear it at your first scan!'),
            const SizedBox(height: 16),
            _buildSectionTitle('A Need to Pee'),
            _buildSectionContent(
                'As your baby and uterus grow, the weight presses down on your bladder. This can make you feel like using the washroom more often during the day and night. You\'ll get back to a more normal bathroom schedule when your uterus moves higher up in your abdomen and puts less pressure on your bladder.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Making Love in Pregnancy'),
            _buildSectionContent(
                'Unless your doctor has specifically said not to for medical reasons, it is considered safe to have sex in the first trimester.'),
            const SizedBox(height: 16),
            _buildSectionTitle('How Many Months is 10 Weeks Pregnant?'),
            _buildSectionContent(
                'You\'re in the second week of your third month!'),
            const SizedBox(height: 32),
            const Text(
              'Baby Development at 10 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'Your baby\'s heart is now fully developed, and beats about 180 times a minute. His legs can rotate at the hip joint, and his arms can move at the shoulder. He\'s testing this new flexibility by instinctively kicking and moving his limbs.'),
            _buildSectionContent(
                'Your baby’s forehead is bulging with his developing brain, although this is only temporary. And he’s beginning to lift his chin from his chest so that his head is more upright.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby at 10 Weeks'),
            _buildSectionContent(
                '- Size: Your baby is the size of an olive (jaitoon).\n- Length: 3.1 cm head to bottom.\n- Weight: 35 grams.'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy Symptoms at 10 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'You\'re approaching the end of your first trimester. As your first trimester ends, your risk of miscarriage drops.'),
            _buildSectionContent(
                'If you’re suffering from morning sickness and tiredness, you’ll be happy to hear that these symptoms should start to ease off once you start your second trimester.'),
            _buildSectionContent(
                'You may be feeling a little dizzy, which is normal during your first trimester, as the pregnancy hormone progesterone relaxes the walls of your blood vessels. If you’re experiencing dizzy spells, try getting up more slowly, to give your body time to adjust to your new position.'),
            const SizedBox(height: 32),
            const Text(
              'What You Can Do at 10 Weeks Pregnant',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'Although your first trimester is not yet over, it is time to think ahead to which doctor you want at the birth of your baby. In India, the obstetrician you see during pregnancy is often the one who will deliver your baby.'),
            _buildSectionContent(
                'During your first trimester, try a few doctors until you find an obstetrician you want to continue with. Look out for these signs of a good doctor!'),
            _buildSectionContent(
                'Many couples worry that sex is not safe in pregnancy, especially during the first trimester. But unless your doctor has specifically asked you not to have sex, there is no need to abstain.'),
            const SizedBox(height: 32),
            const Text(
              'Your Pregnancy Diet at 10 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'You might still have quite a bit of nausea. Ensure you stay well hydrated even if you don\'t feel like eating much. You should have between eight and 12 glasses of liquid every day.'),
            _buildSectionContent(
                'Drink during the day and reduce your fluid intake about two hours before bedtime so you won\'t have to go to the loo all night.'),
            _buildSectionContent(
                'Moderate amounts of caffeinated drinks like tea or coffee are considered safe in pregnancy, but too much caffeine can harm your baby\'s development. Read about how much caffeine is safe in pregnancy.'),
            const SizedBox(height: 32),
            const Text(
              'FAQs at 10 Weeks Pregnant',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'I have much more saliva than usual. Is this normal?\nHow much weight do I need to put on?\nShould I worry if I have low platelets?'),
            const SizedBox(height: 32),
            const Text(
              'Tip of the Week',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'I feel yoga helps me in maintaining the flexibility of my body and meditation helps me control my blood pressure. After doing all this I get peaceful sleep and the feeling of calmness.\n- Manasi Sebastian'),
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
