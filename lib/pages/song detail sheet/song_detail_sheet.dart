import 'dart:developer';

import 'package:apple_music/pages/song%20detail%20sheet/components/volume_tracker.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/song_provider.dart';
import 'components/animated_song_image.dart';
import 'components/bottom_stuffs.dart';
import 'components/pop_back_button.dart';
import 'components/slider_tracker.dart';
import 'components/song_navigations_buttons.dart';
import 'components/song_title_row.dart';

class ModalContent extends StatelessWidget {
  const ModalContent({
    super.key,
    required this.playing,
  });

  final Playing? playing;

  @override
  Widget build(BuildContext context) {
    SongProvider providerTrue =
        Provider.of<SongProvider>(context, listen: true);
    SongProvider providerFalse =
        Provider.of<SongProvider>(context, listen: false);
    return StreamBuilder<Playing?>(
        stream: providerTrue.assetsAudioPlayer.current,
        builder: (context, snapshot) {
          final playing = snapshot.data;
          if (playing != null) {
            final duration = playing.audio.duration;
            return Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                          'assets/album images/${playing.audio.audio.metas.album}.png')
                      as ImageProvider,
                ),
              ),
              child: DraggableScrollableSheet(
                initialChildSize: 1,
                maxChildSize: 1,
                minChildSize: 1,
                builder: (context, scrollController) => BlurryContainer(
                  height: height,
                  width: width,
                  blur: 50,
                  padding: EdgeInsets.zero,
                  elevation: 10,
                  color: CupertinoColors.systemGrey.withOpacity(0.5),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Pop Button
                        const PopBackButton(),

                        // Album Image
                        AnimatedSongImage(playing: playing),

                        // SongName / AlbumName / Favourite & More Button
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SongTitleRow(playing: playing),

                              // Slider tracker
                              SliderTracker(
                                  providerTrue: providerTrue,
                                  providerFalse: providerFalse,
                                  playing: playing),

                              // Song navigation buttons / play , pause, next, previous
                              SongNavigationButtons(
                                  providerTrue: providerTrue,
                                  providerFalse: providerFalse),

                              // Volume tracker
                              VolumeTracker(providerTrue: providerTrue, providerFalse: providerFalse),

                              // Other stuff
                              const BottomStuffs(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}


