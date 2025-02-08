import 'package:aerium/main.dart';
import 'package:aerium/presentation/pages/about/about_page.dart';
import 'package:aerium/presentation/pages/contact_page.dart';
import 'package:aerium/presentation/pages/project_detail/project_detail_page.dart';
import 'package:aerium/presentation/pages/products/products_page.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:aerium/presentation/pages/home/home_page.dart';
import 'package:just_audio/just_audio.dart';
import 'package:aerium/presentation/pages/splash_screen.dart'; // اضافه کردن اسپلش اسکرین

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

class Path {
  const Path(this.pattern, this.builder);

  final String pattern;
  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  static List<Path> paths = [
    Path(
      r'^' + ContactPage.contactPageRoute,
      (context, matches) {
        AudioPlayer audioPlayer = AudioPlayer();
        MusicController musicController = MusicController(audioPlayer);
        return ContactPage(musicController: musicController);
      },
      // (context, matches) => const ContactPage(),
    ),
    Path(
      r'^' + AboutPage.aboutPageRoute,
      (context, matches) {
        AudioPlayer audioPlayer = AudioPlayer();
        MusicController musicController = MusicController(audioPlayer);
        return AboutPage(musicController: musicController);
      },
      // (context, matches) => const AboutPage(),
    ),
    Path(
      r'^' + ProductsPage.productsPageRoute,
      (context, matches) {
        AudioPlayer audioPlayer = AudioPlayer();
        MusicController musicController = MusicController(audioPlayer);
        return ProductsPage(musicController: musicController);
      },
      // (context, matches) => const ProductsPage(),
    ),
    Path(
      r'^' + ProjectDetailPage.projectDetailPageRoute,
      (context, matches) {
        AudioPlayer audioPlayer = AudioPlayer();
        MusicController musicController = MusicController(audioPlayer);
        return ProjectDetailPage(musicController: musicController);
      },
      // (context, matches) => const ProjectDetailPage(),
    ),
    // Path(
    //   r'^' + ExperiencePage.experiencePageRoute,
    //   (context, matches) => const ExperiencePage(),
    // ),
    // Path(
    //   r'^' + CertificationPage.certificationPageRoute,
    //   (context, matches) => const CertificationPage(),
    // ),
    Path(
      r'^' + HomePage.homePageRoute,
      (context, matches) {
        AudioPlayer audioPlayer = AudioPlayer();
        MusicController musicController = MusicController(audioPlayer);
        return HomePage(musicController: musicController);
      },
    ),
    Path(
      r'^/$',
      (context, matches) {
        AudioPlayer audioPlayer = AudioPlayer();
        MusicController musicController = MusicController(audioPlayer);
        return HomePage(musicController: musicController);
      },
    ),
    Path(
      r'^' + HomePage.homePageRoute,
      (context, matches) {
        AudioPlayer audioPlayer = AudioPlayer();
        MusicController musicController = MusicController(audioPlayer);
        return HomePage(musicController: musicController);
      },
    ),
    Path(
      r'^/$',
      (context, matches) {
        AudioPlayer audioPlayer = AudioPlayer();
        MusicController musicController = MusicController(audioPlayer);
        return HomePage(musicController: musicController);
      },
    ),
    Path(
      r'^' + StringConst.SPLASH_PAGE,
      (context, matches) => SplashScreen(),
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
    return null;
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
