import 'package:flutter/material.dart';

class ConstraintWidget extends StatelessWidget {
  const ConstraintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 70,
        minHeight: 70,
        maxWidth: 140,
        maxHeight: 140,
      ),
      child: Container(color: Colors.red),
    );
  }
}
