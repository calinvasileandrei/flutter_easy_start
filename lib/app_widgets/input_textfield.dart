import 'package:flutter/material.dart';
import 'package:flutter_easy_start/core/app_shapes.dart';

class InputTextField extends StatelessWidget {
  final double width;
  final double? height;
  final TextEditingController controller;
  final bool enabledTextField;
  final String hintText;
  final IconData icon;
  final double marginVertical;
  final double marginHorizontal;
  final bool obfuscaredText;

  InputTextField(
      {Key? key,
      required this.width,
      this.height,
      required this.controller,
      required this.enabledTextField,
      required this.icon,
      this.hintText = '',
      this.marginVertical = 0,
      this.marginHorizontal = 0,
      this.obfuscaredText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: marginVertical, horizontal: marginHorizontal),
        width: width,
        height: height,
        child: TextField(
          obscureText: obfuscaredText,
          controller: controller,
          style: Theme.of(context).textTheme.bodyText1,
          textAlignVertical: TextAlignVertical.center,
          enabled: enabledTextField,
          decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.grey,
              ),
              border: AppShapes.appInputBorder,
              focusedBorder: AppShapes.appInputBorder,
              enabledBorder: AppShapes.appInputBorder,
              hintText: hintText),
        ));
  }
}
