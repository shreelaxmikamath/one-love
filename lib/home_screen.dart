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
import 'baby_names_page.dart';



class HomeScreen extends StatefulWidget {
  final String userId;

  HomeScreen({required this.userId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _username = '';
  late String _email = '';
  late String _contactNumber = '';
  int _selectedIndex = 0;
  DateTime _now = DateTime.now();
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
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
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
              padding: EdgeInsets.all(8),
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
      int weekNumber = index + 3; // Weeks from 3 to 41
      return GestureDetector(
        onTap: () {
          if (weekNumber == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Week3Page(),
              ),
            );
          }
          // Add more conditions for other week pages here as needed
          if (weekNumber == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Week4Page(),
              ),
            );
          }
          if (weekNumber == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Week5Page(),
              ),
            );
          }
          if (weekNumber == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Week6Page(),
              ),
            );
          }
          if (weekNumber == 7) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Week7Page(),
              ),
            );
          }
          if (weekNumber == 7) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Week7Page(),
              ),
            );
          }if (weekNumber == 8) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Week8Page(),
              ),
            );
          }if (weekNumber == 9) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Week9Page(),
              ),
            );
          }if (weekNumber == 10) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Week10Page(),
              ),
            );
          }
        },
        child: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$weekNumber',
              style: TextStyle(
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

  Widget _buildPopularTools() {
    List<String> tools = ["Tool 1", "Baby Names", "Tool 3"]; // Replace with actual tool names
    return Column(
      children: [
        Text(
          'Popular Tools',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: tools.map((tool) {
            return GestureDetector(
              onTap: () {
                if (tool == "Baby Names") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BabyNamesPage()),
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
                    style: TextStyle(
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
    return Container(
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
        title: Text('One Love'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage(userId: widget.userId)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage(userId: widget.userId)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
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
              SizedBox(height: 20),
              _buildWeeklyCalendar(),
              SizedBox(height: 20),
              _buildPopularTools(),
              SizedBox(height: 20),
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
