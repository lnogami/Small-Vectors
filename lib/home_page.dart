import 'package:flutter/material.dart';
import 'package:small_vectors/utility_classes/adaptive_dimension.dart';
import 'package:small_vectors/utility_classes/color_pallete.dart';
import 'package:small_vectors/utility_classes/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override //runs after initializing the state of this class
  void didChangeDependencies() {
    super.didChangeDependencies();
    MyAdaptiveDimension.initiaizeDeviceDimension(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //expiremental pa ning maintainBottomViewPadding kay wala pa ko kabalo unsa jud ni
        maintainBottomViewPadding: true,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: MyColorPallete.appBarColor,
                  width: MyAdaptiveDimension.getWidth(context),
                  height: MyAdaptiveDimension.getHeight(context) * .08,
                ),
                SizedBox(
                    height: MyAdaptiveDimension.horizontalSpaceGap(context)),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  // margin: const EdgeInsets.all(10),
                  width: MyAdaptiveDimension.getWidth(context) * .90,
                  height: MyAdaptiveDimension.getHeight(context) * .12,
                ),
                SizedBox(
                    height: MyAdaptiveDimension.horizontalSpaceGap(context)),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  // margin: const EdgeInsets.all(10),
                  width: MyAdaptiveDimension.getWidth(context) * .90,
                  height: MyAdaptiveDimension.getHeight(context) * .25,
                ),
                // const Spacer(),
              ],
            ),
            Positioned(
              left: MyAdaptiveDimension.getWidth(context) / 6.5,
              bottom: 10,
              child: const MyNavigationBar(),
            )
          ],
        ),
      ),
    );
  }
}
