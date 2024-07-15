import 'package:flutter/material.dart';

class Week3Page extends StatelessWidget {
  const Week3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 3'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Highlights this week',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Pregnancy hormones',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'The levels of hCG, known as the pregnancy hormone, are rapidly increasing now. '
                  'This is the hormone that a home pregnancy test detects. It signals to your body to produce more '
                  'oestrogen and progesterone, which are the hormones that will stop you from having a period for the next nine months.',
            ),
            SizedBox(height: 16),
            Text(
              'Foods to avoid',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'You may or may not be pregnant yet, but you can already eat as if you were, just to be on the side of caution. '
                  'Avoid alcohol, soft cheeses, unpasteurised dairy products and raw or undercooked eggs.',
            ),
            SizedBox(height: 16),
            Text(
              'Fatigue',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you\'re feeling more tired than usual, it might be an early pregnancy symptom. Even though it\'s so early, '
                  'your body is going through many changes already and they can leave you feeling exhausted. Try to rest when you feel the need.',
            ),
            SizedBox(height: 16),
            Text(
              'How many months is 3 weeks pregnant?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'You\'re in the third week of your first month of pregnancy.',
            ),
            SizedBox(height: 16),
            Text(
              'Baby development at 3 weeks',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Your fertilised egg is now a tiny ball of constantly multiplying cells called a blastocyst. Some cells will become your baby, '
                  'while others will become the placenta or the amniotic sac.',
            ),
            SizedBox(height: 16),
            Text(
              'Amniotic fluid is beginning to form in the cavity that will become the amniotic sac. This fluid will cushion your baby in the weeks and months ahead.',
            ),
            SizedBox(height: 16),
            Text(
              'Pregnancy symptoms at 3 weeks',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'You may feel pregnant, but it\'s unlikely you\'ll get a clear result from a pregnancy test at this stage. A sensitive test may show a faint line. '
                  'But this can just leave you feeling confused, rather than satisfied or excited.\n\n'
                  'The clearest sign that you\'re pregnant is a missed period. Yours probably isn\'t due until the end of this week or even next week, depending on the length of your menstrual cycle.\n\n'
                  'In the meantime, your sense of smell may change, so it\'s possible that smells you usually like, or are indifferent to, suddenly don\'t appeal to you anymore. Due to changing levels of oestrogen, '
                  'you may also experience a metallic taste in your mouth.\n\n'
                  'Pregnancy hormones may also be having an effect on you, making you feel tired and weepy. During the day, you may feel exhausted and struggle to stay awake. This is because your body is preparing itself to support your baby.',
            ),
            SizedBox(height: 16),
            Text(
              'What you can do at three weeks pregnant',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you don\'t already have an obstetrician that you like, look for one that you can go to when you get your positive test result. She will likely follow you throughout your pregnancy and be there for your delivery too. '
                  'So don\'t hesitate to meet more than one and settle on the doctor you feel most comfortable with. To help you make your choice, you can see our article on how to choose your doctor.\n\n'
                  'You can also ask for doctor recommendations in our pregnancy group in the community.',
            ),
            SizedBox(height: 16),
            Text(
              'Your pregnancy diet at 3 weeks',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'You may get food cravings or notice that you no longer want any of your favourite foods and drinks. Aversions to tea, coffee, alcohol, fried food and eggs are common among new mums-to-be. This can work to your advantage, '
                  'as you should not be drinking any alcohol at all during your pregnancy. You\'ll also need to limit your caffeine intake to no more than 200mg a day. This means you can still enjoy your daily tea or coffee, but keep a tab on how much you\'re having. '
                  'Caffeine is also found in green tea, chocolate and many cold drinks.\n\n'
                  'Have plenty of fruit, vegetables and sources of protein in your diet. That will set you off to a healthy start of your pregnancy. To know more, see our guide to a diet for a healthy mum-to-be.',
            ),
          ],
        ),
      ),
    );
  }
}
