import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets_1/animated_bubble_button.dart';
import 'package:aerium/presentation/widgets_1/animated_positioned_text.dart';
import 'package:aerium/presentation/widgets_1/animated_positioned_widget.dart';
import 'package:aerium/presentation/widgets_1/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../contact_page.dart';

class AnimatedFooter extends StatefulWidget {
  const AnimatedFooter({
    Key? key,
    this.height,
    this.width,
    this.backgroundColor = AppColors.background,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color backgroundColor;

  @override
  _AnimatedFooterState createState() => _AnimatedFooterState();
}

class _AnimatedFooterState extends State<AnimatedFooter>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double circleImageSize = responsiveSize(context, 100, 150);
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(
      color: AppColors.accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    TextStyle? titleStyle = textTheme.headlineMedium?.copyWith(
      color: AppColors.accentColor,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_30,
        Sizes.TEXT_SIZE_60,
        md: Sizes.TEXT_SIZE_50,
      ),
    );
    TextStyle? subtitleStyle = style?.copyWith(
      color: AppColors.grey550,
      fontSize: Sizes.TEXT_SIZE_18,
      fontWeight: FontWeight.w400,
    );

    return Container(
      width: widget.width ?? widthOfScreen(context),
      height: widget.height ?? assignHeight(context, 0.8),
      color: widget.backgroundColor,
      child: VisibilityDetector(
        key: Key('animated-footer'),
        onVisibilityChanged: (visibilityInfo) {
          double visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage > 25) {
            controller.forward();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Container(
              height: circleImageSize,
              child: Stack(
                children: [
                  Positioned(
                    right: responsiveSize(
                      context,
                      assignWidth(context, 0.22),
                      assignWidth(context, 0.32),
                      md: assignWidth(context, 0.22),
                    ),
                    child: AnimatedPositionedWidget(
                      controller: CurvedAnimation(
                        parent: controller,
                        curve: Curves.fastOutSlowIn,
                      ),
                      width: circleImageSize,
                      height: circleImageSize,
                      child: Image.asset(
                        ImagePath.CIRCLE,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedPositionedText(
                          text: StringConst.WORK_TOGETHER_P1,
                          factor: 1.5,

                          textAlign: TextAlign.center,
                          // width: MediaQuery.of(context).size.width / 5,
                          textStyle: titleStyle?.copyWith(fontSize: 18),
                          controller: CurvedAnimation(
                            parent: controller,
                            curve: Curves.fastOutSlowIn,
                          ),
                        ),
                        AnimatedPositionedText(
                          text: StringConst.WORK_TOGETHER_P2,
                          factor: 1.5,

                          textAlign: TextAlign.center,
                          // width: MediaQuery.of(context).size.width / 5,
                          textStyle: titleStyle?.copyWith(fontSize: 18),
                          controller: CurvedAnimation(
                            parent: controller,
                            curve: Curves.fastOutSlowIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // AnimatedPositionedText(
            //   text: StringConst.AVAILABLE_FOR_FREELANCE,
            //   textAlign: TextAlign.center,
            //   textStyle: subtitleStyle,
            //   factor: 2.0,
            //   controller: CurvedAnimation(
            //     parent: controller,
            //     curve: Curves.fastOutSlowIn,
            //   ),
            // ),
            SpaceW20(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'تماس با ما:',
                  style: subtitleStyle?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.TEXT_SIZE_18,
                  ),
                ),
                SpaceH8(),
                AnimatedPositionedText(
                  text: StringConst.ADDRESS,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  textStyle: subtitleStyle?.copyWith(fontSize: 14),
                  factor: 1.5,
                  controller: CurvedAnimation(
                    parent: controller,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                AnimatedPositionedText(
                  text: StringConst.TELFEX_FOOTER,
                  textAlign: TextAlign.center,
                  textStyle: subtitleStyle,
                  factor: 1.5,
                  controller: CurvedAnimation(
                    parent: controller,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                AnimatedPositionedText(
                  text: StringConst.PHONE_NUMBER_FOOTER,
                  textAlign: TextAlign.center,
                  textStyle: subtitleStyle,
                  factor: 1.5,
                  controller: CurvedAnimation(
                    parent: controller,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                AnimatedPositionedText(
                  text: StringConst.EMAIL_FOOTER,
                  textAlign: TextAlign.center,
                  textStyle: subtitleStyle,
                  factor: 1.5,
                  controller: CurvedAnimation(
                    parent: controller,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                AnimatedPositionedText(
                  text: StringConst.EMAIL_SUPPORT_FOOTER,
                  textAlign: TextAlign.center,
                  textStyle: subtitleStyle,
                  factor: 1.5,
                  controller: CurvedAnimation(
                    parent: controller,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                AnimatedPositionedText(
                  text: StringConst.WEBSITE_FOOTER,
                  textAlign: TextAlign.center,
                  textStyle: subtitleStyle,
                  factor: 1.2,
                  controller: CurvedAnimation(
                    parent: controller,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
              ],
            ),
            SpaceH30(),
            AnimatedBubbleButton(
              title: StringConst.SAY_HELLO.toUpperCase(),
              onTap: () {
                Navigator.pushNamed(context, ContactPage.contactPageRoute);
              },
            ),
            Spacer(flex: 1),
            ResponsiveBuilder(
              builder: (context, sizingInformation) {
                double screenWidth = sizingInformation.screenSize.width;
                if (screenWidth <= RefinedBreakpoints().tabletNormal) {
                  return Column(
                    children: [
                      SimpleFooterSm(),
                      SpaceH8(),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      SimpleFooterLg(),
                      SpaceH8(),
                    ],
                  );
                }
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
