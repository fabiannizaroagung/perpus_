import 'package:flutter/material.dart';
import 'package:perpus/view/home.dart';
import 'package:perpus/view/perpus_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/lib': (context) => PerpusView(),
      },
    );
  }
}
