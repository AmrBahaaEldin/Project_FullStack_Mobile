import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  ToastMessage._();
  static void showToast({
    required Color backGroundColor,
    required String message,
    Color? colorText,
  }) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: backGroundColor,
    textColor: colorText ?? Colors.white,
    fontSize: 16.0,
  );
}
