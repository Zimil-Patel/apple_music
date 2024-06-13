import 'dart:developer';

import 'package:apple_music/providers/song_provider.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/lists/song_list.dart';
import 'components/album_detail_navigation_bar.dart';
import 'components/animated_album_image.dart';

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
    log('Album: $albumName');
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

                    // Album
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

                    // Album name
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Play PlayList
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CupertinoButton(
                                onPressed: () async {
                                  await providerFalse
                                      .setPlayList(songList[albumName]);
                                  await providerFalse.playPlaylist();
                                },
                                borderRadius: BorderRadius.circular(10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                color:
                                    CupertinoColors.systemGrey.withOpacity(0.2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon
                                    Icon(
                                      CupertinoIcons.play_arrow_solid,
                                      size: height * 0.024,
                                      color: CupertinoTheme.of(context)
                                          .primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    // Button lable
                                    Text(
                                      'Play',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.019,
                                        color: CupertinoTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Shuffle and Play PlayList
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CupertinoButton(
                                borderRadius: BorderRadius.circular(10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                color:
                                    CupertinoColors.systemGrey.withOpacity(0.2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon
                                    Icon(
                                      CupertinoIcons.shuffle,
                                      size: height * 0.024,
                                      color: CupertinoTheme.of(context)
                                          .primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    // Button lable
                                    Text(
                                      'Shuffle',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.019,
                                        color: CupertinoTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Album Song list
                    CupertinoListSection(
                      footer: Text('${songList[albumName].length} song'),
                      topMargin: 10,
                      backgroundColor: Colors.transparent,
                      decoration: const BoxDecoration(),
                      dividerMargin: 0,
                      additionalDividerMargin: 1,
                      children: [
                        ...List.generate(songList[albumName].length, (index) {

                          Audio audio = songList[albumName][index];

                          return CupertinoListTile(
                            onTap: () async {
                              await providerFalse
                                  .setPlayList(songList[albumName]);
                              await providerFalse.playAtIndex(index);
                            },
                            title: Row(
                              children: [
                                // Song Index
                                Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    color: CupertinoColors.systemGrey
                                        .withOpacity(0.8),
                                    fontSize: height * 0.018,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                // Title
                                Text(
                                  audio.metas.title ?? 'Unknown',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Row(
                              children: [
                                SizedBox(
                                  height: height * 0.016,
                                  width: height * 0.016,
                                  child: CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    borderRadius: BorderRadius.circular(100),
                                    color: CupertinoColors.systemGrey
                                        .withOpacity(0.2),
                                    child: Icon(
                                      CupertinoIcons.down_arrow,
                                      size: height * 0.010,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: Icon(
                                    Icons.more_horiz_rounded,
                                    size: height * 0.019,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
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
