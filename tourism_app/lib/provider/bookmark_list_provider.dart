import 'package:flutter/material.dart';
import 'package:navigation_app/model/tourism.dart';

class BookmarkListProvider extends ChangeNotifier {
  final List<Tourism> _bookmarkTourismList = [];

  List<Tourism> get getBookmarkTourismList => _bookmarkTourismList;

  void addBookmark(int id) {
    _bookmarkTourismList.add(tourismList.firstWhere((e) => e.id == id));
    notifyListeners();
  }

  void removeBookmark(int id) {
    _bookmarkTourismList.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  bool isBookmarked(int id) {
    return _bookmarkTourismList.any((e) => e.id == id);
  }
}
