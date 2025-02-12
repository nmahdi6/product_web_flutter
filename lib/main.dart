import 'package:aerium/app_theme.dart';
import 'package:aerium/infrastructure/music_bloc/music_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/layout.dart';
import 'package:aerium/values/values.dart';
import 'package:aerium/presentation/routes/routes.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // configureDependencies();
  // configureApp();
  setUrlStrategy(PathUrlStrategy()); // استفاده از PathUrlStrategy

  runApp(
    BlocProvider(
      create: (context) => MusicBloc(),
      child: Aerium(),
    ),
    // ChangeNotifierProvider(
    //   create: (context) => MusicProvider(),
    //   child: Aerium(),
    // ),
  );
}

class Aerium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: StringConst.APP_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}

// import 'package:aerium/app_theme.dart';
// import 'package:aerium/presentation/widgets/music_provider/music_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:layout/layout.dart';
// import 'package:provider/provider.dart';
// import 'package:aerium/values/values.dart';
// import 'package:aerium/presentation/routes/routes.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';
// import 'package:aerium/injection_container.dart'; // اضافه کردن فایل injection_container.dart

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // setup(); // فراخوانی تابع setup برای ثبت وابستگی‌ها

//   setUrlStrategy(PathUrlStrategy()); // استفاده از PathUrlStrategy

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => MusicProvider(),
//         ),
//         // سایر Providerها را اینجا اضافه کنید
//       ],
//       child: Aerium(),
//     ),
//   );
// }

// class Aerium extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Layout(
//       child: MaterialApp(
//         title: StringConst.APP_TITLE,
//         theme: AppTheme.lightThemeData,
//         debugShowCheckedModeBanner: false,
//         initialRoute: '/splash',
//         onGenerateRoute: RouteConfiguration.onGenerateRoute,
//       ),
//     );
//   }
// }
