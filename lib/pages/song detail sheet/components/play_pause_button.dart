import 'package:flutter/cupertino.dart';

import '../../../providers/song_provider.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    super.key,
    required this.providerTrue,
    required this.providerFalse,
  });

  final SongProvider providerTrue;
  final SongProvider providerFalse;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      key: providerTrue.playPauseAnimationKey,
      tween: Tween<double>(
        begin: 6,
        end: MediaQuery.of(context).size.height * 0.040,
      ),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: CupertinoButton(
          onPressed: () => providerFalse.playOrPauseAudio(),
          child: Icon(
            providerTrue.isPlaying
                ? CupertinoIcons.pause_solid
                : CupertinoIcons.play_arrow_solid,
            size: value,
            color: CupertinoColors.white,
          ),
        ),
      ),
    );
  }
}