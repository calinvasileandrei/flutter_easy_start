import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/app_shapes.dart';
import 'package:flutter_easy_start/pages/home/home.dart';
import 'package:flutter_easy_start/pages/settings/view/settings_page.dart';
import 'package:flutter_easy_start/tad_widgets/view/drawer/app_drawer.dart';
import 'package:flutter_easy_start/tad_widgets/view/tab_bar/tab_icon.dart';

import '../app_bar/app_bar_view.dart';

class TabBarController extends StatefulWidget {
  TabBarController({Key key}) : super(key: key);

  @override
  _TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController>
    with TickerProviderStateMixin {
  TabController _tabController;
  List<Widget> myTabs;

  // TODO: CHANGE THE APP TAB BAR PAGES AND ICONS

  @override
  void initState() {
    super.initState();
    myTabs = [
      // Customize the NavBar Icons Buttons here \/
      const TabIcon(icon: Icons.home),
      const TabIcon(icon: Icons.explore),
      const TabIcon(icon: Icons.more_horiz)
    ];
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: const AppBarCustom(),
        drawer: AppDrawer(),
        bottomNavigationBar: Container(
          decoration: containerElevationShadow(
              bgColor: Theme.of(context).backgroundColor),
          child: SafeArea(
              child: Theme( //To disable ripple effect on icon click i set this values to transparent
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: TabBar(
            tabs: myTabs,
            controller: _tabController,
          ),
              )),
        ),
        body: Container(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            // Customize the pages here \/
            children: [HomePage(), Container(), SettingsPage()],
          ),
        ),
        extendBody: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
