import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  set currentPageIndex(int value) {
    _currentPageIndex = value;
    notifyListeners();
  }
}
