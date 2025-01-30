import 'package:flutter/material.dart';
import 'package:small_vectors/utility_classes/adaptive_dimension.dart';
import 'package:small_vectors/utility_classes/color_pallete.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: MyColorPallete.appBarColor,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      width: MyAdaptiveDimension.getWidth(context) * .7,
      height: MyAdaptiveDimension.getHeight(context) * .08,
      margin: const EdgeInsets.only(bottom: 15),
    );
  }
}
