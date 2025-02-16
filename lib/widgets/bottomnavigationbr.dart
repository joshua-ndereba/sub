import 'package:flutter/material.dart';
//import 'package:hike/screens/interior/home.dart';
//import 'package:hike/screens/interior/profile.dart';
//import 'package:hike/screens/interior/route_tracking.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex; // To track the currently selected index
  final List<Widget> screens; // List of screens to navigate to

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.screens,
  });


  @override
  Widget build(BuildContext context) {
    

    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white, // Adjust selected item color
      unselectedItemColor: Colors.grey, // Adjust unselected item color
      currentIndex: currentIndex,
      onTap: (int index) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screens[index]),
      ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
       /* BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'map',
        ),*/
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'add subscribers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}