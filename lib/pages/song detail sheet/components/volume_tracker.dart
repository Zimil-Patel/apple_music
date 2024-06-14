import 'package:apple_music/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../providers/song_provider.dart';

class VolumeTracker extends StatelessWidget {
  const VolumeTracker({
    super.key,
    required this.providerTrue,
    required this.providerFalse,
  });

  final SongProvider providerTrue;
  final SongProvider providerFalse;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderThemeData(
            trackHeight: 5,
            thumbColor: Colors.transparent,
            thumbShape: SliderComponentShape.noThumb,
            activeTrackColor: CupertinoColors.white,
            inactiveTrackColor: CupertinoColors.white.withOpacity(0.4)),
        child: StreamBuilder<double>(
            stream: providerTrue.assetsAudioPlayer.volume,
            builder: (context, snapshot) {
              final currentVolume = snapshot.data ?? 1.0;
              if (!providerTrue.isSliding) {
                providerFalse.currentSongSliderValue = currentVolume;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.volume_mute,
                      color:
                      CupertinoColors.white.withOpacity(0.4),
                      size: height * 0.023,
                    ),
                    Expanded(
                      child: Slider(
                        value: providerTrue.currentSongSliderValue.clamp(0.0, 1.0),
                        min: 0.0,
                        max: 1.0,
                        onChanged: (value) {
                          providerFalse.currentSongSliderValue = value;
                          providerFalse.isSliding = true;
                        },
                        onChangeEnd: (value) async {
                          await providerTrue.assetsAudioPlayer.setVolume(value.clamp(0.0, 1.0));
                          providerFalse.isSliding = false;
                        },
                      ),
                    ),
                    Icon(
                      CupertinoIcons.volume_up,
                      color:
                      CupertinoColors.white.withOpacity(0.4),
                      size: height * 0.023,
                    ),
                  ],
                ),
              );
            }));
  }
}
