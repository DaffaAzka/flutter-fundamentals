import 'package:flutter/material.dart';
import 'package:navigation_app/model/tourism.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton(this.index, {super.key});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();

  final int index;
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _isBookmarked = bookmarkTourismList.any((e) => e.id == widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isBookmarked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
      onPressed: () {
        setState(() {
          setState(() {
            _isBookmarked = !_isBookmarked;

            if (_isBookmarked) {
              bookmarkTourismList.add(tourismList.firstWhere((e) => e.id == widget.index));
            } else {
              bookmarkTourismList.removeWhere((e) => e.id == widget.index);
            }
          });
        });
      },
    );
  }
}
