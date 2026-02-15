import 'package:carputino/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Feeds Screen")),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 18,
          children: [
            Text(
              "Feeds Screen",
              style: CupertinoTheme.of(
                context,
              ).textTheme.navLargeTitleTextStyle,
            ),

            CupertinoButton.filled(
              child: Text("Select Category"),
              onPressed: () {
                _openDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text("Select Category"),
          actions: [
            CupertinoActionSheetAction(
              child: const Text('Technology'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoute.category.name,
                  arguments: 'Technology',
                );
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Sport'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoute.category.name,
                  arguments: 'Sport',
                );
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Bussiness'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoute.category.name,
                  arguments: 'Bussiness',
                );
              },
            ),
          ],
        );
      },
    );
  }
}
