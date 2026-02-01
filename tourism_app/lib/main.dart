import 'package:flutter/material.dart';
import 'package:navigation_app/model/tourism.dart';
import 'package:navigation_app/screen/home/detail/detail_screen.dart';
import 'package:navigation_app/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/card': (context) => HomeScreen(),
        '/detail': (context) => DetailScreen(
          data: ModalRoute.of(context)?.settings.arguments as Tourism,
        ),
      },
    );
  }
}
