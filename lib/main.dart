import 'package:aerium/injection_container.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:aerium/app_theme.dart';
import 'package:aerium/presentation/routes/routes.dart';
import 'package:just_audio/just_audio.dart';
import 'package:layout/layout.dart';
import 'configure_web.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  configureApp();
  // setPathUrlStrategy(); // حذف # از URL‌ها
  runApp(Aerium());
}

class Aerium extends StatefulWidget {
  @override
  State<Aerium> createState() => _AeriumState();
}

class _AeriumState extends State<Aerium> {
  late AudioPlayer _audioPlayer;
  late AudioPlayer _secondAudioPlayer;
  late MusicController _musicController;
  bool isPlayingFirstAudio = true;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _secondAudioPlayer = AudioPlayer();
    _musicController = MusicController(_audioPlayer);

    _playFirstAudio();
  }

  Future<void> _playFirstAudio() async {
    try {
      await _audioPlayer.setAudioSource(
        AudioSource.asset(StringConst.first_music),
      );
      await _secondAudioPlayer.stop();
      await _audioPlayer.play();

      Future.delayed(const Duration(seconds: 6), () async {
        await _audioPlayer.stop();
        await _playSecondAudio();
      });
    } catch (e) {
      debugPrint("Error playing first audio: $e");
    }
  }

  Future<void> _playSecondAudio() async {
    try {
      await _secondAudioPlayer.setAudioSource(
        AudioSource.asset(StringConst.secound_music),
      );
      await _audioPlayer.stop();
      _secondAudioPlayer.setLoopMode(LoopMode.all);
      await _secondAudioPlayer.play();
    } catch (e) {
      debugPrint("Error playing second audio: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _secondAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: StringConst.APP_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}

class MusicController {
  final AudioPlayer audioPlayer;

  MusicController(this.audioPlayer);

  void setVolume(double volume) {
    audioPlayer.setVolume(volume.clamp(0.0, 1.0));
  }

  Future<void> togglePlayPause() async {
    if (audioPlayer.playing) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play();
    }
  }
}
