import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/products/product_detail_page.dart'
    hide ProductDealItem;
import 'package:aerium/presentation/pages/home/widgets/home_page_header.dart';
import 'package:aerium/presentation/pages/home/widgets/loading_page.dart';
import 'package:aerium/presentation/pages/widgets/animated_footer.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets/product_deal_card.dart';
import 'package:aerium/presentation/widgets/section_heading_1.dart';
import 'package:aerium/presentation/widgets_1/animated_text_slide_box_transition.dart';
import 'package:aerium/presentation/widgets_1/custom_spacer.dart';
import 'package:aerium/presentation/widgets_1/page_wrapper.dart';
import 'package:aerium/presentation/widgets_1/spaces.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:aerium/values/values.dart';

class HomePage extends StatefulWidget {
  static const String homePageRoute = StringConst.HOME_PAGE;

  HomePage({Key? key, musicController}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GlobalKey key = GlobalKey();
  ScrollController _scrollController = ScrollController();
  late AnimationController _viewProjectsController;
  // late AnimationController _recentWorksController;
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
    // _recentWorksController = AnimationController(
    //   vsync: this,
    //   duration: Animations.slideAnimationDurationLong,
    // );

    super.initState();
  }

  void getArguments() {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    // if page is being loaded for the first time, args will be null.
    // if args is null, I set boolean values to run the appropriate animation
    // In this case, if null run loading animation, if not null run the unveil animation
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
    getArguments();
    // double projectItemHeight = assignHeight(context, 0.4);
    // double subHeight = (3 / 4) * projectItemHeight;
    // double extra = projectItemHeight - subHeight;
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    double screenWidth = MediaQuery.of(context).size.width;

    double headerFontSize = responsiveSize(context, 20, 30, md: 18, sm: 14);

    final myItems = [
      Container(
        margin: EdgeInsets.symmetric(horizontal: assignHeight(context, 0.15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // شعاع گوشه‌ها
          image: DecorationImage(
            image: AssetImage(StringConst.tea_lil_2), // مسیر تصویر
            // fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: assignHeight(context, 0.15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // شعاع گوشه‌ها
          image: DecorationImage(
            image: AssetImage(StringConst.rice_damsiyah_3), // مسیر تصویر
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: assignHeight(context, 0.15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // شعاع گوشه‌ها
          image: DecorationImage(
            image: AssetImage(StringConst.cake_oydo_1), // مسیر تصویر
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: assignHeight(context, 0.15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // شعاع گوشه‌ها
          image: DecorationImage(
            image: AssetImage(StringConst.dates_kabkab_1), // مسیر تصویر
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];

    return PageWrapper(
      selectedRoute: HomePage.homePageRoute,
      selectedPageName: StringConst.HOME,
      backgroundColor: AppColors.black,
      navBarAnimationController: _slideTextController,
      hasSideTitle: false,
      hasUnveilPageAnimation: _arguments.showUnVeilPageAnimation,
      onLoadingAnimationDone: () {
        _slideTextController.forward();
      },
      // loading first
      customLoadingAnimation: LoadingHomePageAnimation(
        text: StringConst.COMPANY_NAME_FA,
        text_2: StringConst.COMPANY_NAME_EN,
        style: textTheme.headlineMedium!.copyWith(color: AppColors.white),
        onLoadingDone: () {
          _slideTextController.forward();
        },
      ),

      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.zero,
          controller: _scrollController,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            // HomePageHeader(
            //   controller: _slideTextController,
            //   scrollToWorksKey: key,
            // ),
            Container(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  Stack(children: [
                    SizedBox(
                      height: assignHeight(context, 0.58), // ارتفاع منحنی
                      width: double.infinity,
                      child: CustomPaint(
                        painter: HeaderPainter(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Column(
                            children: [
                              Text(
                                StringConst.APP_NAME,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white, // رنگ متن
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'با ما تفاوت را احساس کنید',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily:
                                      'IranSans', // اضافه کردن فونت دلخواه
                                  fontSize: 28, // اندازه فونت
                                  fontWeight: FontWeight.bold, // ضخامت فونت
                                  color: const Color.fromARGB(
                                      255, 255, 254, 208), // رنگ اصلی متن
                                  shadows: [
                                    Shadow(
                                      color: Colors.orangeAccent
                                          .withOpacity(0.8), // سایه نارنجی روشن
                                      blurRadius: 10, // محو بودن سایه
                                      offset: Offset(0, 3), // مکان سایه
                                    ),
                                    Shadow(
                                      color: Colors.black
                                          .withOpacity(0.4), // سایه تیره‌تر
                                      blurRadius: 15, // محو بودن سایه
                                      offset: Offset(0, 5), // مکان سایه
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Container(
                              width: assignWidth(context, 0.15),
                              height: assignWidth(context, 0.15),
                              child: Image(
                                  image: AssetImage(StringConst.shams_logo))),
                        ),
                      ],
                    ),
                  ]),

                  SizedBox(
                    height: assignHeight(context, 0.018),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                    child: Row(
                      children: [
                        AnimatedTextSlideBoxTransition(
                          controller: _slideTextController,
                          text: StringConst.HOME_MAIN_TITLE_TEXT,
                          maxLines: 20,
                          textStyle: textTheme.displayMedium?.copyWith(
                            color: AppColors.white,
                            height: 1.6,
                            fontSize: 24,
                            // fontSize: headerFontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SpaceH20(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                    child: AnimatedTextSlideBoxTransition(
                      controller: _slideTextController,
                      text: StringConst.HOME_MAIN_TEXT,
                      maxLines: 20,
                      textStyle: textTheme.displayMedium?.copyWith(
                        color: AppColors.white,
                        height: 1.6,
                        fontSize: 20,
                        // fontSize: headerFontSize,
                      ),
                    ),
                  ),
                  // ),
                  SizedBox(
                    height: assignHeight(context, 0.02),
                  ),
                ],
              ),
            ),

            // new product list
            // CustomSpacer(heightFactor: 0.15),

            Container(
              height: assignHeight(context, 0.57),
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: AnotherCarousel(
                  images: myItems,
                  dotSize: 10,
                  indicatorBgPadding: 5,
                ),
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
                      color: AppColors.white,
                      fontSize: 24),
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
              padding: EdgeInsets.symmetric(horizontal: 128, vertical: 20),
              child: Wrap(
                spacing: 26,
                runSpacing: 26,
                children: List.generate(Data_2.newProductItems.length, (index) {
                  var product = Data_2.newProductItems[index];
                  // ignore: unnecessary_type_check
                  var productItem = product is ProductDealItem
                      ? product.toProductItem()
                      : product;

                  return Container(
                    height: 400,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.RADIUS_20)),
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

            // popular product list
            CustomSpacer(heightFactor: 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SectionHeading1(
                  title: StringConst.POPULAR_PRODUCT,
                  titleTextStyle: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      fontSize: 24),
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
            // CustomSpacer(heightFactor: 0.15),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 128, vertical: 20),
              child: Wrap(
                spacing: 26,
                runSpacing: 26,
                children:
                    List.generate(Data_2.popularProductItems.length, (index) {
                  var product = Data_2.popularProductItems[index];
                  // ignore: unnecessary_type_check
                  var productItem = product is ProductDealItem
                      ? product.toProductItem()
                      : product;

                  return Container(
                    height: 400,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.RADIUS_20)),
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
            AnimatedFooter(),
            SimpleFooterSm(),
          ],
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
    path.moveTo(0, size.height / 2); // نقطه شروع از چپ
    path.quadraticBezierTo(
      size.width / 2, 0, // نقطه کنترل در وسط
      size.width, size.height / 2, // نقطه انتها در راست
    );
    path.lineTo(size.width, size.height); // پایین راست
    path.quadraticBezierTo(
      size.width / 2, size.height * 1.5, // نقطه کنترل پایین وسط
      0, size.height, // پایین چپ
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
