import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../providers/song_provider.dart';

class SliderTracker extends StatelessWidget {
  const SliderTracker({
    super.key,
    required this.providerTrue,
    required this.providerFalse,
    required this.playing,
  });

  final SongProvider providerTrue;
  final SongProvider providerFalse;
  final Playing? playing;

  @override
  Widget build(BuildContext context) {
    String formatDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));
      return '$minutes:$seconds';
    }

    return SliderTheme(
        data: SliderThemeData(
            trackHeight: 5,
            thumbColor: Colors.transparent,
            thumbShape: SliderComponentShape.noThumb,
            activeTrackColor: CupertinoColors.white,
            inactiveTrackColor: CupertinoColors.white.withOpacity(0.4)),
        child: StreamBuilder<Duration>(
            stream: providerTrue.assetsAudioPlayer.currentPosition,
            builder: (context, snapshot) {
              final currentPosition = snapshot.data ?? Duration.zero;
              if (!providerTrue.isSliding) {
                providerFalse.currentSliderValue =
                    currentPosition.inMilliseconds.toDouble();
              }
              return Column(
                children: [
                  // Progress indicator
                  Slider(
                    value: providerTrue.currentSliderValue,
                    min: 0.0,
                    max: playing!.audio.duration.inMilliseconds.toDouble(),
                    onChanged: (value) {
                      providerFalse.currentSliderValue = value;
                      providerFalse.isSliding = true;
                    },
                    onChangeEnd: (value) async {
                      final newDuration = Duration(milliseconds: value.toInt());
                      await providerTrue.assetsAudioPlayer.seek(newDuration);
                      providerFalse.isSliding = false;
                    },
                  ),

                  // Timer indicator
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(
                          formatDuration(playing!.audio.duration),
                          style: TextStyle(
                            color: CupertinoColors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                      const Spacer(),

                      Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: Text(
                          formatDuration(currentPosition),
                          style: TextStyle(
                            color: CupertinoColors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }));
  }
}
