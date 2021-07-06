import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppToasts{
  static showToastTop({Key? key, required message,required BuildContext context}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor:  Theme.of(context).backgroundColor,
      textColor: Theme.of(context).accentColor,
      fontSize: 16.sp,
    );
  }

  static showToastBottom({Key? key, required message,required BuildContext context}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Theme.of(context).accentColor,
      textColor: Theme.of(context).backgroundColor,
      fontSize: 16.sp,
    );
  }
}


