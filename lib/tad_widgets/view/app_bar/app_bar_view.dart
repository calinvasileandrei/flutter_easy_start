import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/app_constants.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({Key key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 2,
        backgroundColor: Theme.of(context).backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          appName,
          style: Theme.of(context).textTheme.headline1,
        ));
  }
}
