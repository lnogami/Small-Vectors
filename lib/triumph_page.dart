import 'package:flutter/material.dart';
import 'package:small_vectors/utility_classes/adaptive_dimension.dart';
import 'package:small_vectors/utility_classes/navigation_bar.dart';
import 'package:small_vectors/utility_classes/utilities.dart';

class TriumphPage extends StatefulWidget {
  const TriumphPage({super.key});

  @override
  State<TriumphPage> createState() => TriumphPageState();
}

class TriumphPageState extends State<TriumphPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //expiremental pa ning maintainBottomViewPadding kay wala pa ko kabalo unsa jud ni
        maintainBottomViewPadding: true,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  myAppBar(context),
                  SizedBox(
                      height: MyAdaptiveDimension.horizontalSpaceGap(context)),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(
                          Radius.circular(MyUniformSizes.contentsBorderRadius)),
                    ),
                    // margin: const EdgeInsets.all(10),
                    width: MyAdaptiveDimension.getWidth(context) * .90,
                    height: MyAdaptiveDimension.getHeight(context) * .12,
                  ),
                  SizedBox(
                      height: MyAdaptiveDimension.horizontalSpaceGap(context)),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(
                          Radius.circular(MyUniformSizes.contentsBorderRadius)),
                    ),
                    // margin: const EdgeInsets.all(10),
                    width: MyAdaptiveDimension.getWidth(context) * .90,
                    height: MyAdaptiveDimension.getHeight(context) * .25,
                  ),
                  // const Spacer(),
                ],
              ),
            ),
            Positioned(
              // left: MyAdaptiveDimension.getWidth(context) / 6.5,
              bottom: 40,
              child: MyNavigationBar(1),
            )
          ],
        ),
      ),
    );
  }
}
