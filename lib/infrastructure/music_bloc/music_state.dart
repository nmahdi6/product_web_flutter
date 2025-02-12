part of 'music_bloc.dart';

abstract class MusicState {}

class MusicInitial extends MusicState {}

class MusicPlaying extends MusicState {
  final bool isPlaying;
  final bool isMuted;

  MusicPlaying({required this.isPlaying, required this.isMuted});
}
