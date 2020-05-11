import 'package:flutter/material.dart';

abstract class CommonFunctions {
  static void openPage(BuildContext context, dynamic page) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}