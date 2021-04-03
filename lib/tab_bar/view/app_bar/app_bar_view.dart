import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/app_constants.dart';
import 'package:flutter_easy_start/core/app_theme/app_theme.dart';

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
        title: const Text(appName));
  }
}
