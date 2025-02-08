import 'dart:math';
import 'dart:async';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart'; // برای پخش موزیک

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _textAnimationController;
  late Animation<double> textAnimation;
  int _seconds = 0;
  bool _isAnimationOver = false;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();

    // تنظیم انیمیشن متن
    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    textAnimation =
        Tween<double>(begin: 0, end: 1).animate(_textAnimationController);
    _textAnimationController.forward();

    // پخش موزیک اول
    _audioPlayer = AudioPlayer();
    _playMusic();

    // شروع تایمر 6 ثانیه‌ای
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
      if (_seconds == 6) {
        timer.cancel();
        _navigateToHome();
        setState(() {
          _isAnimationOver = true;
        });
      }
    });
  }

  _playMusic() async {
    try {
      await _audioPlayer.setAsset(StringConst.first_music); // موزیک اول
      await _audioPlayer.play();
    } catch (e) {
      debugPrint("Error playing music: $e");
    }
  }

  _navigateToHome() async {
    await _audioPlayer.stop(); // توقف موزیک اول
    Navigator.pushReplacementNamed(
        context, StringConst.HOME_PAGE); // هدایت به صفحه‌ی اصلی
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    _audioPlayer.dispose(); // آزاد کردن منابع
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isAnimationOver
        ? Container() // نمایش صفحه خالی بعد از انیمیشن
        : Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                // عقربه ساعت
                Align(
                  alignment: Alignment.center,
                  child: CustomPaint(
                    painter: ClockPainter(_seconds),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // متن انیمیشن اصلی (بالایی)
                Align(
                  alignment: Alignment.center,
                  child: AnimatedBuilder(
                    animation: textAnimation,
                    builder: (context, child) {
                      final textProgress = (textAnimation.value *
                              StringConst.COMPANY_NAME_FA.length)
                          .toInt();
                      return Text(
                        StringConst.COMPANY_NAME_FA.substring(0, textProgress),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
                SizedBox(height: 50),

                // متن انیمیشن جدید (پایینی)
                Align(
                  alignment: Alignment.center,
                  child: AnimatedBuilder(
                    animation: textAnimation,
                    builder: (context, child) {
                      final textProgress = (textAnimation.value *
                              StringConst.COMPANY_NAME_EN.length)
                          .toInt();
                      return Text(
                        StringConst.COMPANY_NAME_EN.substring(0, textProgress),
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.background,
                        ),
                        textAlign: TextAlign.left,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}

class ClockPainter extends CustomPainter {
  final int seconds;

  ClockPainter(this.seconds);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 50, paint);

    final handLength = 40.0;
    final angle = (seconds % 60) * 6 * pi / 180;
    final handX = center.dx + handLength * sin(angle);
    final handY = center.dy - handLength * cos(angle);

    canvas.drawLine(center, Offset(handX, handY), paint..strokeWidth = 2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
