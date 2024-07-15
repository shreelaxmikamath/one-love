import 'package:flutter/material.dart';
import 'appointments_page.dart';
import 'prescriptions_page.dart';
import 'appointments_list_page.dart';

class InsightsPage extends StatelessWidget {
  final String userId;
  const InsightsPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildCard('Book Appointment', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppointmentsPage(userId: userId)),
                    );
                  }),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildCard(' My Appointments', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppointmentsListPage(userId: userId)),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildCard('View Prescriptions', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrescriptionsPage(userId: userId)),
                    );
                  }),
                ),
                const Expanded(child: SizedBox()), // This creates an empty space to balance the row
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, VoidCallback onTap) {
    return Card(
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}