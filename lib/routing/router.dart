import 'package:flutter/material.dart';
import 'package:flutter_easy_start/pages/home/home.dart';
import 'package:flutter_easy_start/routing/router_constants.dart';
import 'package:flutter_easy_start/pages/settings/settings.dart';
import 'package:flutter_easy_start/tad_widgets/view/tab_bar/tab_bar_controller.dart';

class AppRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var parameters = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RoutingConstants.tabControllerPageRoute:
        return MaterialPageRoute(builder: (context) => TabBarController());
      case RoutingConstants.homePageRoute:
        return MaterialPageRoute(builder: (context) => HomePage());
      case RoutingConstants.settingsPageRoute:
        return MaterialPageRoute(builder: (context) => SettingsPage());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}

