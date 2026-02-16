import 'package:flutter/material.dart';
import 'package:silvers_app/screens/silver_bar_screen.dart';
import 'package:silvers_app/screens/silver_grid_screen.dart';
import 'package:silvers_app/screens/silver_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: SilverBarScreen(),
    );
  }
}
