// import 'dart:async';
// import 'dart:math';
// import 'package:aerium/values/values.dart';
// import 'package:flutter/material.dart';
// import 'package:aerium/presentation/pages/home/home_page.dart';

// class SplashScreen extends StatefulWidget {
//   static const String splashScreenRoute = StringConst.LOADING_PAGE;

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   int _seconds = 0;

//   @override
//   void initState() {
//     super.initState();

//     // Animation Controller
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 10),
//     );

//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

//     // Start Animation
//     _controller.forward();

//     // Update seconds counter every second
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _seconds++;
//       });
//       if (_seconds == 10) {
//         timer.cancel();

//         // انتقال به صفحه اصلی
//         Navigator.of(context).pushReplacementNamed(HomePage.homePageRoute);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blueAccent, Colors.lightBlue],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Stack(
//           children: [
//             Center(
//               child: CustomPaint(
//                 painter: ClockPainter(_seconds),
//                 child: Container(),
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: AnimatedBuilder(
//                 animation: _animation,
//                 builder: (context, child) {
//                   final textProgress = (_animation.value * 35).toInt();
//                   return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.cloud, size: 100, color: Colors.white),
//                       const SizedBox(height: 20),
//                       Text(
//                         "شرکت بنیان سازان مهدی نوری".substring(
//                             0, (textProgress < 35) ? textProgress : 35),
//                         textDirection: TextDirection.rtl,
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ClockPainter extends CustomPainter {
//   final int seconds;

//   ClockPainter(this.seconds);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.white
//       ..strokeWidth = 4
//       ..style = PaintingStyle.stroke;

//     // Draw Clock Circle
//     final center = Offset(size.width / 2, size.height / 2);
//     canvas.drawCircle(center, 50, paint);

//     // Draw Clock Hands
//     final handLength = 40.0;
//     final angle = (seconds % 60) * 6 * pi / 180; // زاویه به رادیان
//     final handX = center.dx + handLength * sin(angle); // استفاده مستقیم از sin
//     final handY = center.dy - handLength * cos(angle); // استفاده مستقیم از cos

//     canvas.drawLine(
//       center,
//       Offset(handX, handY),
//       paint..strokeWidth = 2,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

// // import 'dart:async';
// // import 'dart:math';
// // import 'package:aerium/presentation/screens/home_screen.dart';
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: SplashScreen(),
// //     );
// //   }
// // }

// // class SplashScreen extends StatefulWidget {
// //   @override
// //   _SplashScreenState createState() => _SplashScreenState();
// // }

// // class _SplashScreenState extends State<SplashScreen>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<double> _animation;
// //   int _seconds = 0;

// //   @override
// //   void initState() {
// //     super.initState();

// //     // Animation Controller
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: const Duration(seconds: 10),
// //     );

// //     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

// //     // Start Animation
// //     _controller.forward();

// //     // Update seconds counter every second
// //     Timer.periodic(const Duration(seconds: 1), (timer) {
// //       setState(() {
// //         _seconds++;
// //       });
// //       if (_seconds == 10) {
// //         timer.cancel();

// //         // انتقال به صفحه دیگر
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (context) => HomeScreen()),
// //         );
// //       }
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Stack(
// //         children: [
// //           Center(
// //             child: CustomPaint(
// //               painter: ClockPainter(_seconds),
// //               child: Container(),
// //             ),
// //           ),
// //           Align(
// //             alignment: Alignment.center,
// //             child: AnimatedBuilder(
// //               animation: _animation,
// //               builder: (context, child) {
// //                 final textProgress = (_animation.value * 35).toInt();
// //                 return Text(
// //                   "شرکت بنیان سازان مهدی نوری"
// //                       .substring(0, (textProgress < 35) ? textProgress : 35),
// //                   textDirection: TextDirection.rtl,
// //                   style: const TextStyle(
// //                     fontSize: 24,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.black,
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class ClockPainter extends CustomPainter {
// //   final int seconds;

// //   ClockPainter(this.seconds);

// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final Paint paint = Paint()
// //       ..color = Colors.black
// //       ..strokeWidth = 4
// //       ..style = PaintingStyle.stroke;

// //     // Draw Clock Circle
// //     final center = Offset(size.width / 2, size.height / 2);
// //     canvas.drawCircle(center, 50, paint);

// //     // Draw Clock Hands
// //     final handLength = 40.0;
// //     final angle = (seconds % 60) * 6 * pi / 180; // زاویه به رادیان
// //     final handX = center.dx + handLength * sin(angle); // استفاده مستقیم از sin
// //     final handY = center.dy - handLength * cos(angle); // استفاده مستقیم از cos

// //     canvas.drawLine(
// //       center,
// //       Offset(handX, handY),
// //       paint..strokeWidth = 2,
// //     );
// //   }

// //   @override
// //   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// // }

// // // import 'package:auto_route/auto_route.dart';
// // // import 'package:aerium/presentation/routes/router.gr.dart';
// // // import 'package:aerium/presentation/widgets/drop_logo.dart';
// // // import 'package:aerium/values/values.dart';
// // // import 'package:flutter/material.dart';

// // // class SplashScreen extends StatefulWidget {
// // //   @override
// // //   _SplashScreenState createState() => _SplashScreenState();
// // // }

// // // class _SplashScreenState extends State<SplashScreen> {
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     run();
// // //   }

// // //   void run() {
// // //     Future.delayed(Duration(milliseconds: 1000), () {
// // //       AutoRouter.of(context).push(
// // //         // AuthScreenRoute(),
// // //       );
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Container(
// // //           child: Center(
// // //         child: DropLogo(
// // //           width: 200,
// // //           height: 200,
// // //           borderRadius: BorderRadius.only(
// // //             topLeft: Radius.circular(Sizes.RADIUS_20),
// // //             bottomLeft: Radius.circular(Sizes.RADIUS_20),
// // //             bottomRight: Radius.circular(Sizes.RADIUS_100),
// // //             topRight: Radius.circular(Sizes.RADIUS_100),
// // //           ),
// // //         ),
// // //       )),
// // //     );
// // //   }
// // // }
