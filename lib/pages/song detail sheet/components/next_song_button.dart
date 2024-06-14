import 'package:flutter/cupertino.dart';

import '../../../providers/song_provider.dart';


class NextSongButton extends StatelessWidget {
  const NextSongButton({
    super.key,
    required this.providerTrue,
    required this.providerFalse,
  });

  final SongProvider providerTrue;
  final SongProvider providerFalse;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      key: providerTrue.nextAnimationKey,
      tween: Tween<double>(
        begin: 6,
        end: MediaQuery.of(context).size.height * 0.040,
      ),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: CupertinoButton(
          onPressed: () => providerFalse.playNext(),
          child: Icon(
            CupertinoIcons.forward_fill,
            size: value,
            color: CupertinoColors.white,
          ),
        ),
      ),
    );
  }
}