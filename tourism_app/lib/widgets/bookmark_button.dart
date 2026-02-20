import 'package:flutter/material.dart';
import 'package:navigation_app/model/tourism.dart';
import 'package:navigation_app/provider/bookmark_list_provider.dart';
import 'package:navigation_app/provider/is_bookmark_provider.dart';
import 'package:provider/provider.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton(this.index, {super.key});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();

  final int index;
}

class _BookmarkButtonState extends State<BookmarkButton> {
  @override
  void initState() {
    final bookmarkListProvider = context.read<BookmarkListProvider>();
    final isBookmarkProvider = context.read<IsBookmarkProvider>();
    super.initState();

    Future.microtask(() {
      isBookmarkProvider.isBookmarked = bookmarkListProvider.isBookmarked(widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: context.watch<IsBookmarkProvider>().isBookmarked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
      onPressed: () {
        final bookmarkListProvider = context.read<BookmarkListProvider>();
        final isBookmarkProvider = context.read<IsBookmarkProvider>();
        final isBookmarked = isBookmarkProvider.isBookmarked;

        if (!isBookmarked) {
          bookmarkListProvider.addBookmark(widget.index);
        } else {
          bookmarkListProvider.removeBookmark(widget.index);
        }

        isBookmarkProvider.isBookmarked = !isBookmarked;
      },
    );
  }
}
