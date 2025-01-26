import 'package:aerium/presentation/widgets_1/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductItem product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.black,
      // appBar: AppBar(
      //   title: Text(widget.product.title),
      // ),
      body: Stack(children: [
        // background image
        Container(
          color: AppColors.black,
          width: size.width,
          height: size.height,
          child: Center(
            child: ClipRRect(
              // borderRadius:
              //     widget.borderRadius,
              child: Image.asset(
                "assets/images/products/badsaba_dark.jpg",
                // "assets/images/shams_logo_2.png",
                width: size.width / 2,
                height: size.height / 2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        SingleChildScrollView(
          child: Column(
            children: [
              SpaceH60(),
              Center(
                child: Container(
                  width: size.width / 2,
                  padding: EdgeInsets.symmetric(
                      vertical: 20,
                      // horizontal: assignWidth(context, 0.10),
                      horizontal: 50),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.9),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: AppColors.white, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Hero(
                        tag: widget.product.imagePath, // برای انیمیشن
                        // child: Image.network(
                        //   widget.product.imagePath,
                        //   height: 300,
                        //   fit: BoxFit.cover,
                        // ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(Sizes
                              .RADIUS_20)), // مقدار شعاع برای گرد کردن گوشه‌ها
                          child: Image.asset(
                            widget.product.imagePath,
                            width: size.width / 3,
                            height: size.height / 3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SpaceH30(),
                      Text(
                        widget.product.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SpaceH12(),
                      Text(
                        widget.product.subtitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SpaceH12(),
                      Text(
                        "\$${widget.product.price}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SpaceH30(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: AppColors.black),
                            onPressed: _decrementQuantity,
                          ),
                          SpaceW12(),
                          Text(
                            '$_quantity',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SpaceW12(),
                          IconButton(
                            icon: Icon(Icons.add, color: AppColors.black),
                            onPressed: _incrementQuantity,
                          ),
                        ],
                      ),
                      SpaceH100(),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 25)),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                          )),
                          backgroundColor:
                              WidgetStateProperty.all(AppColors.background),
                        ),
                        onPressed: () {
                          // Navigator.pop(
                          //   context,
                          // );
                        },
                        child: Text(
                          StringConst.ADD_TO_CART,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.white,
                            fontSize: Sizes.TEXT_SIZE_18,
                          ),
                        ),
                      ),
                      SpaceH40(),

                      //
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          StringConst.UPDATING_MESSAGE,
                          style: theme.textTheme.headlineSmall?.copyWith(
                              color: AppColors.errorRed,
                              fontSize: Sizes.TEXT_SIZE_18,
                              height: 1.4),
                        ),
                      ),
                      SpaceH12(),

                      ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 25)),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                          )),
                          backgroundColor:
                              WidgetStateProperty.all(AppColors.grey),
                        ),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: Text(
                          StringConst.BACK,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.background,
                            fontSize: Sizes.TEXT_SIZE_18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SpaceH60(),
            ],
          ),
        ),
      ]),
    );
  }
}

class ProductItem {
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;

  ProductItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
  });
}

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

  // تبدیل ProductDealItem به ProductItem
  ProductItem toProductItem() {
    return ProductItem(
      title: this.title,
      subtitle: this.subtitle,
      price: this.price,
      imagePath: this.imagePath,
    );
  }
}