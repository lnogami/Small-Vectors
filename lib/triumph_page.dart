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
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
              // left: MyAdaptiveDimension.getWidth(context) / 6.5,
              bottom: 25,
              child: MyNavigationBar(1),
            )
          ],
        ),
      ),
    );
  }
}

BorderRadius imageBorderRadius = const BorderRadius.all(
  Radius.circular(MyUniformSizes.contentsBorderRadius),
);
