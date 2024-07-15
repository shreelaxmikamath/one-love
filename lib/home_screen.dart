import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'calendar_page.dart';
import 'notifications_page.dart';
import 'account_page.dart';
import 'insights_page.dart';
import 'others_page.dart';
import 'pregnancy_weeks/week3.dart'; // Import for Week 3 Page
import 'pregnancy_weeks/week4.dart';
import 'pregnancy_weeks/week5.dart';
import 'pregnancy_weeks/week6.dart';
import 'pregnancy_weeks/week7.dart';
import 'pregnancy_weeks/week8.dart';
import 'pregnancy_weeks/week9.dart';
import 'pregnancy_weeks/week10.dart';
import 'pregnancy_weeks/week11.dart';
import 'pregnancy_weeks/week12.dart';
import 'pregnancy_weeks/week13.dart';
import 'pregnancy_weeks/week14.dart';
import 'pregnancy_weeks/week15.dart';
import 'pregnancy_weeks/week16.dart';
import 'pregnancy_weeks/week17.dart';
import 'pregnancy_weeks/week18.dart';
import 'pregnancy_weeks/week19.dart';
import 'pregnancy_weeks/week20.dart';
import 'pregnancy_weeks/week21.dart';
import 'pregnancy_weeks/week22.dart';
import 'pregnancy_weeks/week23.dart';
import 'pregnancy_weeks/week24.dart';
import 'pregnancy_weeks/week25.dart';
import 'pregnancy_weeks/week26.dart';
import 'pregnancy_weeks/week27.dart';
import 'pregnancy_weeks/week28.dart';
import 'pregnancy_weeks/week29.dart';
import 'pregnancy_weeks/week30.dart';
import 'pregnancy_weeks/week31.dart';
import 'pregnancy_weeks/week32.dart';
import 'pregnancy_weeks/week33.dart';
import 'pregnancy_weeks/week34.dart';
import 'pregnancy_weeks/week35.dart';
import 'pregnancy_weeks/week36.dart';
import 'pregnancy_weeks/week37.dart';
import 'pregnancy_weeks/week38.dart';
import 'pregnancy_weeks/week39.dart';
import 'pregnancy_weeks/week40.dart';
import 'baby_names_page.dart';



class HomeScreen extends StatefulWidget {
  final String userId;

  const HomeScreen({super.key, required this.userId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _username = '';
  late String _email = '';
  late String _contactNumber = '';
  int _selectedIndex = 0;
  final DateTime _now = DateTime.now();
  int _currentImageIndex = 0;
  late Timer _timer;

  final List<String> _imageAssets = [
    'assets/image1.jpg', // Replace with your actual asset paths
    'assets/image2.jpg',
    'assets/image3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
    _startImageSlideshow();
  }

  void _startImageSlideshow() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _imageAssets.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _loadUserInfo() async {
    var response = await http.get(
      Uri.parse('http://10.0.2.2:5000/user_info?user_id=${widget.userId}'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        _username = data['username'];
        _email = data['email'];
        _contactNumber = data['contact_number'];
      });
    } else {
      print("Failed to load user information!");
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(userId: widget.userId)),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InsightsPage(userId: widget.userId)),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OthersPage(userId: int.parse(widget.userId))),
        );
        break;
    }
  }

  Widget _buildWeeklyCalendar() {
    List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    DateTime firstDayOfWeek = _now.subtract(Duration(days: _now.weekday - 1));

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: days.map((day) => Text(day)).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(7, (index) {
            DateTime date = firstDayOfWeek.add(Duration(days: index));
            bool isToday = date.day == _now.day && date.month == _now.month && date.year == _now.year;

            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isToday ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${date.day}',
                style: TextStyle(
                  color: isToday ? Colors.white : Colors.black,
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPregnancyWeekBoxes() {
    List<Widget> weekBoxes = List.generate(38, (index) {
      int weekNumber = index + 3; // Weeks from 3 to 40
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _getWeekPage(weekNumber),
            ),
          );
        },
        child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$weekNumber',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    });

    return Wrap(
      alignment: WrapAlignment.center,
      children: weekBoxes,
    );
  }

  Widget _getWeekPage(int weekNumber) {
    switch (weekNumber) {
      case 3:
        return const Week3Page();
      case 4:
        return const Week4Page();
      case 5:
        return const Week5Page();
      case 6:
        return const Week6Page();
      case 7:
        return const Week7Page();
      case 8:
        return const Week8Page();
      case 9:
        return const Week9Page();
      case 10:
        return const Week10Page();
      case 11:
        return const Week11Page();
      case 12:
        return const Week12Page();
      case 13:
        return const Week13Page();
      case 14:
        return const Week14Page();
      case 15:
        return const Week15Page();
      case 16:
        return const Week16Page();
      case 17:
        return const Week17Page();
      case 18:
        return const Week18Page();
      case 19:
        return const Week19Page();
      case 20:
        return const Week20Page();
      case 21:
        return const Week21Page();
      case 22:
        return const Week22Page();
      case 23:
        return const Week23Page();
      case 24:
        return const Week24Page();
      case 25:
        return const Week25Page();
      case 26:
        return const Week26Page();
      case 27:
        return const Week27Page();
      case 28:
        return const Week28Page();
      case 29:
        return const Week29Page();
      case 30:
        return const Week30Page();
      case 31:
        return const Week31Page();
      case 32:
        return const Week32Page();
      case 33:
        return const Week33Page();
      case 34:
        return const Week34Page();
      case 35:
        return const Week35Page();
      case 36:
        return const Week36Page();
      case 37:
        return const Week37Page();
      case 38:
        return const Week38Page();
      case 39:
        return const Week39Page();
      case 40:
        return const Week40Page();
      default:
        return const SizedBox(); // Handle cases where no page is found
    }
  }

  Widget _buildPopularTools() {
    List<String> tools = ["Tool 1", "Baby Names", "Tool 3"]; // Replace with actual tool names
    return Column(
      children: [
        const Text(
          'Popular Tools',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: tools.map((tool) {
            return GestureDetector(
              onTap: () {
                if (tool == "Baby Names") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BabyNamesPage()),
                  );
                }
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    tool,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildImageSlideshow() {
    return SizedBox(
      height: 200, // Set the height for the image container
      child: Image.asset(
        _imageAssets[_currentImageIndex],
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('One Love'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage(userId: widget.userId)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage(userId: widget.userId)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage(userId: widget.userId)),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildImageSlideshow(),
              const SizedBox(height: 20),
              _buildWeeklyCalendar(),
              const SizedBox(height: 20),
              _buildPopularTools(),
              const SizedBox(height: 20),
              _buildPregnancyWeekBoxes(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Others',
          ),
        ],
      ),
    );
  }
}
