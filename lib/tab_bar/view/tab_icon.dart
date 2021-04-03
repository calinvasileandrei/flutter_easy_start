import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TabIcon extends StatelessWidget {
  const TabIcon({Key key, this.callback, @required this.icon})
      : super(key: key);

  final callback;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      width: 50,
      child: Tab(
        icon: IconButton(
          onPressed: callback,
          icon: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
