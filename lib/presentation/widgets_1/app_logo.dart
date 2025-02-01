import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
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
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 50,
      child: Row(
        children: [
          // Icon(Icons.person),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                width: 65,
                height: 65,
                child:
                    Image(image: AssetImage('assets/images/shams_logo.png'))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Text(
              title,
              style: titleStyle ??
                  textTheme.displayMedium?.copyWith(
                      color: AppColors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}
