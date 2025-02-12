import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets_1/animated_positioned_text.dart';
import 'package:aerium/presentation/widgets_1/animated_positioned_widget.dart';
import 'package:aerium/presentation/widgets_1/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
    double circleImageSize = responsiveSize(context, 70, 120, sm: 70);
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    // تشخیص دستگاه موبایل
    bool isMobile = size.width < 600;

    // تنظیم سایز آیکون‌ها و فاصله‌ها بر اساس موبایل
    double iconSize = isMobile ? 12 : 16;
    double spaceBetweenIconAndText = isMobile ? 4 : 8;

    TextStyle? titleStyle = textTheme.headlineMedium?.copyWith(
      color: AppColors.accentColor,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_24,
        md: Sizes.TEXT_SIZE_20,
        sm: Sizes.TEXT_SIZE_14,
      ),
    );

    TextStyle? subtitleStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.grey550,
      fontSize: responsiveSize(context, Sizes.TEXT_SIZE_12, Sizes.TEXT_SIZE_16,
          sm: Sizes.TEXT_SIZE_10),
      fontWeight: FontWeight.w400,
    );

    return Container(
      width: widget.width ?? widthOfScreen(context),
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
            Container(
              child: Stack(
                children: [
                  Positioned(
                    right: responsiveSize(
                      context,
                      assignWidth(context, isMobile ? 0.03 : 0.16),
                      assignWidth(context, isMobile ? 0.05 : 0.26),
                      md: assignWidth(context, isMobile ? 0.03 : 0.20),
                      sm: assignWidth(context, isMobile ? 0.009 : 0.1),
                    ),
                    top: responsiveSize(
                      context,
                      assignHeight(context, isMobile ? 0.015 : 0.001),
                      assignHeight(context, isMobile ? 0.015 : 0.001),
                    ),
                    child: AnimatedPositionedWidget(
                      controller: CurvedAnimation(
                        parent: controller,
                        curve: Curves.fastOutSlowIn,
                      ),
                      width: circleImageSize,
                      height: circleImageSize,
                      child: Image.asset(
                        ImagePath.shams_logo,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SpaceH20(),
                        AnimatedPositionedText(
                          text: StringConst.WORK_TOGETHER_P1,
                          factor: 1.5,
                          textAlign: TextAlign.center,
                          textStyle: titleStyle,
                          controller: CurvedAnimation(
                            parent: controller,
                            curve: Curves.fastOutSlowIn,
                          ),
                        ),
                        AnimatedPositionedText(
                          text: StringConst.WORK_TOGETHER_P2,
                          factor: 1.5,
                          textAlign: TextAlign.center,
                          textStyle: titleStyle,
                          controller: CurvedAnimation(
                            parent: controller,
                            curve: Curves.fastOutSlowIn,
                          ),
                        ),
                        SpaceH20(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'تماس با ما:',
                  style: subtitleStyle?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: responsiveSize(
                        context, Sizes.TEXT_SIZE_16, Sizes.TEXT_SIZE_18,
                        sm: Sizes.TEXT_SIZE_14),
                  ),
                ),
                SpaceH8(),
                Container(
                  width: size.width,
                  color: AppColors.appBackgroundColor,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: responsiveSize(context, size.width * 0.9, 800,
                          sm: size.width * 0.95),
                      child: Column(
                        children: [
                          SpaceH8(),
                          AnimatedPositionedText(
                            text: StringConst.TELFEX_FOOTER,
                            icon: Icon(Icons.phone,
                                size: iconSize, color: AppColors.white),
                            textAlign: TextAlign.start,
                            textStyle: subtitleStyle?.copyWith(
                                color: AppColors.appBackgroundColorOpposite),
                            factor: 1.5,
                            spaceBetweenIconAndText: spaceBetweenIconAndText,
                            controller: CurvedAnimation(
                              parent: controller,
                              curve: Curves.fastOutSlowIn,
                            ),
                          ),
                          SpaceH8(),
                          AnimatedPositionedText(
                            text: StringConst.PHONE_NUMBER_FOOTER,
                            textAlign: TextAlign.start,
                            textStyle: subtitleStyle?.copyWith(
                                color: AppColors.appBackgroundColorOpposite),
                            factor: 1.5,
                            icon: Center(
                              child: FaIcon(FontAwesomeIcons.whatsapp,
                                  size: iconSize, color: AppColors.white),
                            ),
                            spaceBetweenIconAndText: spaceBetweenIconAndText,
                            controller: CurvedAnimation(
                              parent: controller,
                              curve: Curves.fastOutSlowIn,
                            ),
                          ),
                          SpaceH8(),
                          AnimatedPositionedText(
                            text: StringConst.EMAIL_FOOTER,
                            textAlign: TextAlign.start,
                            textStyle: subtitleStyle?.copyWith(
                                color: AppColors.appBackgroundColorOpposite),
                            factor: 1.5,
                            icon: Icon(Icons.email,
                                size: iconSize, color: AppColors.white),
                            spaceBetweenIconAndText: spaceBetweenIconAndText,
                            controller: CurvedAnimation(
                              parent: controller,
                              curve: Curves.fastOutSlowIn,
                            ),
                          ),
                          SpaceH8(),
                          AnimatedPositionedText(
                            text: StringConst.EMAIL_SUPPORT_FOOTER,
                            textAlign: TextAlign.start,
                            textStyle: subtitleStyle?.copyWith(
                                color: AppColors.appBackgroundColorOpposite),
                            factor: 1.5,
                            icon: Icon(Icons.email,
                                size: iconSize, color: AppColors.white),
                            spaceBetweenIconAndText: spaceBetweenIconAndText,
                            controller: CurvedAnimation(
                              parent: controller,
                              curve: Curves.fastOutSlowIn,
                            ),
                          ),
                          SpaceH8(),
                          AnimatedPositionedText(
                            text: StringConst.WEBSITE_FOOTER,
                            textAlign: TextAlign.start,
                            textStyle: subtitleStyle?.copyWith(
                                color: AppColors.appBackgroundColorOpposite),
                            factor: 1.2,
                            icon: Icon(Icons.web,
                                size: iconSize, color: AppColors.white),
                            spaceBetweenIconAndText: spaceBetweenIconAndText,
                            controller: CurvedAnimation(
                              parent: controller,
                              curve: Curves.fastOutSlowIn,
                            ),
                          ),
                          SpaceH8(),
                          AnimatedPositionedText(
                            text: StringConst.ADDRESS,
                            textAlign: TextAlign.start,
                            maxLines: 3, // تنظیم maxLines برای آدرس
                            // overflow: TextOverflow.ellipsis, // نمایش سه نقطه در صورت نیاز
                            icon: Icon(Icons.location_on,
                                size: iconSize, color: AppColors.white),
                            textStyle: subtitleStyle?.copyWith(
                                color: AppColors.appBackgroundColorOpposite,
                                fontSize:
                                    responsiveSize(context, 14, 15, sm: 12)),
                            factor: 2,
                            spaceBetweenIconAndText: spaceBetweenIconAndText,
                            controller: CurvedAnimation(
                              parent: controller,
                              curve: Curves.fastOutSlowIn,
                            ),
                          ),
                          SpaceH8(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:aerium/core/layout/adaptive.dart';
// import 'package:aerium/presentation/widgets_1/animated_positioned_text.dart';
// import 'package:aerium/presentation/widgets_1/animated_positioned_widget.dart';
// import 'package:aerium/presentation/widgets_1/spaces.dart';
// import 'package:aerium/values/values.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:visibility_detector/visibility_detector.dart';

// class AnimatedFooter extends StatefulWidget {
//   const AnimatedFooter({
//     Key? key,
//     this.height,
//     this.width,
//     this.backgroundColor = AppColors.background,
//   }) : super(key: key);

//   final double? width;
//   final double? height;
//   final Color backgroundColor;

//   @override
//   _AnimatedFooterState createState() => _AnimatedFooterState();
// }

// class _AnimatedFooterState extends State<AnimatedFooter>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;

//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double circleImageSize = responsiveSize(context, 100, 150);
//     TextTheme textTheme = Theme.of(context).textTheme;
//     Size size = MediaQuery.of(context).size;
//     TextStyle? style = textTheme.bodyLarge?.copyWith(
//       color: AppColors.accentColor,
//       fontSize: Sizes.TEXT_SIZE_14,
//     );
//     TextStyle? titleStyle = textTheme.headlineMedium?.copyWith(
//       color: AppColors.accentColor,
//       fontSize: responsiveSize(
//         context,
//         Sizes.TEXT_SIZE_30,
//         Sizes.TEXT_SIZE_60,
//         md: Sizes.TEXT_SIZE_50,
//       ),
//     );
//     TextStyle? subtitleStyle = style?.copyWith(
//       color: AppColors.grey550,
//       fontSize: Sizes.TEXT_SIZE_18,
//       fontWeight: FontWeight.w400,
//     );

//     return Container(
//       width: widget.width ?? widthOfScreen(context),
//       // height: widget.height ?? assignHeight(context, 0.6),
//       color: widget.backgroundColor,
//       child: VisibilityDetector(
//         key: Key('animated-footer'),
//         onVisibilityChanged: (visibilityInfo) {
//           double visiblePercentage = visibilityInfo.visibleFraction * 100;
//           if (visiblePercentage > 25) {
//             controller.forward();
//           }
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Spacer(flex: 1),
//             Container(
//               height: circleImageSize,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     right: responsiveSize(
//                       context,
//                       assignWidth(context, 0.22),
//                       assignWidth(context, 0.32),
//                       md: assignWidth(context, 0.22),
//                     ),
//                     child: AnimatedPositionedWidget(
//                       controller: CurvedAnimation(
//                         parent: controller,
//                         curve: Curves.fastOutSlowIn,
//                       ),
//                       width: circleImageSize,
//                       height: circleImageSize,
//                       child: Image.asset(
//                         ImagePath.shams_logo,
//                         // ImagePath.CIRCLE,
//                         color: AppColors.white,
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AnimatedPositionedText(
//                           text: StringConst.WORK_TOGETHER_P1,
//                           factor: 1.5,

//                           textAlign: TextAlign.center,
//                           // width: MediaQuery.of(context).size.width / 5,
//                           textStyle: titleStyle?.copyWith(fontSize: 18),
//                           controller: CurvedAnimation(
//                             parent: controller,
//                             curve: Curves.fastOutSlowIn,
//                           ),
//                         ),
//                         AnimatedPositionedText(
//                           text: StringConst.WORK_TOGETHER_P2,
//                           factor: 1.5,

//                           textAlign: TextAlign.center,
//                           // width: MediaQuery.of(context).size.width / 5,
//                           textStyle: titleStyle?.copyWith(fontSize: 18),
//                           controller: CurvedAnimation(
//                             parent: controller,
//                             curve: Curves.fastOutSlowIn,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'تماس با ما:',
//                   style: subtitleStyle?.copyWith(
//                     fontWeight: FontWeight.bold,
//                     fontSize: Sizes.TEXT_SIZE_18,
//                   ),
//                 ),
//                 SpaceH8(),
//                 Container(
//                   width: size.width,
//                   color: AppColors.appBackgroundColor,
//                   child: Center(
//                     child: Container(
//                       padding: EdgeInsets.symmetric(),
//                       width: 800,
//                       child: Column(
//                         children: [
//                           // telfex
//                           AnimatedPositionedText(
//                             text: StringConst.TELFEX_FOOTER,
//                             icon: Icon(
//                               Icons.phone,
//                               size: 16,
//                               color: AppColors.white,
//                             ),
//                             textAlign: TextAlign.start,
//                             textStyle: subtitleStyle?.copyWith(
//                                 color: AppColors.appBackgroundColorOpposite),
//                             factor: 1.5,
//                             controller: CurvedAnimation(
//                               parent: controller,
//                               curve: Curves.fastOutSlowIn,
//                             ),
//                           ),
//                           // phone number
//                           AnimatedPositionedText(
//                             text: StringConst.PHONE_NUMBER_FOOTER,
//                             textAlign: TextAlign.start,
//                             textStyle: subtitleStyle?.copyWith(
//                                 color: AppColors.appBackgroundColorOpposite),
//                             factor: 1.5,
//                             icon: Center(
//                               child: FaIcon(
//                                 FontAwesomeIcons.whatsapp,
//                                 size: 16,
//                                 color: AppColors.white,
//                               ),
//                             ),
//                             controller: CurvedAnimation(
//                               parent: controller,
//                               curve: Curves.fastOutSlowIn,
//                             ),
//                           ),
//                           // email
//                           AnimatedPositionedText(
//                             text: StringConst.EMAIL_FOOTER,
//                             textAlign: TextAlign.start,
//                             textStyle: subtitleStyle?.copyWith(
//                                 color: AppColors.appBackgroundColorOpposite),
//                             factor: 1.5,
//                             icon: Icon(
//                               Icons.email,
//                               size: 16,
//                               color: AppColors.white,
//                             ),
//                             controller: CurvedAnimation(
//                               parent: controller,
//                               curve: Curves.fastOutSlowIn,
//                             ),
//                           ),
//                           // email support
//                           AnimatedPositionedText(
//                             text: StringConst.EMAIL_SUPPORT_FOOTER,
//                             textAlign: TextAlign.start,
//                             textStyle: subtitleStyle?.copyWith(
//                                 color: AppColors.appBackgroundColorOpposite),
//                             factor: 1.5,
//                             icon: Icon(
//                               Icons.email,
//                               size: 16,
//                               color: AppColors.white,
//                             ),
//                             controller: CurvedAnimation(
//                               parent: controller,
//                               curve: Curves.fastOutSlowIn,
//                             ),
//                           ),
//                           //website
//                           AnimatedPositionedText(
//                             text: StringConst.WEBSITE_FOOTER,
//                             textAlign: TextAlign.start,
//                             textStyle: subtitleStyle?.copyWith(
//                                 color: AppColors.appBackgroundColorOpposite),
//                             factor: 1.2,
//                             icon: Icon(
//                               Icons.web,
//                               size: 16,
//                               color: AppColors.white,
//                             ),
//                             controller: CurvedAnimation(
//                               parent: controller,
//                               curve: Curves.fastOutSlowIn,
//                             ),
//                           ),

//                           AnimatedPositionedText(
//                             text: StringConst.ADDRESS,
//                             textAlign: TextAlign.center,
//                             maxLines: 3,
//                             icon: Icon(
//                               Icons.location_on,
//                               size: 16,
//                               color: AppColors.white,
//                             ),
//                             textStyle: subtitleStyle?.copyWith(
//                                 color: AppColors.appBackgroundColorOpposite,
//                                 fontSize: 15),
//                             factor: 2,
//                             controller: CurvedAnimation(
//                               parent: controller,
//                               curve: Curves.fastOutSlowIn,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
