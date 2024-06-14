import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/constant.dart';

class AnimatedSongImage extends StatelessWidget {
  const AnimatedSongImage({
    super.key,
    required this.playing,
  });

  final Playing? playing;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 400),
      tween: Tween<double>(begin: 200, end: height / 3.5),
      builder: (context, value, child) => Container(
        height: value,
        width: value,
        margin: EdgeInsets.only(
            top: height * 0.04, bottom: height * 0.04),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(playing != null
                ? 'assets/album images/${playing!.audio.audio.metas.album}.png'
                : 'assets/images/music.png') as ImageProvider,
          ),
        ),
      ),
    );
  }
}
