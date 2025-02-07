import 'package:aerium/main.dart';
import 'package:aerium/presentation/pages/about/about_page.dart';
import 'package:aerium/presentation/pages/certification_page.dart';
import 'package:aerium/presentation/pages/contact_page.dart';
import 'package:aerium/presentation/pages/experience_page.dart';
import 'package:aerium/presentation/pages/privacy_policy_page.dart';
import 'package:aerium/presentation/pages/project_detail/project_detail_page.dart';
import 'package:aerium/presentation/pages/products/products_page.dart';
import 'package:flutter/material.dart';
import 'package:aerium/presentation/pages/home/home_page.dart';
import 'package:just_audio/just_audio.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

class Path {
  const Path(this.pattern, this.builder);

  final String pattern;
  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  static List<Path> paths = [
    Path(
      r'^' + PrivacyPolicyPage.pageRoute,
      (context, matches) => const PrivacyPolicyPage(),
    ),
    Path(
      r'^' + ContactPage.contactPageRoute,
      (context, matches) => const ContactPage(),
    ),
    Path(
      r'^' + AboutPage.aboutPageRoute,
      (context, matches) => const AboutPage(),
    ),
    Path(
      r'^' + ProductsPage.productsPageRoute,
      (context, matches) => const ProductsPage(),
    ),
    Path(
      r'^' + ProjectDetailPage.projectDetailPageRoute,
      (context, matches) => const ProjectDetailPage(),
    ),
    Path(
      r'^' + ExperiencePage.experiencePageRoute,
      (context, matches) => const ExperiencePage(),
    ),
    Path(
      r'^' + CertificationPage.certificationPageRoute,
      (context, matches) => const CertificationPage(),
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

/// The route generator callback used when the app is navigated to a named
/// route. Set it on the [MaterialApp.onGenerateRoute] or
/// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
/// matching.
//  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//    for (final path in paths) {
//      final regExpPattern = RegExp(path.pattern);
//      if (regExpPattern.hasMatch(settings.name)) {
//        final match = regExpPattern.firstMatch(settings.name);
//        var groupNameToMatch = <String, String>{};
//        for (final groupName in match.groupNames) {
//          groupNameToMatch[groupName] = match.namedGroup(groupName);
//        }
//        print(groupNameToMatch);
//        print(path.pattern);
//        if (kIsWeb) {
//          return NoAnimationMaterialPageRoute<void>(
//            builder: (context) => path.builder(context, groupNameToMatch),
//            settings: settings,
//          );
//        }
//
//        return MaterialPageRoute<void>(
//          builder: (context) => path.builder(context, groupNameToMatch),
//          settings: settings,
//        );
//      }
//    }
//    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
//    return null;
//  }
// }

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

// @CupertinoAutoRouter(
//   routes: <AutoRoute>[
//     // initial route is named "/"
//     CupertinoRoute(page: SplashScreen, initial: true),

//     //OnBoarding and AuthenticationScreens
//     CupertinoRoute(page: AuthScreen),
//     CupertinoRoute(page: VerificationScreen),
//     CupertinoRoute(page: InterestScreen),

//     //Inside App
//     CupertinoRoute(page: HomeScreen),
//     CupertinoRoute(page: CategoriesScreen),
//     CupertinoRoute(page: CategoryItemScreen),
//     CupertinoRoute(page: ProductScreen),
//     CupertinoRoute(page: ProfileScreen),
//     CupertinoRoute(page: CheckOutScreen),
//   ],
// )
// class $AppRouter {}
