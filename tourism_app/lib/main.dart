import 'package:flutter/material.dart';
import 'package:navigation_app/model/tourism.dart';
import 'package:navigation_app/provider/bookmark_list_provider.dart';
import 'package:navigation_app/screen/home/detail/detail_screen.dart';
import 'package:navigation_app/screen/home/home_screen.dart';
import 'package:navigation_app/screen/main_screen.dart';
import 'package:navigation_app/style/theme/tourism_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => BookmarkListProvider(), child: const MyApp()));
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
        '/detail': (context) => DetailScreen(index: ModalRoute.of(context)?.settings.arguments as int),
      },
    );
  }
}
