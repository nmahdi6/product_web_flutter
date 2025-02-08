import 'package:aerium/injection_container.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:aerium/app_theme.dart';
import 'package:aerium/presentation/routes/routes.dart';
import 'package:just_audio/just_audio.dart';
import 'package:layout/layout.dart';
import 'package:url_strategy/url_strategy.dart';
import 'configure_web.dart';

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
  late AudioPlayer _secondAudioPlayer;
  late MusicController _musicController;

  @override
  void initState() {
    super.initState();
    _secondAudioPlayer = AudioPlayer();
    _musicController = MusicController(_secondAudioPlayer);
    _playSecondAudio(); // پخش موزیک دوم
  }

  Future<void> _playSecondAudio() async {
    try {
      await _secondAudioPlayer.setAsset(StringConst.secound_music); // موزیک دوم
      _secondAudioPlayer.setLoopMode(LoopMode.all); // تکرار موزیک
      await _secondAudioPlayer.play();
    } catch (e) {
      debugPrint("Error playing second audio: $e");
    }
  }

  @override
  void dispose() {
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
        initialRoute: '/splash', // شروع از صفحه‌ی اسپلش
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
