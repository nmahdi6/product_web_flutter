import 'package:aerium/presentation/pages/products/product_detail_page.dart';
import 'package:aerium/presentation/widgets_1/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class ProductDealItem {
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;

  ProductDealItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
  });

  // متد toProductItem برای تبدیل به ProductItem
  ProductItem toProductItem() {
    return ProductItem(
      title: this.title,
      subtitle: this.subtitle,
      price: this.price,
      imagePath: this.imagePath,
    );
  }
}

class ProductDealCard extends StatefulWidget {
  ProductDealCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    this.width = Sizes.WIDTH_180,
    this.height = Sizes.HEIGHT_180,
    this.backgroundColor = AppColors.white,
    this.borderRadius = const BorderRadius.all(
      const Radius.circular(Sizes.RADIUS_20),
    ),
  });

  final String title;
  final String subtitle;
  final String price;
  final String imagePath;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final Color backgroundColor;

  @override
  State<ProductDealCard> createState() => _ProductDealCardState();
}

class _ProductDealCardState extends State<ProductDealCard> {
  Color _shadowColor = AppColors.grey;
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(Sizes.RADIUS_20)),
      child: MouseRegion(
          onEnter: (event) {
            setState(() {
              _shadowColor = AppColors.green_;
              _isHovered = true;
            });
          },
          onExit: (event) {
            setState(() {
              _shadowColor = AppColors.grey;
              _isHovered = false;
            });
          },
          child: AnimatedScale(
            scale: _isHovered ? 1.06 : 1.0, // بزرگ شدن در حالت hover
            duration: Duration(milliseconds: 200), // مدت زمان انیمیشن

            child: AnimatedContainer(
              duration: Duration(milliseconds: 300), // انیمیشن تغییر رنگ
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    color: _shadowColor,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: widget.borderRadius,
                  color: widget.backgroundColor,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.PADDING_16,
                  vertical: Sizes.PADDING_16,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: widget
                          .borderRadius, // مقدار شعاع برای گرد کردن گوشه‌ها
                      child: Image.asset(
                        widget.imagePath,
                        width: widget.width,
                        height: widget.height,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SpaceH12(),
                    Center(
                      child: Text(
                        widget.title,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontSize: Sizes.TEXT_SIZE_24,
                        ),
                      ),
                    ),
                    SpaceH20(),
                    Center(
                      child: Text(
                        widget.subtitle,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: AppColors.accentDarkGreenColor,
                          fontSize: Sizes.TEXT_SIZE_14,
                        ),
                      ),
                    ),
                    SpaceH40(),
                    Center(
                      child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Sizes.RADIUS_8),
                            )),
                            backgroundColor:
                                WidgetStateProperty.all(AppColors.background),
                          ),
                          onPressed: () {},
                          child: Text(
                            StringConst.BUY,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: AppColors.white,
                              fontSize: Sizes.TEXT_SIZE_18,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  // List<TextSpan> _buildPrice({
  //   required BuildContext context,
  //   required String price,
  // }) {
  //   List<TextSpan> texts = [];
  //   // List<Color> colors = [
  //   //   AppColors.accentYellowColor,
  //   //   AppColors.accentPinkColor,
  //   //   AppColors.accentDarkGreenColor,
  //   //   AppColors.accentOrangeColor,
  //   // ];

  //   int colorCounter = 0;
  //   for (int index = 1; index < price.length; index++) {
  //     texts.add(
  //       createText(
  //         context: context,
  //         text: price[index],
  //         textColor: AppColors.secondaryColor2,
  //       ),
  //       // textColor: colors[colorCounter]),
  //     );
  //     // colorCounter++;
  //     // if (colorCounter == colors.length) {
  //     //   colorCounter = 0;
  //     // }
  //   }
  //   return texts;
  // }

  TextSpan createText({
    required BuildContext context,
    required String text,
    required Color textColor,
  }) {
    ThemeData theme = Theme.of(context);
    return TextSpan(
      text: text,
      style: theme.textTheme.headlineSmall?.copyWith(
        color: textColor,
        fontSize: Sizes.TEXT_SIZE_28,
      ),
    );
  }
}
