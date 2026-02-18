import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        Text(_isOn ? "Aktif" : "Tidak Aktif"),
        Switch(
          value: _isOn,
          onChanged: (value) {
            setState(() {
              _isOn = !_isOn;
            });
          },
        ),
      ],
    );
  }
}
