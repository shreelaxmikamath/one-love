import 'package:flutter/material.dart';
import 'appointments_page.dart';
import 'prescriptions_page.dart';
import 'bookings_page.dart'; // Import the bookings page

class InsightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentsPage()),
                );
              },
              child: Text('Book Appointment'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingsPage()),
                );
              },
              child: Text('View Bookings'), // Moved before View Prescriptions
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrescriptionsPage()),
                );
              },
              child: Text('View Prescriptions'),
            ),
          ],
        ),
      ),
    );
  }
}
