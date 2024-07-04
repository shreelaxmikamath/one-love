import 'package:flutter/material.dart';

class BookingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with actual logic to fetch and display bookings
    List<String> bookings = ['Booking 1', 'Booking 2', 'Booking 3'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
      ),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(bookings[index]),
          );
        },
      ),
    );
  }
}
