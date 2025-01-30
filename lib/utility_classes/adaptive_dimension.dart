//calling the MediaQuery every time a method is used here
// import 'package:flutter/material.dart';

// class MyAdaptiveDimension {

//   static double getWidth(context) {
//     return MediaQuery.of(context).size.width;
//   }

//   static double getHeight(context) {
//     return MediaQuery.of(context).size.height;
//   }

//   static double verticalSpaceGap(context) {
//     return MediaQuery.of(context).size.width * .02;
//   }

//   static double horizontalSpaceGap(context) {
//     return MediaQuery.of(context).size.height * .02;
//   }
// }

//caching method/way
import 'package:flutter/material.dart';

class MyAdaptiveDimension {
  static double _screenWidth = 0;
  static double _screenHeight = 0;

  //an initializer, this method is called in the didChangeDependencies() method in the HomePage class (home_page.dart file)
  static void initiaizeDeviceDimension(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
  }

  static double getWidth(context) {
    return _screenWidth;
  }

  static double getHeight(context) {
    return _screenHeight;
  }

  static double verticalSpaceGap(context) {
    return _screenWidth * .02;
  }

  static double horizontalSpaceGap(context) {
    return _screenHeight * .02;
  }
}
