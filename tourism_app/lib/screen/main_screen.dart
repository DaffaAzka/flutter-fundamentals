import 'package:flutter/material.dart';
import 'package:navigation_app/provider/navigation_provider.dart';
import 'package:navigation_app/screen/bookmarks/bookmark_screen.dart';
import 'package:navigation_app/screen/home/home_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: Consumer<NavigationProvider>(
        builder: (BuildContext context, NavigationProvider value, Widget? child) {
          return Scaffold(
            body: switch (value.getIndexNavigationBar) {
              0 => HomeScreen(),
              _ => BookmarkScreen(),
            },
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: value.getIndexNavigationBar,
              onTap: (index) => Provider.of<NavigationProvider>(context, listen: false).setIndexNavigationBar(index),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Bookmarks"),
              ],
            ),
          );
        },
      ),
    );
  }
}
