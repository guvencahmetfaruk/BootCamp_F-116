import 'package:flutter/material.dart';
import 'package:oua/core/base/view/base_view.dart';
import 'package:oua/view/_product/widgets/post_widget.dart';
import 'package:oua/view/feed/view_model/feed_view_model.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../core/constants/app/app_constants.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: FeedViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, vm) => Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: AppBar(
                  centerTitle: true,
                  title: const Text(ApplicationConstants.APP_NAME, style: TextStyle(color: Colors.black)),
                ),
              ),
              body: PersistentTabView(
                context,
                controller: vm.tabController,
                screens: vm.buildScreens(),
                items: vm.navBarsItems(),
                confineInSafeArea: true,
                backgroundColor: Colors.white,
                handleAndroidBackButtonPress: true,
                resizeToAvoidBottomInset: true,
                stateManagement: true,
                hideNavigationBarWhenKeyboardShows: true,
                popAllScreensOnTapOfSelectedTab: true,
                itemAnimationProperties: const ItemAnimationProperties(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceOut,
                ),
                screenTransitionAnimation: const ScreenTransitionAnimation(
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle.style12,
              ),
            ));
  }
}

class TariflerView extends StatelessWidget {
  const TariflerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return const PostView();
          },
        ),
      ),
    );
  }
}

class MekanlarView extends StatelessWidget {
  const MekanlarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("mekanlar")),
    );
  }
}
