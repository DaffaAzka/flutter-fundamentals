import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String selectedCatgory;
  const CategoryScreen({super.key, required this.selectedCatgory});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('$selectedCatgory Selected'),
      ),
      child: Center(
        child: Text(
          '$selectedCatgory Selected',
          style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
        ),
      ),
    );
  }
}
