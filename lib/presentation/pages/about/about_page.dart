import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/main.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets_1/content_area.dart';
import 'package:aerium/presentation/widgets_1/custom_spacer.dart';
import 'package:aerium/presentation/widgets_1/page_wrapper.dart';
import 'package:aerium/presentation/widgets_1/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutPage extends StatefulWidget {
  static const String aboutPageRoute = StringConst.ABOUT_PAGE;
  // final MusicController musicController;

  const AboutPage({
    Key? key,
  }) : super(key: key);

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
    _saveLastVisitedPage();
  }

  _saveLastVisitedPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastVisitedPage', StringConst.ABOUT_PAGE);
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
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600; // تشخیص دستگاه موبایل

    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8), // عرض بیشتر برای موبایل
      assignWidth(context, 0.475),
      sm: assignWidth(context, 0.8),
    );

    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.05), // پدینگ کمتر برای موبایل
        assignWidth(context, 0.05),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.05), // پدینگ کمتر برای موبایل
        assignWidth(context, 0.03),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.18), // پدینگ کمتر برای موبایل
        assignHeight(context, 0.15),
      ),
    );

    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    TextStyle? bodyText1Style = textTheme.bodyLarge?.copyWith(
      fontSize: isMobile
          ? Sizes.TEXT_SIZE_14
          : Sizes.TEXT_SIZE_18, // فونت کوچک‌تر برای موبایل
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
    );
    TextStyle? bodyText2Style =
        textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
    TextStyle? titleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_14, // فونت کوچک‌تر برای موبایل
        Sizes.TEXT_SIZE_20,
      ),
    );

    return PageWrapper(
      // musicController: widget.musicController,
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
                child: Image.asset(
                  ImagePath.badsaba_light,
                  width: isMobile
                      ? size.width / 2
                      : size.width / 3, // تصویر کوچک‌تر برای موبایل
                  height: isMobile
                      ? size.height / 3
                      : size.height / 2, // تصویر کوچک‌تر برای موبایل
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
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal:
                                isMobile ? 20 : 50, // پدینگ کمتر برای موبایل
                          ),
                          decoration: BoxDecoration(
                            color:
                                AppColors.appBackgroundColor.withOpacity(0.9),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.appBackgroundColor
                                    .withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
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
                        CustomSpacer(heightFactor: 0.2),
                      ],
                    ),
                  ),
                ),
                SimpleFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
