import 'package:flutter/material.dart';

class Week12Page extends StatelessWidget {
  const Week12Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 12 Highlights'),
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
            _buildSectionTitle('Your growing uterus'),
            _buildSectionContent(
                'Your uterus has grown to the size of a grapefruit! Your healthcare provider can now feel the top of it (the fundus) low in your abdomen, above your pubic bone.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Miscarriage rate drops'),
            _buildSectionContent(
                'If you\'ve been worried about miscarriage (like many expecting parents), here\'s some happy news: The risk drops significantly as your pregnancy progresses. Once you\'ve had a first prenatal visit and seen or heard your baby\'s heartbeat, the chance of miscarriage is very low.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby is fully formed'),
            _buildSectionContent(
                'All of your baby\'s vital organs and body parts are in place. They\'ll continue to develop throughout your pregnancy.'),
            const SizedBox(height: 16),
            const Text(
              'Baby development at 12 weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Small movements'),
            _buildSectionContent(
                'This week, your baby can open and close their hands (making a fist) and curl their toes.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Tiny fingernails'),
            _buildSectionContent(
                'Your baby has itsy bitsy nails growing on their fingers and toes.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby\'s intestines'),
            _buildSectionContent(
                'The stomach and esophagus started forming around 7 weeks of pregnancy, and your baby\'s intestines grew so fast that they protruded into the umbilical cord. Soon, the abdominal wall will close and their intestines will make their way inside their abdomen.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby is about the size of a lime'),
            _buildSectionContent(
                'LENGTH: 2.13 inches (head to bottom)\nWEIGHT: 2.05 ounces'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 12',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Pregnancy stress'),
            _buildSectionContent(
                'It\'s normal to feel some stress during pregnancy. Many moms-to-be (and partners) worry about their baby\'s health, finances, and how they\'ll handle the changes ahead. But if stress becomes constant or overwhelming, talk to your doctor or midwife. Chronic stress isn\'t good for you, and it can spiral into pregnancy depression or anxiety.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Headaches'),
            _buildSectionContent(
                'Headaches are a common pregnancy symptom at 12 weeks. You may be able to avoid them by eating small meals frequently, drinking plenty of water, getting enough sleep, exercising, practicing relaxation techniques like meditation and yoga, and getting a prenatal massage. If you\'re suffering from a headache, apply heat or cold to your forehead or the base of your skull, take a shower, and consider acupuncture. Healthcare providers consider acetaminophen (Tylenol) the safest over-the-counter pain reliever during pregnancy, but talk to your doctor or midwife before taking any medication during pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Food aversions'),
            _buildSectionContent(
                'Pregnancy hormones and a heightened sense of smell are likely behind any food aversions you\'re experiencing. About 60 percent of pregnant women have aversions, often to meat, eggs, dairy products, spicy foods, foods with strong smells, and coffee. The odds are good that food aversions will fade as you enter your second trimester. Until then, try eating bland or cold foods, which can be easier to stomach. If food smells make you sick, see if your partner or a loved one can do the cooking for now.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Fatigue'),
            _buildSectionContent(
                'Still exhausted? Studies show that 95 percent of pregnant women experience fatigue during pregnancy, especially in the first trimester. Most likely, you can look forward to having more energy in the second trimester. Many expecting moms start to feel tired again in the third trimester, when they\'re carrying more weight and having more sleep disturbances. Though it may seem counterintuitive, gentle exercise is one of the best ways to keep your energy up during pregnancy. And though it\'s normal, pregnancy fatigue can be a symptom of iron-deficiency anemia or depression, so talk to your provider if it\'s not letting up.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Dizziness'),
            _buildSectionContent(
                'Dizziness in pregnancy happens because your cardiovascular system undergoes dramatic changes: Your heart rate goes up, your heart pumps more blood per minute, and the amount of blood in your body increases by 30 to 50 percent. If you feel dizzy or lightheaded, lie down on your side to maximize blood flow to your body and brain. If you can\'t lie down, sit down and put your head between your knees.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Shortness of breath'),
            _buildSectionContent(
                'If you feel like you can\'t catch a full breath, you\'re not imagining it. Being short of breath during pregnancy isn\'t uncommon. You need more oxygen when you\'re expecting, and an increase in progesterone actually expands your lung capacity so you can take deeper breaths. However, if you have a respiratory issue like asthma, it may worsen during pregnancy. And while some shortness of breath is normal, if you have symptoms like chest pain, a rapid or irregular heartbeat, or severe or sudden shortness of breath, call your provider immediately.'),
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
