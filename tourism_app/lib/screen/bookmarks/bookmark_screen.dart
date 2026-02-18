import 'package:flutter/material.dart';
import 'package:navigation_app/model/tourism.dart';
import 'package:navigation_app/widgets/tourism_card.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bookmark Screen")),
      body: bookmarkTourismList.isNotEmpty
          ? ListView.builder(
              itemCount: bookmarkTourismList.length,
              itemBuilder: (context, index) {
                final tourism = bookmarkTourismList[index];
                return TourismCard(tourism: tourism);
              },
            )
          : Center(child: Text("No Bookmarks Available")),
    );
  }
}
