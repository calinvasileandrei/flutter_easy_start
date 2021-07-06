import 'package:flutter/material.dart';

// TODO: CHANGE APP CUSTOM SHAPES

/// Custom shapes for easy implementation for rounded borders ecc..

class AppShapes{

  static const _circularRadius = 16.0;

  static BorderRadius appBorderRadius = BorderRadius.circular(_circularRadius);

  static Decoration containerElevationShadow({Key? key, bgColor}) {
    return BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.all(Radius.circular(_circularRadius)),
      boxShadow: [
        BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10,),
      ],

    );
  }

  static RoundedRectangleBorder appCardShape = RoundedRectangleBorder(
    borderRadius: appBorderRadius,
  );

  static OutlineInputBorder appInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(_circularRadius),
    borderSide: BorderSide(color: Colors.black26, width: 1.0),
  );
}
