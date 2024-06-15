import 'package:apple_music/pages/library%20page/library_page.dart';
import 'package:apple_music/pages/search%20page/search_page.dart';
import 'package:flutter/cupertino.dart';

import '../../pages/home page/home_page.dart';
import '../../pages/radio page/radio_page.dart';

const List<Widget> tabScreenList = [
  HomePage(),
  RadioPage(),
  LibraryPage(),
  SearchPage(),
];
