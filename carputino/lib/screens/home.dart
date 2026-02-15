import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Cupertino Middle Bar",
          style: TextStyle(color: CupertinoColors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.back),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.ellipsis),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 18,
          children: [
            Text("Hello World", style: TextStyle(color: CupertinoColors.black)),
            CupertinoButton(
              child: Text("Button With No Background"),
              onPressed: () {},
            ),
            CupertinoButton.filled(
              child: Text("Button with Background"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
