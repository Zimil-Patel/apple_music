import 'package:flutter/cupertino.dart';

import '../../../providers/song_provider.dart';

class AnimatedPlayButton extends StatelessWidget {
  const AnimatedPlayButton({
    super.key,
    required this.songProviderTrue,
    required this.songProviderFalse,
  });

  final SongProvider songProviderTrue;
  final SongProvider songProviderFalse;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      key: songProviderTrue.playPauseAnimationKey,
      tween: Tween<double>(
        begin: 6,
        end: MediaQuery.of(context).size.height * 0.025,
      ),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) => GestureDetector(
        onTap: () => songProviderFalse.playOrPauseAudio(),
        child: Icon(
          songProviderTrue.isPlaying
              ? CupertinoIcons.pause_solid
              : CupertinoIcons.play_arrow_solid,
          size: value,
          color: CupertinoTheme.of(context).primaryColor,
        ),
      ),
    );
  }
}
