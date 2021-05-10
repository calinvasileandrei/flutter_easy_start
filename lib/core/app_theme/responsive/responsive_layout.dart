import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/app_theme/responsive/responsive_breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key key,
    @required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  }) : super(key: key);

  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        if (dimens.maxWidth < kTabletBreakpoint) {
          return mobileBody;
        } else if (dimens.maxWidth >= kTabletBreakpoint &&
            dimens.maxWidth < kDesktopBreakPoint) {
          return tabletBody ?? mobileBody;
        } else {
          return desktopBody ?? mobileBody;
        }
      },
    );
  }
}
