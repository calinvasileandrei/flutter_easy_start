import 'package:flutter/material.dart';
import 'package:flutter_easy_start/app_widgets/logout_alertdialog.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return LogoutAlerDialog();
            }),
        child: Text('Logout', style: Theme.of(context).textTheme.button));
  }
}
