import 'package:flutter/material.dart';
import 'package:oua/view/authanticate/login/view/login_view.dart';
import 'package:oua/view/authanticate/register/view/register_view.dart';
import 'package:oua/view/mainFeed/main_feed_view.dart';
import 'package:oua/view/map/view/map_view.dart';
import 'package:oua/view/profile/view/profile_view.dart';

import '../../../view/_product/widgets/not_found_nav_widget.dart';
import '../../../view/feed/view/feed_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigatie(MainFeedView(initialIndex: 1), NavigationConstants.DEFAULT);

      case NavigationConstants.FEED:
        return normalNavigatie(const FeedView(), NavigationConstants.DEFAULT);

      case NavigationConstants.MAINFEED:
        return normalNavigatie(MainFeedView(initialIndex: 0), NavigationConstants.DEFAULT);

      case NavigationConstants.MAP:
        return normalNavigatie(const MapView(), NavigationConstants.DEFAULT);

      case NavigationConstants.PROFILE:
        return normalNavigatie(ProfileView(), NavigationConstants.DEFAULT);

      case NavigationConstants.LOGIN:
        return normalNavigatie(const LoginView(), NavigationConstants.DEFAULT);

      case NavigationConstants.REGISTER:
        return normalNavigatie(RegisterView(), NavigationConstants.DEFAULT);

      default:
        return MaterialPageRoute(builder: (context) => const NotFoundNavigationWidget());
    }
  }

  MaterialPageRoute normalNavigatie(Widget widget, String pageName) {
    return MaterialPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}
