import 'package:flutter/material.dart';
import 'package:json_parsing/future_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final _futureData = FutureData().getData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: _futureData,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            final state = snapshot.connectionState;
            switch (state) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  return Text("Data: ${snapshot.data}");
                } else {
                  return Text("Do Nothing");
                }
            }
          },
        ),
      ),
    );
  }
}
