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
  bool isAbleToAddVictory = true;
  bool isKeyboardVisible = false;
  final double _bottomBasePosition = -50;

//controlls textfield inputs
  TextEditingController _victoryTitleController = TextEditingController();
  TextEditingController _victoryDescriptionController = TextEditingController();
  var focusTitle = FocusNode();
  bool _isTitleNotEmpty = false;
  bool _isDescriptionNotEmpty = false;

  // bool isAbleToAddVictory = false;
  // void delayer() async {
  //   await Future.delayed(const Duration(microseconds: 500));
  //   setState(() {
  //     isAbleToAddVictory = true;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    //listeners automatically calls set state if there are changes happening to the widget
    _victoryTitleController.addListener(() {
      setState(() {
        _isTitleNotEmpty = _victoryTitleController.text.isNotEmpty;
      });
    });
    _victoryDescriptionController.addListener(() {
      setState(() {
        _isDescriptionNotEmpty = _victoryDescriptionController.text.isNotEmpty;
      });
    });
  }

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
            Positioned(
              top: 0,
              child: myAppBar(context),
            ),
            Positioned(
              top: MyAdaptiveDimension.getHeight(context) * .095,
              child: GestureDetector(
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
            ),
            // const Spacer(),
            Positioned(
              // bottom: 140,
              top: MyAdaptiveDimension.getHeight(context) * .675,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      // _slidingPanel(context);
                      // Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const TriumphPage2(),
                      //   ),
                      // );
                      setState(() {
                        isAbleToAddVictory = true;
                      });
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
                  SizedBox(
                      height: MyAdaptiveDimension.verticalSpaceGap(context)),
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
            ),
            Positioned(
              bottom: 25,
              child: MyNavigationBar(1),
            ),
            AnimatedPositioned(
              bottom: _bottomBasePosition,
              width: MyAdaptiveDimension.getWidth(context),
              height: (isAbleToAddVictory)
                  ? MyAdaptiveDimension.getHeight(context) * .65
                  : 0,
              duration: const Duration(milliseconds: 500),
              // curve: Curves.fastOutSlowIn,
              child: AnimatedOpacity(
                  opacity: (isAbleToAddVictory) ? 1.0 : 0,
                  duration: const Duration(milliseconds: 600),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: MyColorPallete.semiTransparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MyUniformSizes.contentsBorderRadius),
                        topRight: Radius.circular(
                            MyUniformSizes.contentsBorderRadius),
                      ),
                    ),
                    //OverFlowBox allows the child "Column" to overextend its height than its parent "AnimatedPositioned" size"
                    child: OverflowBox(
                      maxHeight: double.infinity,
                      child: Column(
                        children: [
                          (isAbleToAddVictory)
                              ? SizedBox(
                                  height: (isAbleToAddVictory)
                                      ? MyAdaptiveDimension.horizontalSpaceGap(
                                              context) *
                                          5
                                      : 0,
                                  child: const Center(
                                    child: Text(
                                      "New Victory!",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          (isAbleToAddVictory)
                              ? Container(
                                  width: MyAdaptiveDimension.getWidth(context) *
                                      .80,
                                  height:
                                      MyAdaptiveDimension.getHeight(context) *
                                          .05,
                                  decoration: BoxDecoration(
                                    // color: MyColorPallete.selectedIcon,
                                    borderRadius: BorderRadius.circular(
                                      MyUniformSizes.contentsBorderRadius,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: _victoryTitleController,
                                    maxLength: 35,
                                    decoration: InputDecoration(
                                      counterText: "",
                                      labelText: "Add Your Victory",
                                      contentPadding: const EdgeInsets.all(10),
                                      hintText:
                                          "I achieve a 50/50 score in UGE 2",
                                      hintStyle: const TextStyle(
                                        color: MyColorPallete.unselectedIcon,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      filled: true,
                                      fillColor: MyColorPallete.selectedIcon,
                                      focusColor:
                                          MyColorPallete.callToActionButton,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          MyUniformSizes.contentsBorderRadius,
                                        ),
                                      ),
                                    ),
                                  ))
                              : const SizedBox(),
                          SizedBox(
                              height: MyAdaptiveDimension.horizontalSpaceGap(
                                  context)),
                          (isAbleToAddVictory)
                              ? Container(
                                  width: MyAdaptiveDimension.getWidth(context) *
                                      .80,
                                  height:
                                      MyAdaptiveDimension.getHeight(context) *
                                          .25,
                                  decoration: BoxDecoration(
                                    // color: MyColorPallete.selectedIcon,
                                    borderRadius: BorderRadius.circular(
                                      MyUniformSizes.contentsBorderRadius,
                                    ),
                                  ),
                                  child: TextField(
                                    // minLines: 5,
                                    // maxLines: 10,
                                    controller: _victoryDescriptionController,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      labelText: "Victorious Description",
                                      hintText:
                                          "State the detail of what you have just achieved, and how you achieved the thing or moment that you considered as a small victory in your life. \n\n",
                                      hintStyle: const TextStyle(
                                        color: MyColorPallete.unselectedIcon,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      filled: true,
                                      fillColor: MyColorPallete.selectedIcon,
                                      focusColor:
                                          MyColorPallete.callToActionButton,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          MyUniformSizes.contentsBorderRadius,
                                        ),
                                      ),
                                    ),
                                  ))
                              : const SizedBox(),
                          (isAbleToAddVictory)
                              ? Container(
                                  // color: Colors.amber,
                                  height:
                                      MyAdaptiveDimension.horizontalSpaceGap(
                                              context) *
                                          2,
                                )
                              : const SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              (isAbleToAddVictory)
                                  ? InkWell(
                                      borderRadius: BorderRadius.circular(50),
                                      onTap: () {
                                        setState(() {
                                          isAbleToAddVictory = false;
                                        });
                                      },
                                      child: Container(
                                        width: MyAdaptiveDimension.getWidth(
                                                context) *
                                            .30,
                                        height: MyAdaptiveDimension.getWidth(
                                                context) *
                                            .13,
                                        decoration: const BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color: MyColorPallete.cancelButton,
                                          //     blurRadius: 1.0,
                                          //     spreadRadius: 0.5,
                                          //     offset: Offset(0.0, 1.0),
                                          //   )
                                          // ],
                                          color: MyColorPallete.cancelButton,
                                          // color: MyColorPallete.appBarColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                        child:
                                            const Center(child: Text("Cancel")),
                                      ),
                                    )
                                  : const SizedBox(),
                              (isAbleToAddVictory)
                                  ? InkWell(
                                      borderRadius: BorderRadius.circular(50),
                                      onTap: () {
                                        // Navigator.pop(context);
                                        // // setState(() => _isDropdownPressed = false);
                                      },
                                      child: Container(
                                        width: MyAdaptiveDimension.getWidth(
                                                context) *
                                            .30,
                                        height: MyAdaptiveDimension.getWidth(
                                                context) *
                                            .13,
                                        decoration: BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color:
                                          //         MyColorPallete.callToActionButton,
                                          //     blurRadius: .8,
                                          //     spreadRadius: 0.2,
                                          //     offset: Offset(0.0, 1.0),
                                          //   )
                                          // ],
                                          color: (_isTitleNotEmpty &&
                                                  _isDescriptionNotEmpty)
                                              ? MyColorPallete
                                                  .callToActionButton
                                              : MyColorPallete.dissabled,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                        child:
                                            const Center(child: Text("Save")),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  // ),
                  ),
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

//still unimplemented
// bool _victoryTitleIsNotEmpty(
//     TextEditingController theTextFieldToDetermineIfNotEmpty) {
//   //mo process ra ni
//   return (theTextFieldToDetermineIfNotEmpty.text.isNotEmpty) ? true : false;
// }

// Container _slidingPanel(BuildContext context) {
//     return Container(
//       width: MyAdaptiveDimension.getWidth(context),
//       height: MyAdaptiveDimension.getHeight(context) * .40,
//       color: Colors.grey,
//   );
// }
