import 'package:flutter/material.dart';
import 'package:lifecycle_app/my_stateless_widget_page.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({
    super.key,
  });

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _nextPage() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MyStatelessWidget(),
        ));
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    debugPrint("Debug: widgetSetStage");
  }

  @override
  void initState() {
    super.initState();
    debugPrint("Debug: widgetInitStage");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("Debug: widgetDidChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("Debug: widgetDispose");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Debug: widgetBuild");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Lifecycle App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton.icon(
              onPressed: _incrementCounter,
              icon: const Icon(Icons.add),
              label: Text("Add this number ($_counter)"),
            ),
            const SizedBox.square(dimension: 20),
            OutlinedButton.icon(
              onPressed: _nextPage,
              icon: const Icon(Icons.next_plan_outlined),
              label: const Text("Replace page to other page"),
            ),
          ],
        ),
      ),
    );
  }
}
