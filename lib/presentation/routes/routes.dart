import 'package:aerium/presentation/pages/contact_page.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:aerium/presentation/pages/home/home_page.dart';
import 'package:aerium/presentation/pages/about/about_page.dart';
import 'package:aerium/presentation/pages/products/products_page.dart';
import 'package:aerium/presentation/pages/splash_screen.dart';

class RouteConfiguration {
  static List<Path> paths = [
    Path(
      r'^' + HomePage.homePageRoute,
      (context, matches) => HomePage(),
    ),
    Path(
      r'^' + AboutPage.aboutPageRoute,
      (context, matches) => AboutPage(),
    ),
    Path(
      r'^' + ContactPage.contactPageRoute,
      (context, matches) => ContactPage(),
    ),
    Path(
      r'^' + ProductsPage.productsPageRoute,
      (context, matches) => ProductsPage(),
    ),
    Path(
      r'^' + SplashScreen.splashPageRoute,
      (context, matches) => SplashScreen(),
    ),
    Path(
      r'^/$',
      (context, matches) => HomePage(),
    ),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final firstMatch = regExpPattern.firstMatch(settings.name!)!;
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }

    // اگر مسیر یافت نشد، کاربر را به صفحه اصلی هدایت کنید
    return MaterialPageRoute<void>(
      builder: (context) => HomePage(), // یا یک صفحه ۴۰۴ سفارشی
    );
  }
}

class Path {
  const Path(this.pattern, this.builder);

  final String pattern;
  final PathWidgetBuilder builder;
}

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);
