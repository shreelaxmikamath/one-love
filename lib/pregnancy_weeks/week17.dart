import 'package:flutter/material.dart';

class Week17Page extends StatelessWidget {
  const Week17Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 17 Highlights'),
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
            _buildSectionTitle('Your baby can hear you'),
            _buildSectionContent(
                'Between 16 and 22 weeks, your baby will start to hear sounds inside your body, including the noises made by your heartbeat, breathing, and digestion.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Better sleep'),
            _buildSectionContent(
                'Resting easier in the second trimester? Enjoy it – and switch to sleeping on your side soon if you haven\'t already. Side sleeping places the least pressure on your veins and internal organs, ensuring the best blood flow to the uterus. That means your baby will get maximum nutrients and oxygen.'),
            const SizedBox(height: 32),
            const Text(
              'Baby development at 17 weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby\'s bones'),
            _buildSectionContent(
                'Your baby\'s skeleton is changing from soft cartilage to bone. Support your baby\'s bone health (and your own) by eating calcium-rich foods. Getting enough calcium also reduces your risk of hypertension and preeclampsia.'),
            const SizedBox(height: 16),
            _buildSectionTitle('The umbilical cord'),
            _buildSectionContent(
                'The umbilical cord – your baby\'s lifeline to the placenta – is growing stronger and thicker. By the end of pregnancy, it will be approximately 9 inches long and an inch thick. The umbilical cord delivers nutrients to your baby and ferries away waste products.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby is about the size of a turnip'),
            _buildSectionContent(
                'LENGTH: 8.03 inches (head to toe)\nWEIGHT: 6.38 ounces'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 17',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Dizziness'),
            _buildSectionContent(
                'Feeling a little lightheaded or like the room is spinning? This is a common symptom during the second trimester and is most likely due to normal pregnancy-related cardiovascular changes (a higher heart rate, bigger blood vessels to accommodate an increased blood volume, and temporary changes in circulation). Here\'s how to handle feeling dizzy during pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Vision changes'),
            _buildSectionContent(
                'You may notice your vision seems blurrier and your eyes are drier. Strange though this seems, vision changes are common during pregnancy. Pregnancy changes in hormones, metabolism, fluid retention, and blood circulation can all affect your eyes and eyesight. These changes are usually minor and will go away after you have your baby. Sometimes vision changes can be caused by a more serious condition, though, so talk to your doctor or midwife if you have blurry vision, double vision, temporary loss of vision, or anything else unusual.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Itchy skin'),
            _buildSectionContent(
                'Mild itching is a normal pregnancy skin problem. You may feel it especially around your breasts and belly where the skin is stretching a lot. Sometimes eczema worsens during pregnancy, also making for itchiness. For relief, try applying an ice pack or a cold compress to the itchy area, moisturize using fragrance-free lotion (refrigerate the lotion first for extra cooling), or take a warm oatmeal bath. Be sure to call your healthcare provider if you\'re very itchy or if you develop a new rash.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Stretch marks'),
            _buildSectionContent(
                'Try not to worry if little indented lines crop up on your breasts, belly, or behind – many women get stretch marks during pregnancy, and they tend to fade postpartum. Stretch marks are genetic, so they\'re more likely to show up on your skin if your mother or sister have them. You can apply a good lotion or stretch mark cream to relieve itchiness, and try to gain weight slowly and stick to the recommended amount of pregnancy weight gain to reduce your chances of getting stretch marks. But generally there\'s not much you can do to stop these badges of motherhood from appearing.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Weird dreams'),
            _buildSectionContent(
                'Your pregnancy dreams may get extra strange, thanks to hormones and intense emotions. Vivid dreams, sex dreams, and nightmares are all normal. Reflecting on your dreams can give you information about your emotional state, and they may be interesting to look back on later. Write down your wildest dreams as soon as you wake up, before you forget them.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Constipation'),
            _buildSectionContent(
                'Unfortunately, constipation during pregnancy tends to pop up a lot due to hormonal changes and your expanding uterus. Iron supplements and prenatal vitamins can add to the problem. To prevent and ease constipation, make sure to drink plenty of water, eat high-fiber foods, and exercise regularly. You can also talk to your provider about taking a stool softener or magnesium, and perhaps switching your prenatal vitamin to one with less iron.'),
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
