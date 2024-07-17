import 'package:flutter/material.dart';

class Week5Page extends StatelessWidget {
  const Week5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 5'),
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
            _buildSectionTitle('Early Pregnancy Symptoms'),
            _buildSectionContent(
                'You may start feeling some early pregnancy symptoms like fatigue, painful or swollen breasts, nausea, and the need to pee more often. Some of these might come on only a few weeks later.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your Baby\'s Heartbeat'),
            _buildSectionContent(
                'Your baby\'s heart starts beating around this week and you are likely to hear it when you go for your first scan.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Eat Plenty of Iron-Rich Foods'),
            _buildSectionContent(
                'Anaemia (low haemoglobin) is common among women in India. Make sure you eat plenty of foods rich in iron to help keep your haemoglobin (Hb) in a healthy range. This is important during pregnancy as haemoglobin (Hb) is the protein in our blood that carries oxygen to all the parts of our body, including to your baby.'),
            const SizedBox(height: 16),
            _buildSectionTitle('How Many Months is 5 Weeks Pregnant?'),
            _buildSectionContent(
                'You\'re in the first week of your second month of pregnancy!'),
            const SizedBox(height: 32),
            const Text(
              'Baby Development at 5 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'You may not look pregnant yet, but your baby is growing rapidly. This week your baby\'s heart starts beating and pumping blood around her tiny body. Major organs, including the kidneys, have begun to develop, and the neural tube, which connects your baby\'s brain and spinal cord, is closing. Little buds that will become her arms are sprouting.'),
            const SizedBox(height: 16),
            _buildSectionContent(
                'See what your baby looks like now, and read more about her development at five weeks.'),
            const SizedBox(height: 16),
            _buildSectionContent(
                'Your baby at 5 weeks: \n- Size: Your baby is the size of a sesame seed (til). \n- Appearance: Embryo is made up of three layers - ectoderm, mesoderm, and endoderm.'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy Symptoms at 5 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'You may have already started feeling some pregnancy symptoms, or you may not be feeling anything different at all yet. Both are normal. Some symptoms, such as morning sickness, usually won\'t start for another week or so.'),
            const SizedBox(height: 16),
            _buildSectionContent(
                '- Fatigue: Most women feel extremely tired at this stage.'),
            _buildSectionContent(
                '- Frequent Urination: Pregnancy hormones might be sending you to the washroom more often than usual.'),
            _buildSectionContent(
                '- Headaches: You may also get more headaches in the first trimester.'),
            _buildSectionContent(
                '- Breast Sensitivity: If your breasts are sensitive or painful, know that this will pass soon.'),
            _buildSectionContent(
                '- Mild Abdominal Cramps: This is normal for this stage of pregnancy but do mention it to your doctor if you\'re uncomfortable.'),
            const SizedBox(height: 32),
            const Text(
              'Your Body at 5 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'Miscarriages are sadly common in the first trimester and usually caused by chromosome problems. If this is your first pregnancy, or you are pregnant after a miscarriage, you might be very worried about the risk of losing the pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionContent(
                'Try to read up on what puts you at risk of a miscarriage and the signs to watch out for. If your blood tests show that you have low Hb, your doctor might ask you to take iron supplements to help prevent or treat anaemia. Many of the discomforts you have or will start to feel over the next few weeks are normal. However, there are some pregnancy symptoms that you should never ignore. If you experience any of these danger signs, seek medical help immediately.'),
            const SizedBox(height: 32),
            const Text(
              'Your Pregnancy Diet at 5 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'Try to get into the habit of eating well. It\'ll help to keep your energy levels up, and your baby will benefit if your meals include a variety of nutrients.'),
            const SizedBox(height: 16),
            _buildSectionContent(
                'Nutrient Focus:\n- Vitamin C: Good sources include citrus fruit such as oranges (santara) or limes (nimbu), Indian gooseberry (amla), red or green peppers (lal, hari shimla mirch), and potatoes (aloo).\n- Iron-rich foods: These will help you meet the growing needs of your body and help prevent anaemia. Vitamin C helps your body to absorb the iron you take in from your food. And don\'t forget to take your daily supplements of folic acid.'),
            const SizedBox(height: 32),
            const Text(
              'BabyCenter Mum Tip of the Week',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionContent(
                'I maintain a food diary to keep track of the quality of food I eat. I am also cutting back on greasy and sweet stuff and snack on nuts instead.\n- Sitharaj'),
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
