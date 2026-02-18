import 'package:flutter/material.dart';
import 'package:navigation_app/model/tourism.dart';
import 'package:navigation_app/screen/home/detail/detail_screen.dart';
import 'package:navigation_app/screen/home/home_screen.dart';
import 'package:navigation_app/screen/main_screen.dart';
import 'package:navigation_app/style/theme/tourism_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: TourismTheme.lightTheme,
      darkTheme: TourismTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/card': (context) => HomeScreen(),
        '/detail': (context) => DetailScreen(
          data: ModalRoute.of(context)?.settings.arguments as Tourism,
        ),
      },
    );
  }
}
