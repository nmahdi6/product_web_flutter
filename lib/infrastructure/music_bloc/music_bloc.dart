import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isMuted = false;

  MusicBloc() : super(MusicInitial()) {
    _audioPlayer = AudioPlayer();

    on<PlayMusicEvent>(_onPlayMusic);
    on<StopMusicEvent>(_onStopMusic);
    on<ToggleMuteEvent>(_onToggleMute);
  }

  Future<void> _onPlayMusic(
      PlayMusicEvent event, Emitter<MusicState> emit) async {
    try {
      await _audioPlayer.setAsset(event.assetPath);
      await _audioPlayer.play();
      _isPlaying = true;
      emit(MusicPlaying(isPlaying: _isPlaying, isMuted: _isMuted));
    } catch (e) {
      debugPrint("Error playing music: $e");
    }
  }

  Future<void> _onStopMusic(
      StopMusicEvent event, Emitter<MusicState> emit) async {
    try {
      await _audioPlayer.stop();
      _isPlaying = false;
      emit(MusicPlaying(isPlaying: _isPlaying, isMuted: _isMuted));
    } catch (e) {
      debugPrint("Error stopping music: $e");
    }
  }

  Future<void> _onToggleMute(
      ToggleMuteEvent event, Emitter<MusicState> emit) async {
    if (_isMuted) {
      await _audioPlayer.setVolume(1);
    } else {
      await _audioPlayer.setVolume(0);
    }
    _isMuted = !_isMuted;
    emit(MusicPlaying(isPlaying: _isPlaying, isMuted: _isMuted));
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
