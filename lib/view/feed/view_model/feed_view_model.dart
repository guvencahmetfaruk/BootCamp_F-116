import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:oua/core/base/model/base_view_model.dart';
import 'package:oua/view/feed/view/feed_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
part 'feed_view_model.g.dart';

class FeedViewModel = _FeedViewModelBase with _$FeedViewModel;

abstract class _FeedViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}

  final PersistentTabController tabController = PersistentTabController(initialIndex: 0);
  List<Widget> buildScreens() {
    return [const TariflerView(), const MekanlarView()];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Page 1",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Page 2",
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      )
    ];
  }
}
