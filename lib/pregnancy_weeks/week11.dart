import 'package:flutter/material.dart';

class Week11Page extends StatelessWidget {
  const Week11Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 11'),
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
            _buildSectionTitle('When you\'ll feel kicks'),
            _buildSectionContent(
                'Your baby is busy somersaulting and stretching, but they\'re still too small for you to notice it. You probably won\'t feel your baby move until you\'re at least 16 weeks pregnant.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby\'s fingers and toes'),
            _buildSectionContent(
                'Your baby\'s tiny fingers and toes have lost their webbing and are distinct – and longer.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Organs are working'),
            _buildSectionContent(
                'As you reach the end of the first trimester, all your baby\'s vital organs are in place, and many have already started to function. The liver is making red blood cells, kidneys are making urine, and the pancreas starts making insulin. The four chambers of your baby\'s heart are fully formed, and your baby\'s heart is beating.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Genitals are forming'),
            _buildSectionContent(
                'By the end of this week, your baby\'s genitals will start developing. The external sex organs – the penis and scrotum in boys, the clitoris and labia in girls – don\'t start to differ from each other until about 11 weeks. And even then, it takes several more weeks to be able to easily see the difference between boys and girls on an ultrasound.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby is about the size of a fig'),
            _buildSectionContent(
                'LENGTH: 1.61 inches (head to bottom)\nWEIGHT: 1.59 ounces'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 11',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Constipation and gas'),
            _buildSectionContent(
                'Constipation, gas, and bloating are all common during pregnancy due partly to hormonal changes, which can slow digestion. To keep things moving, sip water throughout the day, eat high-fiber foods (like fresh fruits and vegetables), and exercise to keep things moving.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Heartburn'),
            _buildSectionContent(
                'You may begin to feel heartburn (also called acid indigestion), a burning sensation that often extends from the bottom of your breastbone to your lower throat. Many women get heartburn for the first time during pregnancy or find that it gets worse. To reduce heartburn, don\'t lie down after you eat; avoid foods that are fatty, spicy, fried, or highly seasoned; eat smaller meals; and don\'t drink too many liquids with your meals.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Conflicting emotions'),
            _buildSectionContent(
                'There\'s no way around it, your life changes profoundly when you have a baby. You may be excited for the changes, slightly nervous, or anxious – depending on the day. Be sure to prioritize rest, plan healthy meals, exercise safely, and share your feelings with someone you trust. By taking care of yourself, you\'re also taking care of your baby.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Fatigue'),
            _buildSectionContent(
                'Pregnancy fatigue is probably still going strong. Hang in there, you may feel a big burst of energy soon when you get to your second trimester. Keep your strength up by eating nutritious pregnancy snacks, going to bed earlier, taking naps, and cutting out unnecessary tasks and commitments.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Vaginal discharge'),
            _buildSectionContent(
                'Increased levels of estrogen might lead to more vaginal discharge in your underwear. Healthy discharge is clear to milky-white and mild-smelling. Call your doctor or midwife if your discharge has an unpleasant smell; causes pain or itching; or appears gray, yellow, or green.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Food aversions'),
            _buildSectionContent(
                'Both food cravings and the opposite – food aversions – are common and normal during pregnancy. It\'s estimated that about 60 percent of pregnant women have food aversions, likely due to hormonal changes and a heightened sense of smell. It\'s possible that your appetite could be out of whack until your baby is born, but typically food aversions (like morning sickness) go away in the second trimester.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Headaches'),
            _buildSectionContent(
                'Headaches in the first trimester are often caused by hormonal changes, stress, congestion, allergies, lack of sleep, or dehydration. Some women have a migraine headache for the first time while pregnant, though many women who are prone to migraines find these actually improve during pregnancy. Exercising, watching out for headache triggers, and taking acetaminophen (with your healthcare provider\'s okay) are some safe ways to avoid and treat pregnancy headaches.'),

            const Text(
              '11 weeks pregnant bellies',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'If you don\'t notice a bump yet, don\'t be concerned. Every woman and every baby bump is different, and there isn\'t an exact time when pregnancy starts showing. You\'ll start looking noticeably pregnant when your growing uterus begins to expand above the pubic bone, which may happen when you\'re around 12 weeks pregnant at the earliest, but often a few weeks later. Before 12 weeks, the uterus remains within the pelvis and isn\'t usually visible.'),
            const SizedBox(height: 16),
            _buildSectionContent(
                'The size of your belly depends on the position of your uterus in your body, your height and weight, and whether you\'ve had a baby before. Moms often start showing with a second pregnancy sooner, since their uterine and abdominal muscles have been stretched from their earlier pregnancy.'),
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
