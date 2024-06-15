
import 'package:apple_music/providers/song_provider.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/lists/song_list.dart';
import 'components/album_detail_navigation_bar.dart';
import 'components/album_song_list.dart';
import 'components/animated_album_image.dart';
import 'components/play_shuffle_button_row.dart';

class AlbumDetailPage extends StatelessWidget {
  final SongProvider providerTrue, providerFalse;
  final int albumIndex;

  const AlbumDetailPage({
    super.key,
    required this.providerTrue,
    required this.providerFalse,
    required this.albumIndex,
  });

  @override
  Widget build(BuildContext context) {
    String albumName = songList.keys.toList()[albumIndex];
    return CupertinoPageScaffold(
      navigationBar: albumDetailNavigationBar(context),
      child: CustomScrollView(
        slivers: [
          // Adding space to prevent content get hidden behind navigation bar
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).padding.top + kToolbarHeight,
            ),
          ),

          SliverPadding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated album image container
                    AnimatedAlbumImage(albumIndex: albumIndex),

                    // Album name
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        songList.keys.toList()[albumIndex],
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.022,
                            color: CupertinoTheme.of(context).primaryColor),
                      ),
                    ),

                    // Album image
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Album',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: height * 0.020),
                      ),
                    ),

                    // Buttons Rows
                    PlayShuffleButtonRow(providerFalse: providerFalse, songList: songList[albumName]),

                    // Album Song list
                    AlbumSongList(albumName: albumName, providerFalse: providerFalse),

                    const SizedBox(
                      height: 56,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




