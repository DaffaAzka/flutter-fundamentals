import 'package:flutter/material.dart';
import 'package:navigation_app/screen/bookmarks/bookmark_screen.dart';
import 'package:navigation_app/screen/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _indexNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (_indexNavigationBar) {
        0 => HomeScreen(),
        _ => BookmarkScreen(),
      },
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexNavigationBar,
        onTap: (value) {
          setState(() {
            _indexNavigationBar = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Bookmarks"),
        ],
      ),
    );
  }
}
