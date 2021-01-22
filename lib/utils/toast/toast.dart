import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static void show({
    String msg,
    Color bgColor,
    Color textColor = Colors.white,
    double fontSize = 16.0
  }) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.TOP,
      backgroundColor: bgColor,
      textColor: textColor,
      fontSize: fontSize
    );
  }

  static void toast(String msg) {
    show(
      msg: msg,
      bgColor: Colors.black26
    );
  }
}