// import 'package:just_audio/just_audio.dart';
// import 'package:flutter/material.dart';

// class MusicProvider with ChangeNotifier {
//   late AudioPlayer _audioPlayer;
//   bool _isPlaying = false;
//   bool _isMuted = false; // وضعیت صدا (قطع یا روشن)

//   MusicProvider() {
//     _audioPlayer = AudioPlayer();
//   }

//   Future<void> playMusic(String assetPath) async {
//     try {
//       await _audioPlayer.setAsset(assetPath);
//       await _audioPlayer.play();
//       _isPlaying = true;
//       notifyListeners();
//     } catch (e) {
//       debugPrint("Error playing music: $e");
//     }
//   }

//   Future<void> stopMusic() async {
//     try {
//       await _audioPlayer.stop();
//       _isPlaying = false;
//       notifyListeners();
//     } catch (e) {
//       debugPrint("Error stopping music: $e");
//     }
//   }

//   Future<void> toggleMute() async {
//     if (_isMuted) {
//       await _audioPlayer.setVolume(1); // باز کردن صدا
//     } else {
//       await _audioPlayer.setVolume(0); // قطع صدا
//     }
//     _isMuted = !_isMuted; // تغییر وضعیت صدا
//     notifyListeners(); // آیکون به‌طور خودکار به‌روزرسانی می‌شود
//   }

//   bool get isPlaying => _isPlaying;
//   bool get isMuted => _isMuted; // وضعیت صدا

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }
// }
