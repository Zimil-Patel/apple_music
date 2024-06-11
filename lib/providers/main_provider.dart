import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier{
  int _tabIndex = 0;

  // Get current tab index
  get tabIndex => _tabIndex;

  // Set current tab index
  set setTabIndex(int index){
    _tabIndex = index;
    notifyListeners();
  }

}