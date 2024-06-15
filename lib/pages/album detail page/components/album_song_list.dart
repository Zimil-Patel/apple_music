
import 'package:apple_music/providers/song_provider.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/lists/song_list.dart';


class AlbumSongList extends StatelessWidget {
  const AlbumSongList({
    super.key,
    required this.albumName,
    required this.providerFalse,
  });

  final String albumName;
  final SongProvider providerFalse;

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
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
    );
  }
}