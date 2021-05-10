import 'package:flutter/material.dart';

// TODO: CHANGE APP CUSTOM SHAPES

/// Custom shapes for easy implementation for rounded borders ecc..

const _circularRadius = 24.0;

BorderRadius appBorderRadius = BorderRadius.circular(_circularRadius);

Decoration containerElevationShadow({Key key, bgColor}) {
  return BoxDecoration(
    color: bgColor,
    borderRadius: BorderRadius.all(Radius.circular(_circularRadius)),
    boxShadow: [
      BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10),
    ],
  );
}

RoundedRectangleBorder appCardShape = RoundedRectangleBorder(
  borderRadius: appBorderRadius,
);

OutlineInputBorder appInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(_circularRadius),
  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
);
