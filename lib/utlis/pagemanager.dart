import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PageManager {
  AudioPlayer player = AudioPlayer();

  String? path = "";

  ValueNotifier<ProgressBarState> progressNotifier =
      ValueNotifier<ProgressBarState>(
    ProgressBarState(
      total: Duration.zero,
      position: Duration.zero,
    ),
  );

  ValueNotifier<AudioState> buttonNotifier =
      ValueNotifier<AudioState>(AudioState.paused);

  ValueNotifier<bool> isLoaded = ValueNotifier<bool>(false);

  PageManager({
    required this.path,
  }) {
    _init();
  }

  PageManager.init() {
    isLoaded.value = true;
  }

  _init() async {
    try {
      await player.setSourceUrl(path ?? "");
      player.setReleaseMode(ReleaseMode.stop);
      player.setPlayerMode(PlayerMode.mediaPlayer);

      progressNotifier.value = ProgressBarState(
        total: (await player.getDuration())!,
        position: Duration.zero,
      );

      isLoaded.value = true;
    } on Exception {}

    player.onPositionChanged.listen((event) {
      final oldState = progressNotifier.value;

      progressNotifier.value = ProgressBarState(
        total: oldState.total,
        position: event,
      );
    });
    player.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.paused) {
        buttonNotifier.value = AudioState.paused;
      }
      if (event == PlayerState.playing) {
        buttonNotifier.value = AudioState.playing;
      }
    });
    player.onPlayerComplete.listen((event) {
      buttonNotifier.value = AudioState.paused;
    });
  }

  void play() async {
    player.resume();
  }

  void pause() {
    player.pause();
  }

  void stop() {
    player.stop();
  }

  Future dispose() async {
    player.dispose();
  }
}

class ProgressBarState {
  final Duration total;
  final Duration position;
  ProgressBarState({
    required this.total,
    required this.position,
  });
}

enum AudioState { paused, playing }
