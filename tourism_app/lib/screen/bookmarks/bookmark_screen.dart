import 'package:flutter/material.dart';
import 'package:navigation_app/provider/bookmark_list_provider.dart';
import 'package:navigation_app/widgets/tourism_card.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkListProvider = context.watch<BookmarkListProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Bookmark Screen")),
      body: bookmarkListProvider.getBookmarkTourismList.isNotEmpty
          ? ListView.builder(
              itemCount: bookmarkListProvider.getBookmarkTourismList.length,
              itemBuilder: (context, index) {
                final tourism = bookmarkListProvider.getBookmarkTourismList[index];
                return TourismCard(tourism: tourism);
              },
            )
          : Center(child: Text("No Bookmarks Available")),
    );
  }
}
