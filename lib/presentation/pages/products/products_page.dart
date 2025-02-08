import 'package:aerium/main.dart';
import 'package:aerium/presentation/pages/products/product_detail_page.dart'
    hide ProductDealItem;
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets/product_deal_card.dart';
import 'package:aerium/presentation/widgets/section_heading_1.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:aerium/presentation/pages/widgets/animated_footer.dart';
import 'package:aerium/presentation/widgets_1/custom_spacer.dart';
import 'package:aerium/presentation/widgets_1/page_wrapper.dart';
import 'package:aerium/presentation/widgets_1/spaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsPage extends StatefulWidget {
  static const String productsPageRoute = StringConst.PRODUCT_PAGE;
  final MusicController musicController;

  const ProductsPage({
    Key? key,
    required this.musicController,
  }) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _headingTextController;
  List<String> items = [
    StringConst.ALL_PRODUCT,
    StringConst.POPULAR_PRODUCT,
    StringConst.NEW_PRODUCT
  ];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _headingTextController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    super.initState();
    _saveLastVisitedPage();
  }

  _saveLastVisitedPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastVisitedPage', StringConst.PRODUCT_PAGE);
  }

  @override
  void dispose() {
    _controller.dispose();
    _headingTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width < 600; // تشخیص دستگاه موبایل
    TextTheme textTheme = Theme.of(context).textTheme;

    return PageWrapper(
      selectedRoute: ProductsPage.productsPageRoute,
      selectedPageName: StringConst.PRODUCTS,
      navBarAnimationController: _headingTextController,
      hasSideTitle: false,
      musicController: widget.musicController,
      onLoadingAnimationDone: () {
        _headingTextController.forward();
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

          Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                CustomSpacer(
                    heightFactor:
                        isMobile ? 0.16 : 0.16), // فاصله کمتر برای موبایل
                SpaceH40(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 110, // پدینگ کمتر برای موبایل
                  ),
                  child: Row(
                    children: [
                      SectionHeading1(
                        title: StringConst.ALL_PRODUCT,
                        titleTextStyle: textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.appTextColor,
                          fontSize:
                              isMobile ? 20 : 24, // فونت کوچک‌تر برای موبایل
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_drop_down,
                            color: AppColors.appTextColor),
                      )
                    ],
                  ),
                ),
                SpaceH40(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 128, // پدینگ کمتر برای موبایل
                  ),
                  child: Wrap(
                    spacing: isMobile ? 20 : 26, // فاصله کمتر برای موبایل
                    runSpacing: isMobile ? 20 : 26, // فاصله کمتر برای موبایل
                    children:
                        List.generate(Data_2.trendingItems.length, (index) {
                      var product = Data_2.trendingItems[index];
                      var productItem = product is ProductDealItem
                          ? product.toProductItem()
                          : product;

                      return Container(
                        height: 400, // ارتفاع کمتر برای موبایل
                        width: isMobile
                            ? size.width * 0.4
                            : 220, // عرض کمتر برای موبایل
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Sizes.RADIUS_20)),
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
                              width:
                                  isMobile ? Sizes.WIDTH_160 : Sizes.WIDTH_180,
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
                CustomSpacer(
                    heightFactor:
                        isMobile ? 0.1 : 0.2), // فاصله کمتر برای موبایل
                AnimatedFooter(),
                SimpleFooterSm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:aerium/presentation/pages/products/product_detail_page.dart'
//     hide ProductDealItem;
// import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
// import 'package:aerium/presentation/widgets/product_deal_card.dart';
// import 'package:aerium/presentation/widgets/section_heading_1.dart';
// import 'package:aerium/values/values.dart';
// import 'package:flutter/material.dart';
// import 'package:aerium/presentation/pages/widgets/animated_footer.dart';
// import 'package:aerium/presentation/widgets_1/custom_spacer.dart';
// import 'package:aerium/presentation/widgets_1/page_wrapper.dart';
// import 'package:aerium/presentation/widgets_1/spaces.dart';

// class ProductsPage extends StatefulWidget {
//   static const String productsPageRoute = StringConst.PRODUCT_PAGE;
//   const ProductsPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _ProductsPageState createState() => _ProductsPageState();
// }

// class _ProductsPageState extends State<ProductsPage>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late AnimationController _headingTextController;
//   List<String> items = [
//     StringConst.ALL_PRODUCT,
//     StringConst.POPULAR_PRODUCT,
//     StringConst.NEW_PRODUCT
//   ];

//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 200),
//     );
//     _headingTextController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1200),
//     );

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _headingTextController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     String selectedValue = StringConst.ALL_PRODUCT;
//     TextTheme textTheme = Theme.of(context).textTheme;

//     return PageWrapper(
//       selectedRoute: ProductsPage.productsPageRoute,
//       selectedPageName: StringConst.PRODUCTS,
//       navBarAnimationController: _headingTextController,
//       hasSideTitle: false,
//       onLoadingAnimationDone: () {
//         _headingTextController.forward();
//       },
//       child: Stack(
//         children: [
//           // background image
//           Container(
//             color: AppColors.appBackgroundColor,
//             width: size.width,
//             height: size.height,
//             child: Center(
//               child: ClipRRect(
//                 // borderRadius:
//                 //     widget.borderRadius,
//                 child: Image.asset(
//                   ImagePath.badsaba_light,
//                   width: size.width / 3,
//                   height: size.height / 2,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),

//           Directionality(
//             textDirection: TextDirection.rtl,
//             child: ListView(
//               physics: const BouncingScrollPhysics(
//                 parent: AlwaysScrollableScrollPhysics(),
//               ),
//               children: [
//                 CustomSpacer(heightFactor: 0.16),
//                 SpaceH40(),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 110),
//                   child: Row(
//                     children: [
//                       SectionHeading1(
//                         title: StringConst.ALL_PRODUCT,
//                         titleTextStyle: textTheme.headlineMedium?.copyWith(
//                             fontWeight: FontWeight.w600,
//                             color: AppColors.appTextColor,
//                             fontSize: 24),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.arrow_drop_down,
//                             color: AppColors.appTextColor),
//                       )
//                     ],
//                   ),
//                 ),
//                 SpaceH40(),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 128),
//                   // height: 400,
//                   child: Wrap(
//                     spacing: 26,
//                     runSpacing: 26,
//                     children:
//                         List.generate(Data_2.trendingItems.length, (index) {
//                       var product = Data_2.trendingItems[index];
//                       // ignore: unnecessary_type_check
//                       var productItem = product is ProductDealItem
//                           ? product.toProductItem()
//                           : product;

//                       return Container(
//                         height: 400,
//                         width: 220,
//                         decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.circular(Sizes.RADIUS_20)),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               PageRouteBuilder(
//                                 transitionDuration:
//                                     const Duration(milliseconds: 150),
//                                 reverseTransitionDuration:
//                                     const Duration(milliseconds: 100),
//                                 pageBuilder:
//                                     (context, animation, secondaryAnimation) {
//                                   return ProductDetailPage(
//                                     product: productItem as ProductItem,
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                           child: Hero(
//                             tag: product.imagePath,
//                             child: ProductDealCard(
//                               title: product.title,
//                               subtitle: product.subtitle,
//                               price: product.price,
//                               imagePath: product.imagePath,
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 CustomSpacer(heightFactor: 0.2),
//                 AnimatedFooter(),
//                 SimpleFooterSm(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
