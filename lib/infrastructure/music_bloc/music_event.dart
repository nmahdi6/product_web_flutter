part of 'music_bloc.dart';

abstract class MusicEvent {}

class PlayMusicEvent extends MusicEvent {
  final String assetPath;

  PlayMusicEvent(this.assetPath);
}

class StopMusicEvent extends MusicEvent {}

class ToggleMuteEvent extends MusicEvent {}
