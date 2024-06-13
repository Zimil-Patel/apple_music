import 'package:apple_music/providers/song_provider.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:apple_music/utils/lists/library_list.dart';
import 'package:apple_music/utils/lists/song_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text('Recently Added', style: TextStyle(fontSize: height * 0.025 , fontWeight: FontWeight.bold),),
        ),


        // Album list in GridView
        GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          itemCount: songList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) => CupertinoButton(
            onPressed: (){
              songProviderFalse.setPlayList(songList[songList.keys.toList()[index]]);
              // songProviderFalse.playNext();
            },
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Album image box
                AspectRatio(
                  aspectRatio: 1,
                  child: SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/album images/${songList.keys.toList()[index]}.png', fit: BoxFit.cover,),
                    ),
                  ),
                ),

                // Album details (name)
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, left: 4, right: 10),
                  child: Text(songList.keys.toList()[index], overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: height * 0.014, fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 4, right: 10),
                  child: Text('Album songs', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: height * 0.012, fontWeight: FontWeight.w500, color: CupertinoColors.systemGrey,),),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
