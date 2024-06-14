import 'package:flutter/cupertino.dart';

import '../../../providers/song_provider.dart';


class AnimatedForwardButton extends StatelessWidget {
  const AnimatedForwardButton({
    super.key,
    required this.songProviderTrue,
    required this.songProviderFalse,
  });

  final SongProvider songProviderTrue;
  final SongProvider songProviderFalse;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      key: songProviderTrue.nextAnimationKey,
      tween: Tween<double>(
        begin: 10,
        end: MediaQuery.of(context).size.height * 0.025,
      ),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) => GestureDetector(
        onTap: () => songProviderFalse.playNext(),
        child: Icon(
          CupertinoIcons.forward_fill,
          size: value,
          color: CupertinoTheme.of(context).primaryColor,
        ),
      ),
    );
  }
}
