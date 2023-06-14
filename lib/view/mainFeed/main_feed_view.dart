// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oua/view/feed/view/feed_view.dart';
import 'package:oua/view/map/view/map_view.dart';
import 'package:oua/view/profile/view/profile_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../core/constants/app/app_constants.dart';
import '../../core/init/theme/app_theme_light.dart';

class MainFeedView extends StatefulWidget {
  MainFeedView({super.key, required this.initialIndex});
  int initialIndex;

  @override
  State<MainFeedView> createState() => _MainFeedViewState();
}

class _MainFeedViewState extends State<MainFeedView> with TickerProviderStateMixin {
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return _willPopScopeDialog(context);
            });
        if (value != null) {
          if (value == true) {
            exit(0);
          }
        }
        return false;
      },
      child: Material(
        color: AppThemeLight.instance.appColorScheme.surface,
        // color: Colors.red,4
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          resizeToAvoidBottomInset: true,
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties:
              const ItemAnimationProperties(duration: Duration(microseconds: 200), curve: Curves.ease),
          screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true, curve: Curves.ease, duration: Duration(milliseconds: 200)),
          navBarStyle: NavBarStyle.style3,
          backgroundColor: AppThemeLight.instance.appColorScheme.surface,
          decoration: const NavBarDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.map_pin_ellipse),
        title: ("Map"),
        activeColorPrimary: AppThemeLight.instance.appColorScheme.secondary,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Feed"),
        activeColorPrimary: AppThemeLight.instance.appColorScheme.secondary,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColorPrimary: AppThemeLight.instance.appColorScheme.secondary,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [const MapView(), const FeedView(), const ProfileView()];
  }

  Widget _willPopScopeDialog(BuildContext context) {
    return AlertDialog(
      content: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Uygulamadan Çık", style: TextStyle(fontFamily: ApplicationConstants.FONT_FAMILY)),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppThemeLight.instance.appColorScheme.surface),
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text("Evet",
                      style: TextStyle(fontFamily: ApplicationConstants.FONT_FAMILY, color: Colors.white))),
            ),
            const SizedBox(width: 7),
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppThemeLight.instance.appColorScheme.surface),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Hayır",
                      style: TextStyle(fontFamily: ApplicationConstants.FONT_FAMILY, color: Colors.white))),
            )
          ],
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
