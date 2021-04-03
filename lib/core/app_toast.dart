
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';


void showToastTop({Key key, message,bgColor}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor:  bgColor,
    textColor: Colors.red,
    fontSize: 16.0,
  );
}

void showToastBottom({Key key, message,bgColor}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor:  bgColor,
    textColor: Colors.red,
    fontSize: 16.0,
  );
}
