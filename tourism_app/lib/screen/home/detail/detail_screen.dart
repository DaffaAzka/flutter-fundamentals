import 'package:flutter/material.dart';
import 'package:navigation_app/model/tourism.dart';
import 'package:navigation_app/widgets/bookmark_button.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.data});

  final Tourism data;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism Detail"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [BookmarkButton(widget.data.id)],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Image.network(widget.data.image, fit: BoxFit.cover),
            const SizedBox.square(dimension: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.data.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(widget.data.address, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.favorite),
                    const SizedBox.square(dimension: 4),
                    Text(widget.data.like.toString()),
                  ],
                ),
              ],
            ),
            const SizedBox.square(dimension: 16),
            Text(widget.data.description),
          ],
        ),
      ),
    );
  }
}
