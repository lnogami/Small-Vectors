import 'package:flutter/material.dart';

class MyAdaptiveDimension {
  static double _screenWidth = 0;
  static double _screenHeight = 0;

  static double width(context) {
    return _screenWidth = MediaQuery.of(context).size.width;
  }

  static double height(context) {
    return _screenWidth = MediaQuery.of(context).size.height;
  }

  static double verticalSpaceGap(context) {
    return _screenWidth = MediaQuery.of(context).size.width * .02;
  }

  static double horizontalSpaceGap(context) {
    return _screenWidth = MediaQuery.of(context).size.height * .02;
  }
}
