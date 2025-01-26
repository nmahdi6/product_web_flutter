import 'package:aerium/injection_container.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:aerium/app_theme.dart';
import 'package:aerium/presentation/pages/home/home_page.dart';
import 'package:aerium/presentation/routes/routes.dart';
import 'package:just_audio/just_audio.dart';
import 'package:layout/layout.dart';
import 'configure_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  configureApp();
  runApp(Aerium());
}

class Aerium extends StatefulWidget {
  @override
  State<Aerium> createState() => _AeriumState();
}

class _AeriumState extends State<Aerium> {
  late AudioPlayer _audioPlayer;
  late AudioPlayer _secondAudioPlayer;
  late MusicController _musicController; // کنترل موزیک
  bool isPlayingFirstAudio = true; // وضعیت پخش موزیک اول

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _secondAudioPlayer = AudioPlayer();
    _musicController = MusicController(_audioPlayer);

    _playFirstAudio();
  }

  /// پخش موزیک اول به مدت ۶ ثانیه
  Future<void> _playFirstAudio() async {
    try {
      await _audioPlayer.setAudioSource(
        AudioSource.asset('assets/audio/08-hans_zimmer-mountains.mp3'),
      );
      await _secondAudioPlayer.stop();
      await _audioPlayer.play();

      // تغییر به موزیک دوم پس از ۶ ثانیه
      Future.delayed(const Duration(seconds: 6), () async {
        await _audioPlayer.stop();
        await _playSecondAudio();
      });
    } catch (e) {
      debugPrint("Error playing first audio: $e");
    }
  }

  /// پخش موزیک دوم
  Future<void> _playSecondAudio() async {
    try {
      await _secondAudioPlayer.setAudioSource(
        AudioSource.asset('assets/audio/Hans-Zimmer-S.T.A.Y.mp3'),
      );
      await _audioPlayer.stop();
      _secondAudioPlayer.setLoopMode(LoopMode.all); // تکرار موزیک دوم
      await _secondAudioPlayer.play();
    } catch (e) {
      debugPrint("Error playing second audio: $e");
    }
  }

  @override
  void dispose() {
    // آزادسازی منابع
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
        initialRoute: HomePage.homePageRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}

class MusicController {
  final AudioPlayer audioPlayer;

  MusicController(this.audioPlayer);

  /// تغییر حجم صدا
  void setVolume(double volume) {
    audioPlayer.setVolume(volume.clamp(0.0, 1.0));
  }

  /// قطع و وصل کردن موزیک
  Future<void> togglePlayPause() async {
    if (audioPlayer.playing) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play();
    }
  }
}
