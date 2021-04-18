// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$totalDurationAtom = Atom(name: '_HomeStore.totalDuration');

  @override
  Duration? get totalDuration {
    _$totalDurationAtom.reportRead();
    return super.totalDuration;
  }

  @override
  set totalDuration(Duration? value) {
    _$totalDurationAtom.reportWrite(value, super.totalDuration, () {
      super.totalDuration = value;
    });
  }

  final _$positionAtom = Atom(name: '_HomeStore.position');

  @override
  Duration? get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Duration? value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$lastPositionPlayerAtom = Atom(name: '_HomeStore.lastPositionPlayer');

  @override
  int get lastPositionPlayer {
    _$lastPositionPlayerAtom.reportRead();
    return super.lastPositionPlayer;
  }

  @override
  set lastPositionPlayer(int value) {
    _$lastPositionPlayerAtom.reportWrite(value, super.lastPositionPlayer, () {
      super.lastPositionPlayer = value;
    });
  }

  final _$playingAtom = Atom(name: '_HomeStore.playing');

  @override
  bool get playing {
    _$playingAtom.reportRead();
    return super.playing;
  }

  @override
  set playing(bool value) {
    _$playingAtom.reportWrite(value, super.playing, () {
      super.playing = value;
    });
  }

  final _$musicModelsAtom = Atom(name: '_HomeStore.musicModels');

  @override
  List<MusicResponse> get musicModels {
    _$musicModelsAtom.reportRead();
    return super.musicModels;
  }

  @override
  set musicModels(List<MusicResponse> value) {
    _$musicModelsAtom.reportWrite(value, super.musicModels, () {
      super.musicModels = value;
    });
  }

  final _$searchMusicByArtistAsyncAction =
      AsyncAction('_HomeStore.searchMusicByArtist');

  @override
  Future<void> searchMusicByArtist([String search = 'jack johnson']) {
    return _$searchMusicByArtistAsyncAction
        .run(() => super.searchMusicByArtist(search));
  }

  final _$changeIndexPositionMusicAsyncAction =
      AsyncAction('_HomeStore.changeIndexPositionMusic');

  @override
  Future<void> changeIndexPositionMusic(int index) {
    return _$changeIndexPositionMusicAsyncAction
        .run(() => super.changeIndexPositionMusic(index));
  }

  final _$setPlayingAsyncAction = AsyncAction('_HomeStore.setPlaying');

  @override
  Future<void> setPlaying() {
    return _$setPlayingAsyncAction.run(() => super.setPlaying());
  }

  final _$prevPositionAsyncAction = AsyncAction('_HomeStore.prevPosition');

  @override
  Future<void> prevPosition() {
    return _$prevPositionAsyncAction.run(() => super.prevPosition());
  }

  final _$nextPositionAsyncAction = AsyncAction('_HomeStore.nextPosition');

  @override
  Future<void> nextPosition() {
    return _$nextPositionAsyncAction.run(() => super.nextPosition());
  }

  final _$seekAudioAsyncAction = AsyncAction('_HomeStore.seekAudio');

  @override
  Future<void> seekAudio(Duration durationToSeek) {
    return _$seekAudioAsyncAction.run(() => super.seekAudio(durationToSeek));
  }

  @override
  String toString() {
    return '''
totalDuration: ${totalDuration},
position: ${position},
loading: ${loading},
lastPositionPlayer: ${lastPositionPlayer},
playing: ${playing},
musicModels: ${musicModels}
    ''';
  }
}
