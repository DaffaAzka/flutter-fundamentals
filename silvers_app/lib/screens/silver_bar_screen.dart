import 'package:flutter/material.dart';

class SilverBarScreen extends StatelessWidget {
  const SilverBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.purple,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network("https://picsum.photos/1600/900", fit: BoxFit.cover),
              expandedTitleScale: 1.5,
              title: Title(color: Colors.white, child: Text('Silver Bar')),
              titlePadding: const EdgeInsets.all(16),
            ),
          ),

          SliverList.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(title: Text("context $index"));
            },
          ),
        ],
      ),
    );
  }
}
