import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/main.dart';
import 'package:aerium/presentation/pages/products/product_detail_page.dart'
    hide ProductDealItem;
import 'package:aerium/presentation/pages/home/widgets/home_page_header.dart';
import 'package:aerium/presentation/pages/widgets/animated_footer.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets/product_deal_card.dart';
import 'package:aerium/presentation/widgets/save_last_page/save_last_visited_page.dart';
import 'package:aerium/presentation/widgets/section_heading_1.dart';
import 'package:aerium/presentation/widgets_1/animated_text_slide_box_transition.dart';
import 'package:aerium/presentation/widgets_1/custom_spacer.dart';
import 'package:aerium/presentation/widgets_1/page_wrapper.dart';
import 'package:aerium/presentation/widgets_1/spaces.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:aerium/values/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const String homePageRoute = StringConst.HOME_PAGE;

  // final MusicController musicController;

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GlobalKey key = GlobalKey();
  ScrollController _scrollController = ScrollController();
  late AnimationController _viewProjectsController;
  late AnimationController _slideTextController;
  late NavigationArguments _arguments;

  @override
  void initState() {
    _arguments = NavigationArguments();
    _viewProjectsController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _slideTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _slideTextController.forward(); // شروع انیمیشن متن

    super.initState();
    _saveLastVisitedPage();
  }

  _saveLastVisitedPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastVisitedPage', StringConst.HOME_PAGE);
  }

  void getArguments() {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    if (args == null) {
      _arguments.showUnVeilPageAnimation = false;
    } else {
      _arguments = args as NavigationArguments;
    }
  }

  @override
  void dispose() {
    _viewProjectsController.dispose();
    _slideTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ذخیره آخرین صفحه بازدید شده
    WidgetsBinding.instance.addPostFrameCallback((_) {
      saveLastVisitedPage(StringConst.HOME_PAGE);
    });
    getArguments();
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600; // تشخیص دستگاه موبایل

    // double headerFontSize = isMobile ? 16 : 24; // تنظیم فونت‌ها برای موبایل
    double carouselHeight =
        isMobile ? 300 : 450; // تنظیم ارتفاع کاروسل برای موبایل
    double productCardWidth =
        isMobile ? size.width * 0.4 : 220; // تنظیم عرض کارت محصولات

    final myItems = [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(ImagePath.tea_banner),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(ImagePath.rice_banner),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(ImagePath.cookie_banner),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(ImagePath.dates_banner),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];

    return PageWrapper(
      selectedRoute: HomePage.homePageRoute,
      selectedPageName: StringConst.HOME,
      backgroundColor: AppColors.appBackgroundColor,
      navBarAnimationController: _slideTextController,
      hasSideTitle: false,
      hasUnveilPageAnimation: _arguments.showUnVeilPageAnimation,
      onLoadingAnimationDone: () {
        _slideTextController.forward();
      },
      // customLoadingAnimation: LoadingHomePageAnimation(
      //   text: StringConst.COMPANY_NAME_FA,
      //   text_2: StringConst.COMPANY_NAME_EN,
      //   style: textTheme.headlineMedium!.copyWith(color: AppColors.white),
      //   onLoadingDone: () {
      //     _slideTextController.forward();
      //   },
      // ),
      // musicController: widget.musicController,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.zero,
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              Container(
                width: size.width,
                height: isMobile
                    ? size.height * 0.8
                    : size.height, // تنظیم ارتفاع برای موبایل
                child: Column(
                  children: [
                    Stack(children: [
                      SizedBox(
                        height: assignHeight(context, isMobile ? 0.4 : 0.58),
                        width: double.infinity,
                        child: CustomPaint(
                          painter: HeaderPainter(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Column(
                              children: [
                                Text(
                                  StringConst.APP_NAME_ENGLISH,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: StringConst.FONT_FAMILY,
                                    fontSize: isMobile ? 14 : 18,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.orangeAccent
                                            .withOpacity(0.7),
                                        blurRadius: 70,
                                        offset: Offset(0, 3),
                                      ),
                                      Shadow(
                                        color: Colors.black.withOpacity(0.4),
                                        blurRadius: 15,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: isMobile ? 15 : 30,
                                ),
                                Text(
                                  StringConst.DEV_INTRO,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: StringConst.FONT_FAMILY,
                                    fontSize: isMobile ? 22 : 30,
                                    fontWeight: FontWeight.w900,
                                    color: const Color.fromARGB(
                                        255, 255, 254, 208),
                                    shadows: [
                                      Shadow(
                                        color: Colors.orangeAccent
                                            .withOpacity(0.8),
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                      ),
                                      Shadow(
                                        color: Colors.black.withOpacity(0.4),
                                        blurRadius: 15,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Container(
                              width:
                                  assignWidth(context, isMobile ? 0.2 : 0.15),
                              height:
                                  assignWidth(context, isMobile ? 0.2 : 0.15),
                              child: Image(
                                image: AssetImage(ImagePath.shams_logo),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    SizedBox(
                      height: assignHeight(context, 0.018),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 15 : 25, vertical: 2),
                      child: Row(
                        children: [
                          AnimatedTextSlideBoxTransition(
                            controller: _slideTextController,
                            text: StringConst.HOME_MAIN_TITLE_TEXT,
                            maxLines: 20,
                            textStyle: textTheme.displayMedium?.copyWith(
                              color: AppColors.appTextColor,
                              height: 1.6,
                              fontSize: isMobile ? 18 : 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SpaceH20(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 15 : 25, vertical: 2),
                      child: AnimatedTextSlideBoxTransition(
                        controller: _slideTextController,
                        text: StringConst.HOME_MAIN_TEXT,
                        maxLines: 20,
                        textStyle: textTheme.displayMedium?.copyWith(
                          color: AppColors.appTextColor,
                          height: 1.6,
                          fontSize: isMobile ? 16 : 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: assignHeight(context, isMobile ? 0.006 : 0.02),
                    ),
                  ],
                ),
              ),
              Container(
                height: carouselHeight,
                width: screenWidth,
                child: AnotherCarousel(
                  images: myItems,
                  dotSize: 10,
                  indicatorBgPadding: 1,
                ),
              ),
              CustomSpacer(heightFactor: 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SectionHeading1(
                    title: StringConst.NEW_PRODUCT,
                    titleTextStyle: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.appTextColor,
                      fontSize: isMobile ? 20 : 24,
                    ),
                  ),
                ],
              ),
              CustomSpacer(heightFactor: 0.02),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width / 15),
                height: 2,
                width: size.width,
                child: CustomPaint(
                  painter: CustomLinePainter(),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 128, vertical: 20),
                child: Wrap(
                  spacing: isMobile ? 10 : 26,
                  runSpacing: isMobile ? 10 : 26,
                  children:
                      List.generate(Data_2.newProductItems.length, (index) {
                    var product = Data_2.newProductItems[index];
                    var productItem = product is ProductDealItem
                        ? product.toProductItem()
                        : product;

                    return Container(
                      height: 400,
                      width: productCardWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.RADIUS_20),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 150),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 100),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return ProductDetailPage(
                                  product: productItem as ProductItem,
                                );
                              },
                            ),
                          );
                        },
                        child: Hero(
                          tag: product.imagePath,
                          child: ProductDealCard(
                            title: product.title,
                            subtitle: product.subtitle,
                            price: product.price,
                            imagePath: product.imagePath,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              CustomSpacer(heightFactor: 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SectionHeading1(
                    title: StringConst.POPULAR_PRODUCT,
                    titleTextStyle: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.appTextColor,
                      fontSize: isMobile ? 20 : 24,
                    ),
                  ),
                ],
              ),
              CustomSpacer(heightFactor: 0.02),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width / 15),
                height: 2,
                width: size.width,
                child: CustomPaint(
                  painter: CustomLinePainter(),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 128, vertical: 20),
                child: Wrap(
                  spacing: isMobile ? 10 : 26,
                  runSpacing: isMobile ? 10 : 26,
                  children:
                      List.generate(Data_2.popularProductItems.length, (index) {
                    var product = Data_2.popularProductItems[index];
                    var productItem = product is ProductDealItem
                        ? product.toProductItem()
                        : product;

                    return Container(
                      height: 400,
                      width: productCardWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.RADIUS_20),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 150),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 100),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return ProductDetailPage(
                                  product: productItem as ProductItem,
                                );
                              },
                            ),
                          );
                        },
                        child: Hero(
                          tag: product.imagePath,
                          child: ProductDealCard(
                            width: isMobile ? Sizes.WIDTH_160 : Sizes.WIDTH_180,
                            height:
                                isMobile ? Sizes.WIDTH_160 : Sizes.WIDTH_180,
                            title: product.title,
                            subtitle: product.subtitle,
                            price: product.price,
                            imagePath: product.imagePath,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              CustomSpacer(heightFactor: 0.15),
              AnimatedFooter(),
              SimpleFooterSm(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.grey
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      size.height / 2,
    );
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 1.5,
      0,
      size.height,
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
