import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class SongProvider with ChangeNotifier, WidgetsBindingObserver {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  List<Audio> _playList = [];
  int _currentIndex = 0;

  AssetsAudioPlayer get assetsAudioPlayer => _assetsAudioPlayer;

  List<Audio> get playList => _playList;

  SongProvider() {
    WidgetsBinding.instance.addObserver(this);
    _assetsAudioPlayer.playlistFinished.listen((isFinished) {
      if (isFinished) {
        playNext();
      }
    });
  }

  void setPlayList(List<Audio> newList) {
    _playList = newList;
    _currentIndex = 0;
    _assetsAudioPlayer.open(
      Playlist(
        audios: _playList,
      ),
      autoStart: true,
      showNotification: true,
    );
    notifyListeners();
  }

  void playAudio() {
    _assetsAudioPlayer.play();
    log('--------------- Playing ---------------');
  }

  void pauseAudio() {
    _assetsAudioPlayer.pause();
    log('--------------- Pausing ---------------');
  }

  void playNext() {
    _playNextInPlayList();
    log('--------------- Next ---------------');
  }

  void _playNextInPlayList() {
    _currentIndex++;
    if (_currentIndex < _playList.length) {
      _assetsAudioPlayer.playlistPlayAtIndex(_currentIndex);
      notifyListeners();
    } else {
      _currentIndex = 0;
      _assetsAudioPlayer.stop();
      notifyListeners();
    }
  }

  void playPrevious() {
    _playPreviousInPlayList();
    log('--------------- Previous ---------------');
  }

  void _playPreviousInPlayList() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _assetsAudioPlayer.playlistPlayAtIndex(_currentIndex);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
