import 'package:aerium/presentation/layout/adaptive.dart';
import 'package:aerium/presentation/widgets/checkout_card.dart';
import 'package:aerium/presentation/widgets/custom_button.dart';
import 'package:aerium/presentation/widgets/drop_appbar.dart';
import 'package:aerium/presentation/widgets/section_heading_2.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    getTotalPrice();
  }

  getTotalPrice() {
    double price = 0.0;
    for (int index = 0; index < Data_2.checkOutItems.length; index++) {
      int quantity = int.parse(Data_2.checkOutItems[index].quantity);
      double itemPrice =
          double.parse(Data_2.checkOutItems[index].price) * quantity;
      price += itemPrice;
    }

    totalPrice = price;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: Sizes.PADDING_32,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Sizes.PADDING_24,
              ),
              child: PreferredSize(
                preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
                child: DropAppBar(
                  onLeadingTap: () {},
                ),
              ),
            ),
            SpaceH20(),
            SectionHeading2(
              title1: StringConst.CHECK_OUT,
              padding: EdgeInsets.only(
                left: Sizes.PADDING_24,
              ),
              hasTitle2: false,
            ),
            SpaceH20(),
            ListView.separated(
              itemCount: Data_2.checkOutItems.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return SpaceH16();
              },
              itemBuilder: (BuildContext context, int index) {
                final String item = Data_2.checkOutItems[index].title;

                return Dismissible(
                  key: Key(item),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      int quantity =
                          int.parse(Data_2.checkOutItems[index].quantity);
                      totalPrice -=
                          double.parse(Data_2.checkOutItems[index].price) *
                              quantity;
                      Data_2.checkOutItems.removeAt(index);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.primaryColor,
                        content: Text(
                          "$item ${StringConst.REMOVED}",
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: AppColors.accentOrangeColor,
                          ),
                        ),
                        action: SnackBarAction(
                          label: StringConst.UNDO,
                          textColor: AppColors.white,
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      ),
                    );
                  },
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: Sizes.HEIGHT_100,
                        width: Sizes.WIDTH_80,
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.PADDING_24,
                          vertical: Sizes.PADDING_16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: const BorderRadius.only(
                            topLeft: const Radius.circular(Sizes.RADIUS_12),
                            bottomLeft: const Radius.circular(Sizes.RADIUS_12),
                          ),
                        ),
                        child: Icon(
                          FeatherIcons.trash2,
                          size: Sizes.ICON_SIZE_32,
                        ),
                      )
                    ],
                  ),
                  child: CheckOutCard(
                    title: Data_2.checkOutItems[index].title,
                    price: "\$" + Data_2.checkOutItems[index].price,
                    quantity: "x" + Data_2.checkOutItems[index].quantity,
                    imagePath: Data_2.checkOutItems[index].imagePath,
                  ),
                );
              },
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.PADDING_24,
              ),
              child: Row(
                children: [
                  Text(
                    StringConst.TOTAL,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: AppColors.secondaryColor2,
                      fontSize: Sizes.TEXT_SIZE_18,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "$totalPrice",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: Sizes.TEXT_SIZE_24,
                    ),
                  ),
                ],
              ),
            ),
            SpaceH20(),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: assignWidth(context: context, fraction: 0.7),
                child: CustomButton(
                  onPressed: () {},
                  title: StringConst.CHECK_OUT,
                  textStyle: theme.textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                  ),
                  height: Sizes.HEIGHT_60,
                  borderRadiusGeometry: AppRadius.defaultButtonRadius,
                ),
              ),
            ),
            SpaceH40(),
          ],
        ),
      ),
    );
  }
}
