import 'package:apple_music/pages/library%20page/library_page.dart';
import 'package:flutter/cupertino.dart';

const List<Widget> tabScreenList = [
  Icon(CupertinoIcons.house_fill),
  Icon(CupertinoIcons.waveform),
  LibraryPage(),
  Icon(CupertinoIcons.search),
];
