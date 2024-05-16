import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:farmer22for/screens/chatscreen/chatscreen.dart';
import 'package:farmer22for/screens/explore_screen/explorescreen.dart';
import 'package:farmer22for/screens/homescreen/homescreen.dart';
import 'package:farmer22for/screens/profile_screen/profilescreen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int index = 0;

  final List<Widget> _screens = <Widget>[
    HomeScreen(),
    CustomMarkerScreen(),
    Farmerdetails(),
    ProfileScreen(location: 'T', name: 'Piyush sahu', age: 18, phoneNumber: '8960995237'),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.near_me, size: 30),
      Icon(Icons.chat_bubble, size: 30),
      Icon(Icons.person, size: 30),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _screens[index],
        bottomNavigationBar: CurvedNavigationBar(
          color:    Color.fromRGBO(0, 120, 0, 1),
          height: 55,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          index: index,
          items: items,
          backgroundColor: Colors.transparent,
          onTap: (index) => setState(() {
            this.index = index;
          }),
        ),
      ),
    );
  }
}
