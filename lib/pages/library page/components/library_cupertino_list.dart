import 'package:apple_music/utils/constant.dart';
import 'package:apple_music/utils/lists/library_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibraryCupertinoList extends StatelessWidget {
  const LibraryCupertinoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
      ),
      topMargin: 0,
      children: [
        ...List.generate(
          libraryList.length,
          (index) => CupertinoListTile(
            backgroundColor: Colors.transparent,
            onTap: () {},
            leading: Icon(
              libraryList[index]['icon'],
              size: height * 0.024,
            ),
            title: Text(libraryList[index]['title']),
            trailing: Icon(
              CupertinoIcons.forward,
              size: height * 0.02,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ),
      ],
    );
  }
}
