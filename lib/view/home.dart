import 'package:flutter/material.dart';
import 'package:perpus/widget/bottmon_nav.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 118, 160),
        title: Text(
          'Home Perpustakaan 📑',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/lib');
        },
        child: Text(
          'Library',
          style:
              TextStyle(color: Color.fromARGB(255, 22, 118, 160), fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNav(0),
    );
  }
}
