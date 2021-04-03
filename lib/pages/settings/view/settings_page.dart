import 'package:flutter/material.dart';
import 'package:flutter_easy_start/app_widgets/logout_button.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Column(
      children: [
        const Text('SettingsPage'),
        LogoutButton()
      ],
    )));
  }
}
