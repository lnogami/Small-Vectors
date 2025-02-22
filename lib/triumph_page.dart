import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:small_vectors/triump_page2.dart';
import 'package:small_vectors/utility_classes/adaptive_dimension.dart';
import 'package:small_vectors/utility_classes/navigation_bar.dart';
import 'package:small_vectors/utility_classes/utilities.dart';

class TriumphPage extends StatefulWidget {
  const TriumphPage({super.key});

  @override
  State<TriumphPage> createState() => TriumphPageState();
}

class TriumphPageState extends State<TriumphPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Ensures no black space at the top
      systemNavigationBarColor:
          Colors.transparent, // Ensures no black bar at the bottom
    ));
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

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
                    height: MyAdaptiveDimension.horizontalSpaceGap(context),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TriumphPage2(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: MyColorPallete.unselectedIcon,
                            blurRadius: 3.0,
                            spreadRadius: 0.0,
                            offset: Offset(0.0, 1.0),
                          )
                        ],
                        borderRadius: imageBorderRadius,
                      ),
                      width: MyAdaptiveDimension.getWidth(context) * .90,
                      height: MyAdaptiveDimension.getHeight(context) * .55,
                      child: ClipRRect(
                        borderRadius: imageBorderRadius,
                        child: Image.asset(
                          "assets/images/sample tree.png",
                          fit: BoxFit.cover,
                          // repeat: ImageRepeat.noRepeat,
                          isAntiAlias: true,
                        ),
                      ),
                    ),
                  ),
                  // const Spacer(),
                ],
              ),
            ),
            Positioned(
              // bottom: 140,
              bottom: MyAdaptiveDimension.getHeight(context) * .17,
              child: theTwoButtonsAboveNavBar(context),
            ),
            Positioned(
              // left: MyAdaptiveDimension.getWidth(context) / 6.5,
              bottom: 25,
              child: MyNavigationBar(1),
            ),
          ],
        ),
      ),
    );
  }
}

BorderRadius imageBorderRadius = const BorderRadius.all(
  Radius.circular(MyUniformSizes.contentsBorderRadius),
);

Widget theTwoButtonsAboveNavBar(BuildContext context) {
  // double uniformWidth = MyAdaptiveDimension.getWidth(context) * .40;
  // double uniformHeight = MyAdaptiveDimension.getHeight(context) * .15;

  return SizedBox(
    width: MyAdaptiveDimension.getWidth(context) * .40,
    height: MyAdaptiveDimension.getHeight(context) * .15,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            // Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const TriumphPage2(),
            //   ),
            // );
          },
          child: Container(
            width: MyAdaptiveDimension.getWidth(context) * .40,
            height: MyAdaptiveDimension.getWidth(context) * .13,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: MyColorPallete.dissabled,
                  blurRadius: 1.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 1.0),
                )
              ],
              color: MyColorPallete.callToActionButton,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: const Center(child: Text("Add Victory")),
          ),
        ),
        SizedBox(height: MyAdaptiveDimension.verticalSpaceGap(context)),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            // Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const TriumphPage2(),
            //   ),
            // );
          },
          child: Container(
            width: MyAdaptiveDimension.getWidth(context) * .40,
            height: MyAdaptiveDimension.getWidth(context) * .13,
            decoration: const BoxDecoration(
              color: MyColorPallete.cardColor,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: const Center(child: Text("Show Vectors")),
          ),
        ),
      ],
    ),
  );
}
