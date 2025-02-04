import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/pages/widgets/animated_footer.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/pages/widgets/socials.dart';
import 'package:aerium/presentation/widgets_1/animated_line_through_text.dart';
import 'package:aerium/presentation/widgets_1/content_area.dart';
import 'package:aerium/presentation/widgets_1/custom_spacer.dart';
import 'package:aerium/presentation/widgets_1/page_wrapper.dart';
import 'package:aerium/presentation/widgets_1/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  static const String aboutPageRoute = StringConst.ABOUT_PAGE;
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _storyController;
  late AnimationController _technologyController;
  late AnimationController _contactController;
  late AnimationController _technologyListController;
  late AnimationController _quoteController;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _storyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyListController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _contactController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _quoteController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _storyController.dispose();
    _technologyController.dispose();
    _technologyListController.dispose();
    _contactController.dispose();
    _quoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.4),
      assignWidth(context, 0.475),
      sm: assignWidth(context, 0.4),
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.03),
        assignWidth(context, 0.05),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.03),
        assignWidth(context, 0.03),
        // sm: assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
        // sm: assignWidth(context, 0.10),
      ),
    );

    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    TextStyle? bodyText1Style = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );
    TextStyle? bodyText2Style =
        textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
    TextStyle? titleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
      ),
    );
    // CurvedAnimation _storySectionAnimation = CurvedAnimation(
    //   parent: _storyController,
    //   curve: Interval(0.6, 1.0, curve: Curves.ease),
    // );
    // CurvedAnimation _technologySectionAnimation = CurvedAnimation(
    //   parent: _technologyController,
    //   curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    // );
    // double widthOfBody = responsiveSize(
    //   context,
    //   assignWidth(context, 0.75),
    //   assignWidth(context, 0.5),
    // );

    // double headerFontSize = responsiveSize(context, 28, 48, md: 25, sm: 20);
    // AnimationController controller;

    return PageWrapper(
      selectedRoute: AboutPage.aboutPageRoute,
      selectedPageName: '',
      navBarAnimationController: _controller,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: Stack(
        children: [
          // background image
          Container(
            color: AppColors.appBackgroundColor,
            width: size.width,
            height: size.height,
            child: Center(
              child: ClipRRect(
                // borderRadius:
                //     widget.borderRadius,
                child: Image.asset(
                  StringConst.badsaba_light,
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // background about text
          Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                Padding(
                  padding: padding,
                  child: ContentArea(
                    width: contentAreaWidth,
                    child: Column(
                      children: [
                        // Container(
                        //   // margin: margin,
                        //   child: AnimatedTextSlideBoxTransition(
                        //     controller: ,
                        //     text: StringConst.DEV_INTRO,
                        //     // width: widget.width,
                        //     maxLines: 3,
                        //     textStyle: textTheme.displayMedium?.copyWith(
                        //       color: AppColors.black,
                        //       fontSize: headerFontSize,
                        //     ),
                        //   ),
                        // ),
                        // Text(StringConst.ABOUT_COMPANY),

                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20,
                              // horizontal: assignWidth(context, 0.10),
                              horizontal: 50),
                          decoration: BoxDecoration(
                            color:
                                // ignore: deprecated_member_use
                                AppColors.appBackgroundColor.withOpacity(0.9),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.appBackgroundColor
                                    // ignore: deprecated_member_use
                                    .withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            border: Border.all(
                                color: AppColors.appBackgroundColorOpposite,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                StringConst.ABOUT,
                                style: titleStyle?.copyWith(
                                    color: AppColors.appTextColor),
                                textAlign: TextAlign.center,
                              ),
                              SpaceH30(),
                              Text(
                                StringConst.ABOUT_COMPANY,
                                style: bodyText1Style?.copyWith(
                                    color: AppColors.appTextColor),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),

                        // AboutHeader(
                        //   width: contentAreaWidth,
                        //   controller: _controller,
                        // ),
                        // CustomSpacer(heightFactor: 0.1),
                        // VisibilityDetector(
                        //   key: Key('story-section'),
                        //   onVisibilityChanged: (visibilityInfo) {
                        //     double visiblePercentage =
                        //         visibilityInfo.visibleFraction * 100;
                        //     if (visiblePercentage >
                        //         responsiveSize(context, 40, 70, md: 50)) {
                        //       _storyController.forward();
                        //     }
                        //   },
                        //   child: ContentBuilder(
                        //     controller: _storyController,
                        //     number: "/01 ",
                        //     width: contentAreaWidth,
                        //     section: StringConst.ABOUT_DEV_STORY.toUpperCase(),
                        //     title: StringConst.ABOUT_DEV_STORY_TITLE,
                        //     body: Column(
                        //       children: [
                        //         AnimatedPositionedText(
                        //           controller: _storySectionAnimation,
                        //           width: widthOfBody,
                        //           maxLines: 30,
                        //           // factor: 1.25,
                        //           text: StringConst.ABOUT_DEV_STORY_CONTENT_1,
                        //           textStyle: bodyText1Style,
                        //         ),
                        //         AnimatedPositionedText(
                        //           controller: _storySectionAnimation,
                        //           width: widthOfBody,
                        //           maxLines: 30,
                        //           text: StringConst.ABOUT_DEV_STORY_CONTENT_2,
                        //           textStyle: bodyText1Style,
                        //         ),
                        //         AnimatedPositionedText(
                        //           controller: _storySectionAnimation,
                        //           width: widthOfBody,
                        //           maxLines: 30,
                        //           text: StringConst.ABOUT_DEV_STORY_CONTENT_3,
                        //           textStyle: bodyText1Style,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // CustomSpacer(heightFactor: 0.1),
                        // VisibilityDetector(
                        //   key: Key('technology-section'),
                        //   onVisibilityChanged: (visibilityInfo) {
                        //     double visiblePercentage =
                        //         visibilityInfo.visibleFraction * 100;
                        //     if (visiblePercentage > 50) {
                        //       _technologyController.forward();
                        //     }
                        //   },
                        //   child: ContentBuilder(
                        //     controller: _technologyController,
                        //     number: "/02 ",
                        //     width: contentAreaWidth,
                        //     section: StringConst.ABOUT_DEV_TECHNOLOGY.toUpperCase(),
                        //     title: StringConst.ABOUT_DEV_TECHNOLOGY_TITLE,
                        //     body: Column(
                        //       children: [
                        //         AnimatedPositionedText(
                        //           controller: _technologySectionAnimation,
                        //           width: widthOfBody,
                        //           maxLines: 12,
                        //           text: StringConst.ABOUT_DEV_TECHNOLOGY_CONTENT,
                        //           textStyle: bodyText1Style,
                        //         ),
                        //       ],
                        //     ),
                        //     footer: VisibilityDetector(
                        //       key: Key('technology-list'),
                        //       onVisibilityChanged: (visibilityInfo) {
                        //         double visiblePercentage =
                        //             visibilityInfo.visibleFraction * 100;
                        //         if (visiblePercentage > 60) {
                        //           _technologyListController.forward();
                        //         }
                        //       },
                        //       child: Column(
                        //         children: [
                        //           SpaceH40(),
                        //           TechnologySection(
                        //             width: contentAreaWidth,
                        //             controller: _technologyListController,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // CustomSpacer(heightFactor: 0.1),
                        // VisibilityDetector(
                        //   key: Key('contact-section'),
                        //   onVisibilityChanged: (visibilityInfo) {
                        //     double visiblePercentage =
                        //         visibilityInfo.visibleFraction * 100;
                        //     if (visiblePercentage > 50) {
                        //       _contactController.forward();
                        //     }
                        //   },
                        //   child: ContentBuilder(
                        //     controller: _contactController,
                        //     number: "/03 ",
                        //     width: contentAreaWidth,
                        //     section: StringConst.ABOUT_DEV_CONTACT.toUpperCase(),
                        //     title: StringConst.ABOUT_DEV_CONTACT_SOCIAL,
                        //     body: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         SpaceH20(),
                        //         Wrap(
                        //           spacing: 20,
                        //           runSpacing: 20,
                        //           children: _buildSocials(Data.socialData2),
                        //         ),
                        //       ],
                        //     ),
                        //     footer: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         SpaceH40(),
                        //         AnimatedTextSlideBoxTransition(
                        //           controller: _contactController,
                        //           text: StringConst.ABOUT_DEV_CONTACT_EMAIL,
                        //           textStyle: titleStyle,
                        //         ),
                        //         SpaceH40(),
                        //         AnimatedLineThroughText(
                        //           text: StringConst.DEV_EMAIL,
                        //           hasSlideBoxAnimation: true,
                        //           controller: _contactController,
                        //           onTap: () {
                        //             Functions.launchUrl(StringConst.EMAIL_URL);
                        //           },
                        //           textStyle: bodyText2Style,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // CustomSpacer(heightFactor: 0.1),

                        // VisibilityDetector(
                        //   key: Key('quote-section'),
                        //   onVisibilityChanged: (visibilityInfo) {
                        //     double visiblePercentage =
                        //         visibilityInfo.visibleFraction * 100;
                        //     if (visiblePercentage > 50) {
                        //       _quoteController.forward();
                        //     }
                        //   },
                        //   child: Column(
                        //     children: [
                        //       AnimatedTextSlideBoxTransition(
                        //         controller: _quoteController,
                        //         text: StringConst.FAMOUS_QUOTE,
                        //         maxLines: 5,
                        //         width: contentAreaWidth,
                        //         textAlign: TextAlign.center,
                        //         textStyle: titleStyle?.copyWith(
                        //           fontSize: responsiveSize(
                        //             context,
                        //             Sizes.TEXT_SIZE_24,
                        //             Sizes.TEXT_SIZE_36,
                        //             md: Sizes.TEXT_SIZE_28,
                        //           ),
                        //           height: 2.0,
                        //         ),
                        //       ),
                        //       SpaceH20(),
                        //       Align(
                        //         alignment: Alignment.centerRight,
                        //         child: AnimatedTextSlideBoxTransition(
                        //           controller: _quoteController,
                        //           text: "— ${StringConst.FAMOUS_QUOTE_AUTHOR}",
                        //           textStyle: textTheme.bodyLarge?.copyWith(
                        //             fontSize: responsiveSize(
                        //               context,
                        //               Sizes.TEXT_SIZE_16,
                        //               Sizes.TEXT_SIZE_18,
                        //               md: Sizes.TEXT_SIZE_16,
                        //             ),
                        //             fontWeight: FontWeight.w400,
                        //             color: AppColors.grey600,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        CustomSpacer(heightFactor: 0.2),
                      ],
                    ),
                  ),
                ),
                // SlidingBanner(),
                // AnimatedFooter()
                SimpleFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // List<Widget> _buildSocials(List<SocialData> data) {
  //   TextTheme textTheme = Theme.of(context).textTheme;
  //   TextStyle? style = textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
  //   TextStyle? slashStyle = textTheme.bodyLarge?.copyWith(
  //     color: AppColors.grey750,
  //     fontWeight: FontWeight.w400,
  //     fontSize: 18,
  //   );
  //   List<Widget> items = [];

  //   for (int index = 0; index < data.length; index++) {
  //     items.add(
  //       AnimatedLineThroughText(
  //         text: data[index].name,
  //         isUnderlinedByDefault: true,
  //         controller: _contactController,
  //         hasSlideBoxAnimation: true,
  //         isUnderlinedOnHover: false,
  //         onTap: () {
  //           Functions.launchUrl(data[index].url);
  //         },
  //         textStyle: style,
  //       ),
  //     );

  //     if (index < data.length - 1) {
  //       items.add(
  //         Text('/', style: slashStyle),
  //       );
  //     }
  //   }

  //   return items;
  // }
}
