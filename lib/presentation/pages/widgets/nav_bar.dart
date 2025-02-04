import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets_1/animated_text_slide_box_transition.dart';
import 'package:aerium/presentation/widgets_1/app_logo.dart';
import 'package:aerium/presentation/widgets_1/empty.dart';
import 'package:aerium/presentation/widgets_1/nav_item.dart';
import 'package:aerium/presentation/widgets_1/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBar extends StatelessWidget {
  NavBar({
    Key? key,
    required this.selectedRouteTitle,
    required this.selectedRouteName,
    required this.controller,
    this.selectedRouteTitleStyle,
    this.onMenuTap,
    this.onNavItemWebTap,
    this.hasSideTitle = true,
    this.selectedTitleColor = AppColors.black,
    this.titleColor = AppColors.white,
    this.appLogoColor = AppColors.black,
  }) : super(key: key);

  final String selectedRouteTitle;
  final String selectedRouteName;
  final AnimationController controller;
  final TextStyle? selectedRouteTitleStyle;
  final GestureTapCallback? onMenuTap;
  final bool hasSideTitle;
  final Color titleColor;
  final Color selectedTitleColor;
  final Color appLogoColor;

  /// this handles navigation when on desktops
  final Function(String)? onNavItemWebTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double screenWidth = sizingInformation.screenSize.width;

      if (screenWidth <= RefinedBreakpoints().tabletNormal) {
        return mobileNavBar(context);
      } else {
        return webNavBar(context);
      }
    });
  }

  Widget mobileNavBar(BuildContext context) {
    return Container(
      color: AppColors.background,
      width: widthOfScreen(context),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_20,
        vertical: Sizes.PADDING_14,
      ),

      decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          boxShadow: [
            BoxShadow(
              color: AppColors.white,
              offset: const Offset(
                2.0,
                2.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            )
          ],
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(142, 255, 255, 255)),
      // height: 200,
      child: Container(
        // height: 100,
        // width: 200,
        // decoration: BoxDecoration(color: AppColors.errorRed),
        child: Row(
          children: [
            AppLogo(
              fontSize: Sizes.TEXT_SIZE_28,
              titleColor: appLogoColor,
            ),
            Spacer(),
            InkWell(
              onTap: onMenuTap,
              child: Icon(
                FeatherIcons.menu,
                size: Sizes.TEXT_SIZE_30,
                color: appLogoColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget webNavBar(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = selectedRouteTitleStyle ??
        textTheme.bodyLarge?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontSize: Sizes.TEXT_SIZE_22,
        );
    return Container(
      // color: AppColors.background,
      // decoration: BoxDecoration(color: AppColors.white),
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_10,
        vertical: Sizes.PADDING_20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: Sizes.PADDING_2,
              bottom: Sizes.PADDING_2,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.4,
                color: AppColors.white,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.background,
                  offset: const Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 2.0,
                  spreadRadius: 0.5,
                )
              ],
              borderRadius: BorderRadius.circular(30),
              // color: AppColors.white,
              color: AppColors.background,
            ),
            child: Row(
              children: [
                AppLogo(titleColor: appLogoColor),
                Spacer(),
                ..._buildNavItems(context, menuList: Data.menuItems),
                // AeriumButton(
                //   height: Sizes.HEIGHT_30,
                //   hasIcon: false,
                //   width: 70,
                //   buttonColor: AppColors.white,
                //   borderColor: appLogoColor,
                //   onHoverColor: appLogoColor,
                //   title: StringConst.RESUME.toUpperCase(),
                //   onPressed: () {
                //     Functions.launchUrl(DocumentPath.CV);
                //   },
                // ),
              ],
            ),
          ),
          Spacer(),
          hasSideTitle
              ? RotatedBox(
                  quarterTurns: 3,
                  child: AnimatedTextSlideBoxTransition(
                    controller: controller,
                    text: selectedRouteTitle.toUpperCase(),
                    textStyle: style,
                  ),
                )
              : Empty(),
          Spacer(),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems(
    BuildContext context, {
    required List<NavItemData> menuList,
  }) {
    List<Widget> items = [];

    // معکوس کردن لیست
    List<NavItemData> reversedMenuList = menuList.reversed.toList();

    for (int index = 0; index < reversedMenuList.length; index++) {
      items.add(
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0), // فاصله از راست و چپ
          child: NavItem(
            controller: controller,
            title: reversedMenuList[index].name,
            route: reversedMenuList[index].route,
            titleColor: titleColor,
            selectedColor: selectedTitleColor,
            index: index + 1,
            isSelected: reversedMenuList[index].route == selectedRouteName
                ? true
                : false,
            onTap: () {
              if (onNavItemWebTap != null) {
                onNavItemWebTap!(reversedMenuList[index].route);
              }
            },
          ),
        ),
      );
    }
    items.add(SpaceW24());
    return items;
  }
}
