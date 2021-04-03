import 'package:flutter/material.dart';
import 'package:flutter_easy_start/pages/home/home.dart';
import 'package:flutter_easy_start/routing/router_constants.dart';
import 'package:flutter_easy_start/pages/settings/settings.dart';
import 'package:flutter_easy_start/tab_bar/view/tab_bar_controller.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // ignore: unused_local_variable
  var parameters = settings.arguments as Map<String, dynamic>;
  switch (settings.name) {
    case tabControllerPageRoute:
      return MaterialPageRoute(builder: (context) => TabBarController());
    case homePageRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case settingsPageRoute:
      return MaterialPageRoute(builder: (context) => SettingsPage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
