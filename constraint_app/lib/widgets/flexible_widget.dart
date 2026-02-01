import 'package:flutter/material.dart';

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.amber, border: Border.all()),
        child: Text("Flexible"),
      ),
    );
  }
}
