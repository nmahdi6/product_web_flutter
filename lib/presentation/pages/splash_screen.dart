import 'dart:math';
import 'dart:async';
import 'package:aerium/presentation/pages/home/home_page.dart';
import 'package:aerium/infrastructure/music_bloc/music_bloc.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
  static const String splashPageRoute = StringConst.SPLASH_PAGE;
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _textAnimationController;
  late Animation<double> textAnimation;
  int _seconds = 0;
  // bool _isAnimationOver = false;

  @override
  void initState() {
    // تنظیم انیمیشن متن
    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    textAnimation =
        Tween<double>(begin: 0, end: 1).animate(_textAnimationController);
    _textAnimationController.forward();

    // پخش موزیک اول با استفاده از Bloc
    final musicBloc = BlocProvider.of<MusicBloc>(context, listen: false);
    musicBloc.add(PlayMusicEvent(StringConst.first_music));

    // شروع تایمر 6 ثانیه‌ای
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
      if (_seconds == 6) {
        timer.cancel();
        // _navigateToHome();
      }
    });
    super.initState();
  }

  // void _navigateToHome() async {
  //   final musicBloc = BlocProvider.of<MusicBloc>(context, listen: true);
  //   // musicBloc.add(StopMusicEvent()); // توقف موزیک اول
  //   musicBloc.add(PlayMusicEvent(StringConst.first_music));
  //   Navigator.pushReplacementNamed(context, StringConst.HOME_PAGE);
  // }

  @override
  void dispose() {
    _textAnimationController.dispose();
    super.dispose();
  }

  Future<String?> getLastVisitedPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastVisitedPage');
  }

  @override
  Widget build(BuildContext context) {
    if (_seconds == 6) {
      // _navigateToHome();

      final musicBloc = BlocProvider.of<MusicBloc>(context, listen: true);
      musicBloc.add(PlayMusicEvent(StringConst.secound_music));

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        String? lastPage = await getLastVisitedPage();
        if (lastPage != null) {
          Navigator.pushReplacementNamed(context, lastPage);
        } else {
          Navigator.pushReplacementNamed(context, HomePage.homePageRoute);
        }
      });
    }

    return BlocProvider(
      create: (context) => MusicBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                  final textProgress =
                      (textAnimation.value * StringConst.COMPANY_NAME_FA.length)
                          .toInt();
                  return Text(
                    StringConst.COMPANY_NAME_FA.substring(0, textProgress),
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
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
                  final textProgress =
                      (textAnimation.value * StringConst.COMPANY_NAME_EN.length)
                          .toInt();
                  return Text(
                    StringConst.COMPANY_NAME_EN.substring(0, textProgress),
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.background,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  );
                },
              ),
            ),
          ],
        ),
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
      ..color = Colors.black
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    // رسم دایره ساعت
    canvas.drawCircle(center, radius, paint);

    // رسم نشان‌گرهای ساعت
    for (var i = 0; i < 12; i++) {
      final angle = pi / 6 * i;
      final start = Offset(
        center.dx + (radius - 10) * cos(angle),
        center.dy + (radius - 10) * sin(angle),
      );
      final end = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      canvas.drawLine(start, end, paint..strokeWidth = 2);
    }

    // رسم عقربه ثانیه
    final secondAngle = (seconds % 60) * 6 * pi / 180;
    final secondX = center.dx + (radius - 10) * sin(secondAngle);
    final secondY = center.dy - (radius - 10) * cos(secondAngle);
    canvas.drawLine(
      center,
      Offset(secondX, secondY),
      paint
        ..color = Colors.red
        ..strokeWidth = 2.5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
