import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/app_constants.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 2,
        backgroundColor: Theme.of(context).backgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu,color: Theme.of(context).hintColor,),
          onPressed: () { Scaffold.of(context).openDrawer(); },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        title: Text(
          AppConstants.appName,
          style: Theme.of(context).textTheme.headline5,
        ));
  }
}
