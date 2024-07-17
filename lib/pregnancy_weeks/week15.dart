import 'package:flutter/material.dart';

class Week15Page extends StatelessWidget {
  const Week15Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 15 '),
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
            _buildSectionTitle('Having an amnio?'),
            _buildSectionContent(
                'Amniocentesis can tell you whether your baby has genetic or chromosomal abnormalities. It\'s usually done between 15 and 20 weeks of pregnancy, so if you want to have one, talk to your healthcare provider to get it scheduled.'),
            const SizedBox(height: 32),
            const Text(
              'Baby development at 15 weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Sense of taste'),
            _buildSectionContent(
                'Your baby is forming taste buds, and nerves begin connecting them to the brain. By about 20 weeks, your baby\'s taste buds will be fully formed. During pregnancy, molecules of what you eat pass through your bloodstream and make it into your amniotic fluid. But your baby doesn\'t actually taste what you\'re eating – so don\'t worry that they won\'t enjoy what you\'re having for dinner.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby movement'),
            _buildSectionContent(
                'Your baby\'s legs are growing longer than their arms now, and they can move all of their joints and limbs. Your active baby is moving constantly, though you can\'t feel it yet.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby\'s face'),
            _buildSectionContent(
                'Your baby is looking more like a little person, with eyelids, eyebrows, eyelashes, nails, hair, and well-defined fingers and toes. If you could see inside your womb, you\'d catch your baby sucking a thumb, yawning, stretching, and making faces.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby is about the size of an apple'),
            _buildSectionContent(
                'LENGTH: 6.57 inches (head to toe)\nWEIGHT: 4.13 ounces'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 15',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Nasal congestion'),
            _buildSectionContent(
                'If your nose is stuffed up, you can probably chalk it up to the combined effect of hormonal changes and increased blood flow to your mucous membranes. This condition is so common there\'s even a name for it: rhinitis of pregnancy. To get relief, try using a humidifier or vaporizer in your room at night. Elevate your head with extra pillows when you sleep, and drink plenty of fluids. You can also try saline nasal spray – but don\'t use decongestants or other medications during pregnancy without talking to your healthcare provider.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Nose bleeds'),
            _buildSectionContent(
                'Keep the tissues handy: About 20 percent of pregnant women have nosebleeds thanks to increased blood volume and blood vessel expansion in the nose. These are usually harmless, but tell your provider if you have frequent nosebleeds. And if the blood flow is very heavy or doesn\'t stop after 30 minutes of applying pressure, call 911 or go to the emergency room.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Heartburn during pregnancy'),
            _buildSectionContent(
                'Heartburn (also called acid indigestion or acid reflux) is a burning sensation in your chest that usually occurs after eating or at night. You may experience heartburn for the first time during pregnancy due to physical and hormonal changes (thanks, progesterone!). Although heartburn is common and generally harmless, it can be very uncomfortable. For relief, check out these strategies for handling pregnancy heartburn.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Swollen gums'),
            _buildSectionContent(
                'If your gums are bleeding when you brush or floss, you\'re not alone. About half of pregnant women have swollen, red, tender gums due to pregnancy gingivitis, a mild form of gum disease. It\'s partly caused by hormonal changes that make your gums more sensitive to the bacteria in plaque. So don\'t blame yourself – but do what you can do take good care of your teeth and gums during pregnancy. Brush gently twice a day, floss daily, and visit the dentist for a checkup and cleaning. It\'s safe to go to the dentist while pregnant, just make sure to tell the staff that you\'re expecting.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pregnancy weight gain'),
            _buildSectionContent(
                'Hopefully you\'ve said goodbye to first-trimester nausea and food aversions and can start enjoying food again. If you started pregnancy at a healthy weight, you\'ll aim to gain about a pound a week for the rest of your pregnancy. You need about 340 extra calories a day in the second trimester, and a good way to make these count is with these healthy, nutrient-packed pregnancy snacks.'),
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
