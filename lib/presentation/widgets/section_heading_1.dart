import 'package:flutter/material.dart';
import 'package:aerium/values/values.dart';

class SectionHeading1 extends StatelessWidget {
  SectionHeading1({
    required this.title,
    this.titleTextStyle,
    this.padding = const EdgeInsets.only(right: Sizes.PADDING_16),
  });

  final String title;
  final TextStyle? titleTextStyle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: padding,
      child: Text(
        title,
        style: titleTextStyle ?? theme.textTheme.headlineLarge,
      ),
    );
  }
}
