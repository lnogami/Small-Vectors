import 'package:flutter/material.dart';
import 'package:small_vectors/utility_classes/adaptive_dimension.dart';

//static colors
class MyColorPallete {
  static const appBarColor = Color.fromARGB(255, 180, 217, 253);
  static const navBarColor = Color.fromARGB(255, 86, 142, 214);
  static const cardColor = Color.fromARGB(255, 227, 229, 240);

  static const callToActionButton = Color.fromARGB(255, 37, 157, 238);
  static const clickableIconColor = Color.fromARGB(255, 37, 157, 238);
  static const unselectedIcon = Color.fromARGB(255, 195, 205, 218);
  static const selectedIcon = Color.fromARGB(255, 255, 255, 255);
  static const dissabled = Color.fromARGB(255, 159, 165, 173);
  static const splashColor = Color.fromARGB(59, 124, 181, 255);
}

//static sizes
class MyUniformSizes {
  // static const double appBarHeight = 0.08;
  // static const double horizontalSpaceGap = 0.02;
  // static const double verticalSpaceGap = 0.02;
  static const double contentsBorderRadius = 10;
  static const double navBarBorderRadius = contentsBorderRadius;
  static const double buttonsBorderRadius = 30;
}

//static widgets
Container myAppBar(BuildContext context) {
  return Container(
    color: MyColorPallete.appBarColor,
    width: MyAdaptiveDimension.getWidth(context),
    height: MyAdaptiveDimension.getHeight(context) * .07,
    child: const Center(
      child: Text(
        //Temporary sa ning Text nga Widget, Small Vectors nga logo akong ibutang diri
        'Small Vectors',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
