import 'package:flutter/material.dart';

class Week13Page extends StatelessWidget {
  const Week13Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 13 '),
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
            _buildSectionTitle('Fading first-trimester symptoms'),
            _buildSectionContent(
                'As you cruise into the second trimester, you may get some relief from early pregnancy symptoms such as tender breasts, fatigue, food aversions, morning sickness, and the constant need to pee.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Breastfeeding prep'),
            _buildSectionContent(
                'You can\'t feel it, but your breasts may have already started making colostrum, the nutrient-rich fluid that feeds your baby for the first few days after birth, before your milk starts to flow. Later in pregnancy, your breasts may leak a little colostrum.'),
            const SizedBox(height: 32),
            const Text(
              'Baby development at 13 weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby can pee!'),
            _buildSectionContent(
                'Your baby has started swallowing amniotic fluid and excreting urine, recycling the full volume of fluid every few hours.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Making meconium'),
            _buildSectionContent(
                'As your baby swallows amniotic fluid, they also produce meconium. This black, sticky substance accumulates in the bowels, and becomes your newborn\'s first poop.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Teeth and bones'),
            _buildSectionContent(
                'Bones are beginning to harden in your baby\'s skeleton, especially longer bones and the skull. Your baby\'s teeth and bones are becoming denser.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby is about the size of a peapod'),
            _buildSectionContent(
                'LENGTH: 2.64 inches (head to bottom)\nWEIGHT: 2.58 ounces'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 13',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Cramping'),
            _buildSectionContent(
                'Occasional cramping during pregnancy is common. It could be caused by anything from gas and bloating to round ligament pain. Sometimes a little movement, a hot bath or shower, drinking more fluids, or lying down can do the trick to ease abdominal pain. But in some cases cramping can signal a problem. Call your doctor or midwife if your cramping doesn\'t go away after several minutes of rest, the cramping or pain is severe, you have pain or unusual sensitivity in your upper abdomen, or you have other symptoms such as fever or dizziness.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Returning appetite'),
            _buildSectionContent(
                'If you\'ve suffered from morning sickness and food aversions until now, you may get some welcome relief in the next few weeks as you enter the second trimester. As your appetite returns, food cravings may pop up. Some experts think that cravings for certain foods are linked to a woman\'s nutritional needs, but many think that pregnancy cravings can\'t be explained that easily.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Stuffy nose'),
            _buildSectionContent(
                'Are you congested lately? Nearly one-third of pregnant women get a stuffy nose due to hormones and increased blood volume. However, if you have a fever, coughing, sore throat, or swollen glands, it\'s probably a cold or another infection. Find out which cold medicines are safe when you\'re expecting, and eat foods high in vitamin C to keep your immune system strong.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Visible veins'),
            _buildSectionContent(
                'Because your body produces 30 to 50 percent more blood during pregnancy, your veins enlarge and are more visible. You may start seeing blue, prominent veins across your chest, breasts, and belly. You may also develop varicose veins in your legs and lower body as your uterus grows. Happily, these usually disappear or improve after you have your baby.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Vaginal discharge'),
            _buildSectionContent(
                'It\'s totally normal to have more vaginal discharge during pregnancy: It\'s because of higher levels of estrogen. If your discharge is odorless or mild-smelling and milky white, there\'s no need for concern. But call your healthcare provider if you have discharge that\'s gray, yellow, or green; causes pain or itching; or seems unusual in any other way. This could be a sign of infection or another problem.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Heartburn'),
            _buildSectionContent(
                'Hormonal and physical changes during pregnancy can lead to heartburn (also called acid indigestion or acid reflux). It\'s an unpleasant burning sensation between your lower throat and the bottom of your breast bone. If you\'re having heartburn, avoid spicy and acidic foods. Try eating smaller meals, eating slowly, and chewing gum after eating to neutralize your stomach acids. If that doesn\'t help, ask your provider about pregnancy-safe heartburn medicines.'),
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
