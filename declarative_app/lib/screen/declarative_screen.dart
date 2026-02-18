import 'package:declarative_app/components/my_switch.dart';
import 'package:flutter/material.dart';

class DeclarativeScreen extends StatelessWidget {
  const DeclarativeScreen({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: MySwitch()));
  }
}
