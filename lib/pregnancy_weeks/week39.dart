import 'package:flutter/material.dart';

class Week39Page extends StatelessWidget {
  const Week39Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 39 Highlights'),
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
            _buildSectionTitle('Congratulations!'),
            _buildSectionContent(
                'Your baby is full term and fully developed, ready to meet the world.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Staying Active'),
            _buildSectionContent(
                'Gentle exercise like walking, swimming, or stretching is beneficial.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Time to Induce?'),
            _buildSectionContent(
                'Discuss with your provider about possibly inducing labor at 39 weeks if it\'s recommended.'),
            const SizedBox(height: 16),
            const Text(
              'Baby Development at 39 Weeks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Still Plumping Up'),
            _buildSectionContent(
                'Your baby continues to develop fat for temperature regulation after birth.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Ready to Interact with You'),
            _buildSectionContent(
                'Your baby has developed a firm grasp and coordinated reflexes.'),
            const SizedBox(height: 16),
            const Text(
              'Your Baby is About the Size of a Mini-Watermelon',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Length'),
            _buildSectionContent('19.72 inches (head to toe)'),
            _buildSectionTitle('Weight'),
            _buildSectionContent('7.57 pounds'),
            const SizedBox(height: 16),
            const Text(
              'Pregnancy Symptoms during Week 39',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Baby Kicks'),
            _buildSectionContent(
                'Monitor your baby\'s movements closely and report any significant decrease to your provider.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Changes to Your Cervix'),
            _buildSectionContent(
                'Your cervix may start ripening, but it\'s still unpredictable when labor will start.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Leaking Fluid'),
            _buildSectionContent(
                'Contact your provider if you suspect your water has broken, as this increases infection risk.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Breast Changes'),
            _buildSectionContent(
                'You may notice small drops of yellow colostrum leaking from your breasts.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Diarrhea'),
            _buildSectionContent(
                'Some women experience diarrhea, potentially due to hormonal changes, but it\'s not a definitive sign of labor.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Pelvic Pain'),
            _buildSectionContent(
                'Pelvic pain is common at this stage; manage discomfort with rest and gentle activities.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Mood Swings'),
            _buildSectionContent(
                'Emotional ups and downs are normal; practice self-care and seek help if needed.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Different Vaginal Discharge'),
            _buildSectionContent(
                'Changes in discharge are expected as labor approaches; contact your provider if you\'re unsure.'),
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
