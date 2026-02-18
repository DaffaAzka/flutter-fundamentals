import 'package:flutter/material.dart';
import 'package:navigation_app/model/tourism.dart';
import 'package:navigation_app/widgets/tourism_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tourism List")),
      body: ListView.builder(
        itemCount: tourismList.length,
        itemBuilder: (context, index) {
          final tourism = tourismList[index];
          return TourismCard(tourism: tourism);
        },
      ),
    );
  }
}
