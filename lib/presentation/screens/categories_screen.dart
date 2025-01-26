import 'package:aerium/presentation/screens/category_item_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:aerium/presentation/routes/router.gr.dart';
import 'package:aerium/presentation/widgets/category_card.dart';
import 'package:aerium/presentation/widgets/drop_appbar.dart';
import 'package:aerium/presentation/widgets/product_deal_card.dart';
import 'package:aerium/presentation/widgets/section_heading_2.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(
            left: Sizes.PADDING_24,
            top: Sizes.PADDING_32,
            bottom: Sizes.PADDING_24,
          ),
          children: [
            PreferredSize(
              preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
              child: DropAppBar(
                onLeadingTap: () {},
              ),
            ),
            SpaceH20(),
            SectionHeading2(
              title1: StringConst.CATEGORIES,
              title2: StringConst.SEE_ALL,
            ),
            SpaceH8(),
            Container(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: Data_2.categoryItems.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SpaceW8();
                },
                itemBuilder: (BuildContext context, int index) {
                  return CategoryCard(
                    title: Data_2.categoryItems[index].title,
                    subtitle: Data_2.categoryItems[index].subtitle!,
                    subtitleColor: Data_2.categoryItems[index].subtitleColor!,
                    imagePath: Data_2.categoryItems[index].imagePath,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryItemScreen(
                                Data_2.categoryItems[index].title)),
                      );
                      // AutoRouter.of(context).push(CategoryItemScreenRoute(
                      //     category: Data_2.categoryItems[index].title));
                    },
                  );
                },
              ),
            ),
            SpaceH20(),
            SectionHeading2(
              title1: StringConst.TOP_DEALS,
              title2: StringConst.SEE_ALL,
            ),
            SpaceH8(),
            Container(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: Data_2.productDealItems.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SpaceW8();
                },
                itemBuilder: (BuildContext context, int index) {
                  return ProductDealCard(
                    title: Data_2.productDealItems[index].title,
                    subtitle: Data_2.productDealItems[index].subtitle,
                    price: Data_2.productDealItems[index].price,
                    imagePath: Data_2.productDealItems[index].imagePath,
                  );
                },
              ),
            ),
            SpaceH20(),
            SectionHeading2(
              title1: StringConst.LATEST,
              title2: StringConst.SEE_ALL,
            ),
            Container(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: Data_2.productLatestItems.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SpaceW8();
                },
                itemBuilder: (BuildContext context, int index) {
                  return ProductDealCard(
                    title: Data_2.productLatestItems[index].title,
                    subtitle: Data_2.productLatestItems[index].subtitle,
                    price: Data_2.productLatestItems[index].price,
                    imagePath: Data_2.productLatestItems[index].imagePath,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
