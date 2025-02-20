import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets/empty.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/presentation/widgets_1/animated_text_slide_box_transition.dart';
import 'package:aerium/presentation/widgets_1/app_logo.dart';
import 'package:aerium/presentation/widgets_1/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aerium/infrastructure/music_bloc/music_bloc.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBar extends StatelessWidget {
  final String selectedRouteTitle;
  final String selectedRouteName;
  final AnimationController controller;
  final TextStyle? selectedRouteTitleStyle;
  final GestureTapCallback? onMenuTap;
  final bool hasSideTitle;
  final Color titleColor;
  final Color selectedTitleColor;
  final Color appLogoColor;
  final Function(String)? onNavItemWebTap;

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

  @override
  Widget build(BuildContext context) {
    final musicBloc = BlocProvider.of<MusicBloc>(context);

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double screenWidth = sizingInformation.screenSize.width;

      if (screenWidth <= RefinedBreakpoints().tabletNormal) {
        return mobileNavBar(context, musicBloc);
      } else {
        return webNavBar(context, musicBloc);
      }
    });
  }

  Widget mobileNavBar(BuildContext context, MusicBloc musicBloc) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallMobile = screenWidth < 360;

    return BlocBuilder<MusicBloc, MusicState>(
      builder: (context, state) {
        bool isMuted = state is MusicPlaying ? state.isMuted : false;

        return Container(
          color: AppColors.background,
          width: widthOfScreen(context),
          padding: EdgeInsets.symmetric(
            horizontal: isSmallMobile ? Sizes.PADDING_10 : Sizes.PADDING_20,
            vertical: isSmallMobile ? Sizes.PADDING_8 : Sizes.PADDING_14,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.white),
            boxShadow: [
              BoxShadow(
                color: AppColors.white,
                offset: const Offset(2.0, 2.0),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ],
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromARGB(142, 255, 255, 255),
          ),
          child: Row(
            children: [
              AppLogo(
                fontSize:
                    isSmallMobile ? Sizes.TEXT_SIZE_20 : Sizes.TEXT_SIZE_28,
                titleColor: appLogoColor,
              ),
              Spacer(),
              // آیکن کنترل موزیک
              IconButton(
                icon: Icon(
                  isMuted ? Icons.music_off : Icons.music_note,
                  color: AppColors.white,
                ),
                onPressed: () {
                  musicBloc.add(ToggleMuteEvent()); // قطع یا باز کردن صدا
                },
              ),
              InkWell(
                onTap: onMenuTap,
                child: Icon(
                  FeatherIcons.menu,
                  size: isSmallMobile ? Sizes.TEXT_SIZE_24 : Sizes.TEXT_SIZE_30,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget webNavBar(BuildContext context, MusicBloc musicBloc) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = selectedRouteTitleStyle ??
        textTheme.bodyLarge?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontSize: Sizes.TEXT_SIZE_22,
        );

    return BlocBuilder<MusicBloc, MusicState>(
      builder: (context, state) {
        bool isMuted = state is MusicPlaying ? state.isMuted : false;

        return Container(
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
                      offset: const Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      spreadRadius: 0.5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.background,
                ),
                child: Row(
                  children: [
                    AppLogo(titleColor: appLogoColor),
                    Spacer(),
                    // آیکن کنترل موزیک
                    IconButton(
                      icon: Icon(
                        isMuted ? Icons.music_off : Icons.music_note,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        musicBloc.add(ToggleMuteEvent()); // قطع یا باز کردن صدا
                      },
                    ),
                    ..._buildNavItems(context, menuList: Data.menuItems),
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
      },
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: NavItem(
            controller: controller,
            title: reversedMenuList[index].name,
            route: reversedMenuList[index].route,
            titleColor: titleColor,
            selectedColor: selectedTitleColor,
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
