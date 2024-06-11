import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  int _tabIndex = 0;
  bool _isPinned = false;

  // Get current tab index
  get tabIndex => _tabIndex;

  // Get isPinned
  get isPinned => _isPinned;

  // Set current tab index
  set setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  // Set isPinned
  set isPinnedValue(bool value) {
    _isPinned = value;
    notifyListeners();
  }
}
