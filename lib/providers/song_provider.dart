import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class SongProvider with ChangeNotifier, WidgetsBindingObserver {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  List<Audio> _playList = [];
  int _currentIndex = 0;
  bool _isPlaying = false;
  bool isSongIndicatorVisible = false;
  bool _isSliding = false;
  double _currentSliderValue = 0.0;
  double _currentSongSliderValue = 0.0;


  double get currentSongSliderValue => _currentSongSliderValue;

  set currentSongSliderValue(double value) {
    _currentSongSliderValue = value;
  }

  bool get isSliding => _isSliding;

  set isSliding(bool value) {
    _isSliding = value;
  }

  UniqueKey playPauseAnimationKey = UniqueKey();
  UniqueKey nextAnimationKey = UniqueKey();
  UniqueKey previousAnimationKey = UniqueKey();

  AssetsAudioPlayer get assetsAudioPlayer => _assetsAudioPlayer;

  List<Audio> get playList => _playList;

  bool get isPlaying => _isPlaying;

  SongProvider() {
    WidgetsBinding.instance.addObserver(this);
    _assetsAudioPlayer.isPlaying.listen((value) {
      _isPlaying = value;
      notifyListeners();
    });

    _assetsAudioPlayer.playlistFinished.listen((isFinished) {
      if (isFinished) {
        playNext();
      }
    });

  }

  Future<void> setPlayList(List<Audio> newList) async {
    log('--------------- ${_playList == newList} ---------------');
    if (_playList != newList) {
      if(!isSongIndicatorVisible){
        isSongIndicatorVisible = true;
      }
      log('--------------- Playlist changed $newList ---------------');
      _playList = newList;
      _currentIndex = 0;
      await _assetsAudioPlayer.open(
        Playlist(
          audios: _playList,
        ),
        autoStart: false,
        showNotification: true,
      );
      notifyListeners();
    }
  }

  Future<void> playAtIndex(int index) async {
    _currentIndex = index;
    await _assetsAudioPlayer.playlistPlayAtIndex(_currentIndex);
    playPauseAnimationKey = UniqueKey();
    notifyListeners();
    log('--------------- Playing At Index $_currentIndex ---------------');
  }

  Future<void> playAudio() async {
    await _assetsAudioPlayer.play();
    playPauseAnimationKey = UniqueKey();
    log('--------------- Playing ---------------');
  }

  Future<void> playPlaylist() async {
    _currentIndex = 0;
    await _assetsAudioPlayer.playlistPlayAtIndex(_currentIndex);
    playPauseAnimationKey = UniqueKey();
    notifyListeners();
    log('--------------- Playing PlayList ---------------');
  }

  Future<void> playOrPauseAudio() async {
    await _assetsAudioPlayer.playOrPause();
    playPauseAnimationKey = UniqueKey();
    notifyListeners();
  }

  Future<void> pauseAudio() async {
    await _assetsAudioPlayer.pause();
    playPauseAnimationKey = UniqueKey();
    log('--------------- Pausing ---------------');
  }

  Future<void> playNext() async {
    await _playNextInPlayList();
    nextAnimationKey = UniqueKey();
    log('--------------- Next ---------------');
  }

  Future<void> _playNextInPlayList() async {
    bool isPlayListFinished = false;
    _assetsAudioPlayer.playlistFinished.listen((value) {
        isPlayListFinished = value;
    });
    if (!isPlayListFinished) {
      await _assetsAudioPlayer.next();
    } else {
      _currentIndex = 0;
      await _assetsAudioPlayer.stop();
      await _assetsAudioPlayer.playlistPlayAtIndex(_currentIndex);
    }
    playPauseAnimationKey = UniqueKey();
    notifyListeners();
  }

  Future<void> playPrevious() async {
    await _assetsAudioPlayer.previous();
    previousAnimationKey = UniqueKey();
    notifyListeners();
    log('--------------- Previous ---------------');
  }

  Future<void> _playPreviousInPlayList() async {
    if (_currentIndex > 0) {
      _currentIndex--;
      await _assetsAudioPlayer.playlistPlayAtIndex(_currentIndex);
      previousAnimationKey = UniqueKey();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  double get currentSliderValue => _currentSliderValue;

  set currentSliderValue(double value) {
    _currentSliderValue = value;
  }
}
