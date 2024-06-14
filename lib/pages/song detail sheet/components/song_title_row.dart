import 'package:apple_music/utils/constant.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/song_provider.dart';

class SongTitleRow extends StatelessWidget {
  const SongTitleRow({
    super.key,
    required this.playing,
  });

  final Playing? playing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Song Name
                Text(
                  overflow: TextOverflow.ellipsis,
                  playing != null
                      ? playing!.audio.audio.metas.title ??
                      'Playing'
                      : 'Not Playing',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.026),
                ),

                // Album name
                Text(
                  overflow: TextOverflow.ellipsis,
                  playing != null
                      ? playing!.audio.audio.metas.album ??
                      'Playing'
                      : 'Not Playing',
                  style: TextStyle(
                      color: CupertinoColors.white
                          .withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.020),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: height * 0.028,
              width: height * 0.028,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                color:
                CupertinoColors.systemGrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
                onPressed: () {},
                child: Icon(
                  Icons.star_outline_rounded,
                  color: Colors.white,
                  size: height * 0.020,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: height * 0.028,
              width: height * 0.028,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                color:
                CupertinoColors.systemGrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
                onPressed: () {},
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: height * 0.020,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}