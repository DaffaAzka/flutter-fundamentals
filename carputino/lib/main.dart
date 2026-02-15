import 'package:carputino/app_route.dart';
import 'package:carputino/screens/category_screen.dart';
import 'package:carputino/screens/home_screen.dart';
import 'package:carputino/screens/setting_screen.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Cupertino App',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemPurple,
        brightness: Brightness.light,
      ),
      initialRoute: AppRoute.home.name,
      routes: {
        AppRoute.home.name: (context) => HomeScreen(),
        AppRoute.category.name: (context) => CategoryScreen(
          selectedCatgory: ModalRoute.of(context)?.settings.arguments as String,
        ),
      },
    );
  }
}
