import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({
    Key? key,
    this.title = StringConst.APP_NAME,
    this.titleColor = AppColors.black,
    this.titleStyle,
    this.fontSize = 18,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final double? fontSize;

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 50,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 70,
              height: 70,
              child: AnimatedBuilder(
                animation: _controller,
                child: Image(
                  image: AssetImage(StringConst.shams_logo),
                ),
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(_controller.value * 2 * 3.14159),
                    child: child,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Text(
              widget.title,
              style: widget.titleStyle ??
                  textTheme.displayMedium?.copyWith(
                      color: AppColors.white,
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}
