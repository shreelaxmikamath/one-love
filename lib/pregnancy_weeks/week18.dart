import 'package:flutter/material.dart';

class Week18Page extends StatelessWidget {
  const Week18Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 18 Highlights'),
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
            _buildSectionTitle('Mid-pregnancy ultrasound'),
            _buildSectionContent(
                'Get ready to see your baby! You\'ll have an ultrasound between 18 and 22 weeks to check on your baby\'s health and development. It usually lasts 20 to 45 minutes.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby kicks'),
            _buildSectionContent(
                'Are you feeling your baby move? If not, it may happen soon. The first movements often feel like little flutters, gas bubbles, or even like popcorn popping. They\'ll grow stronger and more frequent over time.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Great pregnancy snacks'),
            _buildSectionContent(
                'In your second trimester, experts recommend getting about 340 extra calories a day. Eating healthy snacks between meals will help you meet this goal and keep your blood sugar level so you don\'t get too hungry.'),
            const SizedBox(height: 32),
            const Text(
              'Baby development at 18 weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby\'s face'),
            _buildSectionContent(
                'Your baby\'s ears, nose, and lips are all recognizable on an ultrasound. Eyelids, eyebrows, eyelashes, nails, and hair are formed, too!'),
            const SizedBox(height: 16),
            _buildSectionTitle('Lungs branching out'),
            _buildSectionContent(
                'In your baby\'s lungs, the smallest tubes (bronchioles) start to develop. At the end of these tiny tubes, respiratory sacs begin to appear. By the time your baby is born, these sacs will become enmeshed with tiny blood vessels that allow oxygen and carbon dioxide to flow in and out.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Girl and boy parts'),
            _buildSectionContent(
                'If you\'re having a girl, her uterus and fallopian tubes are formed and in place. If you\'re having a boy, his genitals are visible now.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Your baby is about the size of a bell pepper'),
            _buildSectionContent(
                'LENGTH: 8.74 inches (head to toe)\nWEIGHT: 7.87 ounces'),
            const SizedBox(height: 32),
            const Text(
              'Pregnancy symptoms during week 18',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Increased appetite'),
            _buildSectionContent(
                'Hungry? An increased appetite – and specific food cravings – are common at 18 weeks pregnant.  Pregnancy hunger is for good reason: Your body is working hard to support your baby, and that requires plenty of energy. Your meals are also fueling your body\'s pregnancy changes – which include a much higher blood volume, your growing breasts and uterus, and increased fat stores. To satisfy your hunger and maximize nutrition, eat a small meal or snack every three hours, and include foods that provide a mix of protein, fiber, and healthy (unsaturated) fat.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Dizziness'),
            _buildSectionContent(
                'Your body is undergoing dramatic changes, and sometimes your cardiovascular and nervous systems don\'t adapt quickly enough. This can leave you feeling lightheaded or dizzy, or even make you faint. This can happen if you spring up too fast from a lying or sitting position. You\'re also more likely to feel dizzy if you have anemia, don\'t eat or drink enough, overdo it when you exercise, or get overheated. If you persistently feel lightheaded, or have frequent bouts of dizziness, let your healthcare provider know.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Swelling'),
            _buildSectionContent(
                'It\'s normal to have swelling in your feet and ankles during pregnancy, as well as mild swelling in your hands and fingers. (If your rings are getting tight, take them off now!) Sometimes, sudden and severe swelling can signal a more serious issue. Call your provider if your swelling is sudden or excessive, you have more than moderate swelling of your hands or face, or you have other signs or symptoms of preeclampsia. Also, call if you have any signs of a blood clot known as deep vein thrombosis (DVT).'),
            const SizedBox(height: 16),
            _buildSectionTitle('Vaginal discharge'),
            _buildSectionContent(
                'Throughout pregnancy, you may notice a lot more vaginal discharge than usual. That\'s because your body is producing more estrogen, which signals the vagina to produce more discharge. Healthy discharge is usually clear to milky white, thin to thick and mucus-like, and mild-smelling or odorless. Learn about the different types of discharge during pregnancy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Leg cramps'),
            _buildSectionContent(
                'Leg cramps during pregnancy are a bit of a mystery, though they\'re thought to be connected to swelling and the extra weight you\'re carrying, which requires your leg muscles to work harder. Whenever you have a leg cramp, stretch your calf muscles by straightening your leg and flexing your toe back towards your shins. After stretching, massage the muscle and/or apply heat, like a heating pad or a hot-water bottle. To prevent leg cramps, don\'t stand or sit with your legs crossed for too long; take a daily walk; drink enough water; take a warm bath before bed; and stretch your calf muscles, roll your ankles, and wiggle your toes throughout the day. Some women find that taking a magnesium supplement helps, too.'),
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
