import 'dart:math';
import 'dart:async';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class LoadingHomePageAnimation extends StatefulWidget {
  static const String loadingPageRoute = StringConst.LOADING_PAGE;

  LoadingHomePageAnimation({
    Key? key,
    required this.text,
    required this.text_2,
    required this.style,
    required this.onLoadingDone,
  }) : super(key: key);

  final String text;
  final String text_2;
  final TextStyle? style;
  final VoidCallback onLoadingDone;

  @override
  _LoadingHomePageAnimationState createState() =>
      _LoadingHomePageAnimationState();
}

class _LoadingHomePageAnimationState extends State<LoadingHomePageAnimation>
    with TickerProviderStateMixin {
  late AnimationController _textAnimationController;
  late Animation<double> textAnimation;
  int _seconds = 0;
  bool _isAnimationOver = false;

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

    // شروع تایمر 6 ثانیه‌ای
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
      if (_seconds == 6) {
        timer.cancel();
        widget.onLoadingDone();
        setState(() {
          _isAnimationOver = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
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
                      final textProgress =
                          (textAnimation.value * widget.text.length).toInt();
                      return Text(
                        widget.text.substring(0, textProgress),
                        style: widget.style,
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
                          (textAnimation.value * widget.text_2.length).toInt();
                      return Text(
                        widget.text_2.substring(0, textProgress),
                        style: widget.style?.copyWith(
                            fontSize: 16, // سایز متن
                            color: AppColors.background // رنگ متن
                            ),
                        textAlign: TextAlign.left, // متن از چپ به راست
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
