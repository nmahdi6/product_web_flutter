// import 'package:aerium/core/layout/adaptive.dart';
// import 'package:aerium/presentation/widgets_1/animated_text_slide_box_transition.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';

// const kDuration = Duration(milliseconds: 600);

// class HomePageHeader extends StatefulWidget {
//   const HomePageHeader({
//     Key? key,
//     required this.scrollToWorksKey,
//     required this.controller,
//   }) : super(key: key);

//   final GlobalKey scrollToWorksKey;
//   final AnimationController controller;
//   @override
//   _HomePageHeaderState createState() => _HomePageHeaderState();
// }

// class _HomePageHeaderState extends State<HomePageHeader>
//     with TickerProviderStateMixin {
//   late AnimationController controller;
//   late AnimationController rotationController;
//   late AnimationController scrollDownButtonController;
//   late Animation<Offset> animation;
//   late Animation<Offset> scrollDownBtnAnimation;

//   @override
//   void initState() {
//     scrollDownButtonController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 300),
//     );
//     rotationController = AnimationController(
//       duration: const Duration(seconds: 20),
//       vsync: this,
//     )..repeat();
//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1500),
//     )..repeat();
//     animation = Tween<Offset>(
//       begin: Offset(0, 0.05),
//       end: Offset(0, -0.05),
//     ).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: Curves.easeInOut,
//       ),
//     );
//     controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         controller.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         controller.forward();
//       }
//     });
//     rotationController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         rotationController.reset();
//         rotationController.forward();
//         // rotationController.reverse();
//       }
//     });
//     controller.forward();
//     rotationController.forward();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     scrollDownButtonController.dispose();
//     rotationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = widthOfScreen(context);
//     final double screenHeight = heightOfScreen(context);

//     final myItems_mobile = [
//       Image.asset('assets/images/products/چای لیل (2).webp'),
//       Image.asset('assets/images/products/برنج دمسیاه (3).jpg'),
//       Image.asset('assets/images/products/کیک اویدو (1).jpg'),
//       Image.asset('assets/images/products/خرمای کبکاب (1).jpg'),
//     ];

//     return Container(
//       width: screenWidth,
//       height: screenHeight,
//       decoration: BoxDecoration(
//         // borderRadius: BorderRadius.circular(100),
//         // color: const Color.fromARGB(213, 238, 239, 247).withOpacity(0.35),
//         color: AppColors.black,
//       ),
//       child: Stack(
//         children: [
//           ResponsiveBuilder(builder: (context, sizingInformation) {
//             double screenWidth = sizingInformation.screenSize.width;

//             TextTheme textTheme = Theme.of(context).textTheme;
//             double headerFontSize =
//                 responsiveSize(context, 23, 38, md: 21, sm: 17);
//             if (screenWidth < RefinedBreakpoints().tabletNormal) {
//               return Column(
//                 children: [
//                   SizedBox(
//                     height: 300,
//                   ),

//                   // CustomHeader(),

//                   Center(
//                     child: Container(
//                       child: AnimatedTextSlideBoxTransition(
//                         controller: widget.controller,
//                         text: StringConst.DEV_INTRO,
//                         width: screenWidth,
//                         maxLines: 3,
//                         textStyle: textTheme.displayMedium?.copyWith(
//                           color: AppColors.white,
//                           fontSize: headerFontSize,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             } else {
//               return Positioned(
//                 child: Column(
//                   children: [
//                     CustomHeader(),
//                     SizedBox(
//                       height: assignHeight(context, 0.02),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 40, vertical: 5),
//                       // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//                       // child: Align(
//                       //   alignment: Alignment.topRight,
//                       //   child: Text(
//                       //     StringConst.HOME_MAIN_TEXT,
//                       //     style: textTheme.displayMedium?.copyWith(
//                       //       color: AppColors.black,
//                       //       fontSize: headerFontSize,
//                       //     ),
//                       //   ),

//                       child: AnimatedTextSlideBoxTransition(
//                         controller: widget.controller,
//                         text: StringConst.HOME_MAIN_TEXT,
//                         maxLines: 15,
//                         textStyle: textTheme.displayMedium?.copyWith(
//                           color: AppColors.white,
//                           height: 1.7,
//                           fontSize: headerFontSize,
//                         ),
//                       ),
//                     ),
//                     // ),
//                     SizedBox(
//                       height: assignHeight(context, 0.02),
//                     ),
//                   ],
//                 ),
//               );
//             }
//           }),
//         ],
//       ),
//     );
//   }
// }

// class LogoInBackground extends StatelessWidget {
//   const LogoInBackground({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final widthOfCircle = responsiveSize(
//       context,
//       widthOfScreen(context) / 2.6,
//       widthOfScreen(context) / 3.6,
//     );
//     return Container(
//       width: widthOfCircle,
//       height: widthOfCircle,
//       decoration: BoxDecoration(
//         // color: AppColors.white,
//         borderRadius: BorderRadius.all(
//           Radius.circular(widthOfCircle / 2),
//         ),
//       ),
//       child: Opacity(
//           opacity: 0.1,
//           child: Image(image: AssetImage('assets/images/shams_logo.png'))),
//     );
//   }
// }

// class AboutDev extends StatefulWidget {
//   const AboutDev({
//     Key? key,
//     required this.controller,
//     required this.width,
//   }) : super(key: key);

//   final AnimationController controller;
//   final double width;

//   @override
//   _AboutDevState createState() => _AboutDevState();
// }

// class _AboutDevState extends State<AboutDev> {
//   @override
//   Widget build(BuildContext context) {
//     TextTheme textTheme = Theme.of(context).textTheme;
//     double headerFontSize = responsiveSize(context, 28, 48, md: 25, sm: 20);
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // SpaceH8(),
//           Center(
//             child: Container(
//               child: AnimatedTextSlideBoxTransition(
//                 controller: widget.controller,
//                 text: StringConst.DEV_INTRO,
//                 width: widget.width,
//                 maxLines: 3,
//                 textStyle: textTheme.displayMedium?.copyWith(
//                   color: AppColors.black,
//                   fontSize: headerFontSize,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomHeader extends StatelessWidget {
//   const CustomHeader({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 100),
//             child: Column(
//               children: [
//                 Text(
//                   StringConst.APP_NAME,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white, // رنگ متن
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   'با ما تفاوت را احساس کنید',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'IranSans', // اضافه کردن فونت دلخواه
//                     fontSize: 28, // اندازه فونت
//                     fontWeight: FontWeight.bold, // ضخامت فونت
//                     color: const Color.fromARGB(
//                         255, 255, 254, 208), // رنگ اصلی متن
//                     shadows: [
//                       Shadow(
//                         color: Colors.orangeAccent
//                             .withOpacity(0.8), // سایه نارنجی روشن
//                         blurRadius: 10, // محو بودن سایه
//                         offset: Offset(0, 3), // مکان سایه
//                       ),
//                       Shadow(
//                         color: Colors.black.withOpacity(0.4), // سایه تیره‌تر
//                         blurRadius: 15, // محو بودن سایه
//                         offset: Offset(0, 5), // مکان سایه
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 100),
//             child: Container(
//                 width: assignWidth(context, 0.15),
//                 height: assignWidth(context, 0.15),
//                 child:
//                     Image(image: AssetImage('assets/images/shams_logo.png'))),
//           ),
//         ],
//       ),
//     ]);
//   }
// }

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final shadowPaint = Paint()
      ..color = AppColors.background.withOpacity(0.2) // رنگ سایه
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, 10); // افکت بلور برای سایه

    final shadowPath = Path();
    shadowPath.lineTo(0, size.height * 0.7); // خط پایین سمت چپ
    shadowPath.quadraticBezierTo(
      size.width / 2, size.height, // نقطه کنترل
      size.width, size.height * .7, // انتهای منحنی
    );
    shadowPath.lineTo(size.width, 0); // خط بالای سمت راست
    shadowPath.close();

    // رسم سایه
    canvas.drawPath(shadowPath, shadowPaint);

    final paint = Paint()
      ..color = AppColors.background
      ..style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.7); // خط پایین سمت چپ
    path.quadraticBezierTo(
      size.width / 2, size.height, // نقطه کنترل
      size.width, size.height * 0.7, // انتهای منحنی
    );
    path.lineTo(size.width, 0); // خط بالای سمت راست
    path.close();

    // رسم مسیر اصلی
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// class CustomTextWithStyle extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.purple[900], // رنگ پس‌زمینه
//             borderRadius: BorderRadius.circular(10), // گوشه‌های گرد
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.3), // رنگ سایه
//                 blurRadius: 10, // میزان بلور
//                 offset: Offset(0, 5), // جابجایی سایه
//               ),
//             ],
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'SHAMS',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.yellow, // رنگ متن
//                   shadows: [
//                     Shadow(
//                       color: Colors.black.withOpacity(0.5),
//                       blurRadius: 5,
//                       offset: Offset(2, 2),
//                     ),
//                   ],
//                 ),
//               ),
//               Text(
//                 'URUM AZARAN',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.greenAccent,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'با ما تفاوت را احساس کنید',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white, // رنگ متن
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
