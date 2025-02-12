import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

import 'animated_line_through_text.dart';

const double indicatorWidth = Sizes.WIDTH_60;

class NavItemData {
  final String name;
  final String route;

  NavItemData({
    required this.name,
    required this.route,
  });
}

class NavItem extends StatefulWidget {
  NavItem({
    required this.title,
    required this.route,
    this.index,
    required this.controller,
    this.titleColor = AppColors.black,
    this.selectedColor = AppColors.black,
    this.unselectedColor = AppColors.white, // اضافه شده
    this.selectedTextStyle, // اضافه شده
    this.unselectedTextStyle, // اضافه شده
    this.isSelected = false,
    this.isMobile = false,
    this.titleStyle,
    this.onTap,
  });

  final String title;
  final int? index;
  final String route;
  final TextStyle? titleStyle;
  final Color titleColor;
  final Color selectedColor;
  final Color unselectedColor; // اضافه شده
  final TextStyle? selectedTextStyle; // اضافه شده
  final TextStyle? unselectedTextStyle; // اضافه شده
  final bool isSelected;
  final bool isMobile;
  final AnimationController controller;
  final GestureTapCallback? onTap;

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _hovering = false;
  bool _hoveringUnselectedNavItemMobile = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: AppColors.white,
        child: _buildNavItem(),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }

  void _onMouseEnterUnselectedNavItemMobile(bool hovering) {
    setState(() {
      _hoveringUnselectedNavItemMobile = hovering;
    });
  }

  Widget _buildNavItem() {
    return widget.isMobile ? mobileText() : desktopText();
  }

  Widget mobileText() {
    TextTheme textTheme = Theme.of(context).textTheme;
    double indexTextSize = 50;
    double selectedTextSize = 30;
    double unselectedTextSize = 26;

    // استایل‌های سفارشی برای موبایل
    TextStyle selectedStyle = widget.selectedTextStyle ??
        textTheme.titleLarge?.copyWith(
          fontSize: selectedTextSize,
          color: widget.selectedColor,
          fontWeight: FontWeight.w400,
        ) ??
        TextStyle();

    TextStyle unselectedStyle = widget.unselectedTextStyle ??
        textTheme.bodyLarge?.copyWith(
          fontSize: unselectedTextSize,
          color: widget.unselectedColor,
          fontWeight: FontWeight.w400,
        ) ??
        TextStyle();

    return widget.isSelected
        ? Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(
                    top: (indexTextSize - selectedTextSize) / 3),
                child: Align(
                  alignment: Alignment.center,
                  child: AnimatedLineThroughText(
                    text: widget.title.toLowerCase(),
                    isUnderlinedOnHover: false,
                    textStyle: selectedStyle,
                    hoverColor: widget.selectedColor,
                    coverColor: AppColors.white,
                    lineThickness: 4,
                    onHoverTextStyle: selectedStyle.copyWith(
                      color: widget.selectedColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        : MouseRegion(
            onEnter: (e) => _onMouseEnterUnselectedNavItemMobile(true),
            onExit: (e) => _onMouseEnterUnselectedNavItemMobile(false),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: (indexTextSize - selectedTextSize) / 3),
                  child: Align(
                    alignment: Alignment.center,
                    child: AnimatedLineThroughText(
                      text: widget.title.toLowerCase(),
                      isUnderlinedOnHover: false,
                      textStyle: unselectedStyle,
                      hoverColor: widget.selectedColor,
                      coverColor: AppColors.white,
                      lineThickness: 4,
                      onHoverTextStyle: unselectedStyle.copyWith(
                        color: widget.selectedColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget desktopText() {
    TextTheme textTheme = Theme.of(context).textTheme;

    double textSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_14,
      Sizes.TEXT_SIZE_16,
      md: Sizes.TEXT_SIZE_17,
    );

    // استایل‌های سفارشی برای دسکتاپ
    TextStyle selectedStyle = widget.selectedTextStyle ??
        textTheme.bodyLarge?.copyWith(
          fontSize: textSize,
          color: widget.selectedColor,
          fontWeight: FontWeight.w900,
        ) ??
        TextStyle();

    TextStyle unselectedStyle = widget.unselectedTextStyle ??
        textTheme.bodyLarge?.copyWith(
          fontSize: textSize,
          color: widget.unselectedColor,
        ) ??
        TextStyle();

    return widget.isSelected
        ? AnimatedLineThroughText(
            text: widget.title,
            isUnderlinedOnHover: false,
            hasOffsetAnimation: true,
            hasSlideBoxAnimation: true,
            controller: widget.controller,
            textStyle: selectedStyle,
          )
        : AnimatedLineThroughText(
            text: widget.title,
            isUnderlinedOnHover: false,
            hasOffsetAnimation: true,
            textStyle: unselectedStyle,
            onHoverTextStyle: unselectedStyle.copyWith(
              color: widget.selectedColor,
              fontWeight: FontWeight.w300,
            ),
          );
  }
}
