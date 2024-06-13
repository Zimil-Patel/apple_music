import 'package:apple_music/utils/constant.dart';
import 'package:apple_music/utils/lists/song_list.dart';
import 'package:flutter/cupertino.dart';

class AnimatedAlbumImage extends StatelessWidget {
  const AnimatedAlbumImage({
    super.key,
    required this.albumIndex,
  });

  final int albumIndex;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 200, end: height / 3.4),
      builder: (context, value, child) => Container(
        height: value,
        width: value,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/album images/${songList.keys.toList()[albumIndex]}.png'),
          ),
        ),
      ),
    );
  }
}