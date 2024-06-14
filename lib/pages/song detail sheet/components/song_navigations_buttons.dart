
import 'package:apple_music/pages/song%20detail%20sheet/components/play_pause_button.dart';
import 'package:apple_music/pages/song%20detail%20sheet/components/previous_song_button.dart';
import 'package:flutter/cupertino.dart';

import '../../../providers/song_provider.dart';
import 'next_song_button.dart';

class SongNavigationButtons extends StatelessWidget {
  const SongNavigationButtons({
    super.key,
    required this.providerTrue,
    required this.providerFalse,
  });

  final SongProvider providerTrue;
  final SongProvider providerFalse;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Backward Button
        PreviousSongButton(providerTrue: providerTrue, providerFalse: providerFalse),

        // Play Pause Button
        PlayPauseButton(providerTrue: providerTrue, providerFalse: providerFalse),

        // Next Button
        NextSongButton(providerTrue: providerTrue, providerFalse: providerFalse),
      ],
    );
  }
}


