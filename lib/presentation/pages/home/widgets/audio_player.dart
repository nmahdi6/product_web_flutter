import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;

  AudioPlayerWidget({required this.audioUrl});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double volume = 1.0;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playPause() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer
          .play(UrlSource(widget.audioUrl)); // استفاده از UrlSource
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void setVolume(double newVolume) async {
    await audioPlayer.setVolume(newVolume);
    setState(() {
      volume = newVolume;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: playPause,
        ),
        Slider(
          value: volume,
          min: 0.0,
          max: 1.0,
          onChanged: setVolume,
        ),
      ],
    );
  }
}
