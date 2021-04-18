import 'package:audioplayers/audioplayers.dart';
import 'package:itunes/network/model/music_response.dart';
import 'package:itunes/network/service/music_service.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {

  MusicService _musicService = MusicServiceImpl();
  AudioPlayer audioPlayer = AudioPlayer();

  @observable Duration? totalDuration;
  @observable Duration? position;

  @observable
  bool loading = false;

  @observable
  int lastPositionPlayer = -1;

  @observable
  bool playing = false;

  @observable
  List<MusicResponse> musicModels = [];

  _HomeStore() {
    audioPlayer.onDurationChanged.listen((updatedDuration) {
      totalDuration = updatedDuration;
    });

    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {
      position = updatedPosition;
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if(playerState == AudioPlayerState.STOPPED)
        playing = false;
      if(playerState==AudioPlayerState.PLAYING)
        playing = true;
      if(playerState == AudioPlayerState.PAUSED)
        playing = false;
      if(playerState == AudioPlayerState.COMPLETED) {
        if (lastPositionPlayer < musicModels.length -1 ) {
          lastPositionPlayer++;
          playAudio();
        } else {
          playing = false;
        }
      }
    });
    _init();
  }


  @action
  Future<void> searchMusicByArtist([String search = 'jack johnson']) async {
    loading = true;
    if (playing == true) {
      stopAudio();
    }
    playing = false;
    lastPositionPlayer = -1;
    musicModels = await _musicService.searchMusicByArtist(search);
    if (musicModels.isNotEmpty) {
      lastPositionPlayer = 0;
    }
    loading = false;
  }

  @action
  Future<void> changeIndexPositionMusic(int index) async {
    if (index == lastPositionPlayer) {
      setPlaying();
    } else {
      lastPositionPlayer = index;
      stopAudio();
      playAudio();
    }
  }

  @action
  Future<void> setPlaying() async {
    if (playing == true) {
      pauseAudio();
    } else {
      playAudio();
    }
  }

  @action
  Future<void> prevPosition() async {
    if (lastPositionPlayer > 0) {
      lastPositionPlayer--;
      stopAudio();
      playAudio();
    }
  }

  @action
  Future<void> nextPosition() async {
    if (lastPositionPlayer < musicModels.length -1 ) {
      lastPositionPlayer++;
      stopAudio();
      playAudio();
    }
  }

  @action
  Future<void> seekAudio(Duration durationToSeek) async{
    audioPlayer.seek(durationToSeek);
  }

  void playAudio() {
    if (lastPositionPlayer >= 0 && lastPositionPlayer < musicModels.length && loading == false) {
      audioPlayer.play(musicModels[lastPositionPlayer].previewUrl.toString());
    }
  }

  void pauseAudio(){
    audioPlayer.pause();
  }

  void stopAudio(){
    audioPlayer.stop();
  }

  void _init() async {
    searchMusicByArtist();
  }

}