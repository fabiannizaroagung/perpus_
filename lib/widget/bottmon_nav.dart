import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  BottomNav(this.page);
  int page;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  getPage(index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/Na');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/lib');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color.fromARGB(255, 18, 144, 179),
      unselectedItemColor: Colors.grey,
      currentIndex: widget.page,
      onTap: getPage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          backgroundColor: const Color.fromARGB(255, 76, 24, 85),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          backgroundColor: Color.fromARGB(255, 24, 40, 85),
          label: "Na",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          backgroundColor: Color.fromARGB(255, 85, 24, 71),
          label: "Library",
        ),
      ],
    );
  }
}
