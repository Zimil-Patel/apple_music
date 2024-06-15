import 'package:apple_music/pages/song%20page/song_page.dart';
import 'package:apple_music/providers/song_provider.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:apple_music/utils/lists/library_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'library_grid_view.dart';

class LibraryCupertinoList extends StatelessWidget {
  const LibraryCupertinoList({
    super.key,
    required this.songProviderTrue,
    required this.songProviderFalse,
  });

  final SongProvider songProviderTrue, songProviderFalse;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CupertinoListSection(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          ),
          topMargin: 0,
          dividerMargin: 0,
          children: [
            ...List.generate(
              libraryList.length,
              (index) => CupertinoListTile(
                backgroundColor: Colors.transparent,
                onTap: () {
                  if (libraryList[index]['title'] == 'Songs'){
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => const SongPage(),));
                  }
                },
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
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            'Recently Added',
            style: TextStyle(
                fontSize: height * 0.025, fontWeight: FontWeight.bold),
          ),
        ),

        // Album list in GridView
        LibraryGridView(songProviderFalse: songProviderFalse, songProviderTrue: songProviderTrue)
      ],
    );
  }
}

