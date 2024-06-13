import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/song_provider.dart';

class AudioPlayerIndicator extends StatelessWidget {
  const AudioPlayerIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    SongProvider songProviderTrue =
        Provider.of<SongProvider>(context, listen: true);
    SongProvider songProviderFalse =
        Provider.of<SongProvider>(context, listen: false);

    bool isDarkTheme = CupertinoTheme.of(context).brightness == Brightness.dark;
    Color shadowColor = isDarkTheme
        ? Colors.white.withOpacity(0.1)
        : Colors.black.withOpacity(0.2);

    return StreamBuilder<Playing?>(
      stream: songProviderTrue.assetsAudioPlayer.current,
      builder: (context, snapshot) {
        final Playing? playing = snapshot.data;

        return Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 8,
            left: 5,
            right: 5,
          ),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CupertinoTheme.of(context).barBackgroundColor.withOpacity(1),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey,
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: AssetImage(playing != null
                          ? 'assets/album images/${playing.audio.audio.metas.album}.png'
                          : 'assets/images/music.png') as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                playing != null
                    ? playing.audio.audio.metas.title ?? 'Playing'
                    : 'Not Playing',
                style: TextStyle(
                  color: CupertinoTheme.of(context).textTheme.textStyle.color,
                ),
              ),
              const Spacer(),
              TweenAnimationBuilder(
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
              ),
              const SizedBox(width: 20),
              TweenAnimationBuilder(
                key: songProviderTrue.nextAnimationKey,
                tween: Tween<double>(
                  begin: 10,
                  end: MediaQuery.of(context).size.height * 0.025,
                ),
                duration: const Duration(milliseconds: 200),
                builder: (context, value, child) => Icon(
                  CupertinoIcons.forward_fill,
                  size: value,
                  color: CupertinoTheme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        );
      },
    );
  }
}
