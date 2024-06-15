
import 'package:apple_music/providers/song_provider.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';


class PlayShuffleButtonRow extends StatelessWidget {
  const PlayShuffleButtonRow({
    super.key,
    required this.providerFalse,
    required this.songList,
  });

  final SongProvider providerFalse;
  final List<Audio> songList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.06,
      child: Padding(
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
                        .setPlayList(songList);
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
                        size: height * 0.022,
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
                          fontSize: height * 0.016,
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
                  onPressed: () async {
                    List<Audio> shuffledList = [];
                    shuffledList.addAll(songList);
                    shuffledList.shuffle();
                    await providerFalse.setPlayList(shuffledList);
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
                        CupertinoIcons.shuffle,
                        size: height * 0.022,
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
                          fontSize: height * 0.016,
                          color: CupertinoTheme.of(context)
                              .primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}