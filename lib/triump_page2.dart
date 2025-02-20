import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:small_vectors/triumph_page.dart';
import 'package:small_vectors/utility_classes/adaptive_dimension.dart';
import 'package:small_vectors/utility_classes/utilities.dart';

class TriumphPage2 extends StatefulWidget {
  const TriumphPage2({super.key});

  @override
  State<TriumphPage2> createState() => TriumphPage2State();
}

class TriumphPage2State extends State<TriumphPage2> {
  // @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Column(
              children: [
                // myAppBar(context),
                // SizedBox(
                //   height: MyAdaptiveDimension.horizontalSpaceGap(context),
                // ),
                Expanded(
                  child: GestureDetector(
                    onLongPress: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TriumphPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
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
                      width: MyAdaptiveDimension.getWidth(context),
                      height: MyAdaptiveDimension.getHeight(context),
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
            bottom: 80,
            child: Container(
              width: 80,
              height: 30,
              color: Colors.amber,
              child: const Center(child: Text("Hello")),
            ),
          )
        ],
      ),
    );
  }
}

BorderRadius imageBorderRadius = const BorderRadius.all(
  Radius.circular(MyUniformSizes.contentsBorderRadius),
);
