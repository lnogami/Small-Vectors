import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:small_vectors/triumph_page.dart';
import 'package:small_vectors/utility_classes/adaptive_dimension.dart';
import 'package:small_vectors/utility_classes/utilities.dart';
import 'package:small_vectors/utility_classes/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //object reference variables
  late ScrollController _scrollController;

  // ignore: prefer_final_fields
  int _accumulatedVectors = 2;

  bool _isDropdownPressed = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override //runs after initializing the state of this class
  void didChangeDependencies() {
    super.didChangeDependencies();
    MyAdaptiveDimension.initiaizeDeviceDimension(context);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Ensures no black space at the top
      systemNavigationBarColor:
          Colors.transparent, // Ensures no black bar at the bottom
    ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  //mag animate ra ni sa listview para mura syag buhay na buhay tan awon
  void _animateListView() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });
  }

//for showing the modal sheet
  void _showModalSheet() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          width: MyAdaptiveDimension.getWidth(context),
          height: MyAdaptiveDimension.getHeight(context) * .50,
          color: MyColorPallete.cardColor,
          child: Column(
            children: [
              SizedBox(
                height: MyAdaptiveDimension.getHeight(context) * .015,
              ),
              SizedBox(
                height: MyAdaptiveDimension.getHeight(context) * .04,
                child: const Text("2025 Vector Treeee"),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        color: MyColorPallete.dissabled,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(MyUniformSizes.contentsBorderRadius),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: MyColorPallete.cardColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      // margin: const EdgeInsets.all(10),
                      width: MyAdaptiveDimension.getWidth(context) * .90,
                      height: MyAdaptiveDimension.getHeight(context) * .25,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        color: MyColorPallete.dissabled,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(MyUniformSizes.contentsBorderRadius),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: MyColorPallete.cardColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      // margin: const EdgeInsets.all(10),
                      width: MyAdaptiveDimension.getWidth(context) * .90,
                      height: MyAdaptiveDimension.getHeight(context) * .25,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _isDropdownPressed = false);
                },
                child: Container(
                  width: MyAdaptiveDimension.getWidth(context) * .25,
                  height: MyAdaptiveDimension.getWidth(context) * .13,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: MyColorPallete.dissabled,
                        blurRadius: 1.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                    color: MyColorPallete.appBarColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Center(child: Text("Close")),
                ),
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //for animation purposes ra ni
    _animateListView();

    return Scaffold(
      body: SafeArea(
        //expiremental pa ning maintainBottomViewPadding kay wala pa ko kabalo unsa jud ni
        maintainBottomViewPadding: true,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    myAppBar(context),
                    SizedBox(
                      height:
                          MyAdaptiveDimension.horizontalSpaceGap(context) * 1.5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColorPallete.cardColor.withOpacity(0.7),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(MyUniformSizes.contentsBorderRadius),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: MyColorPallete.cardColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      // margin: const EdgeInsets.all(10),
                      width: MyAdaptiveDimension.getWidth(context) * .90,
                      height: MyAdaptiveDimension.getHeight(context) * .1,
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 5),
                              child: Text(
                                // "\"Finding is reserved for those who search\"",
                                "\"The ones who are crazy enough to think that they can change the world are the ones who do.\"",
                                softWrap: true,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                  // fontFamily: "Georgia",
                                ),
                              ),
                            ),
                            Text(
                              "-Steve Jobs",
                              style: TextStyle(fontSize: 10),
                            ),
                            // Positioned(
                            //   right: 0,
                            //   bottom: -5,
                            //   child: Text("-Jim Rohn"),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MyAdaptiveDimension.horizontalSpaceGap(context),
                    ),
                    //butangan ug dropdown button
                    InkWell(
                      borderRadius: const BorderRadius.only(
                        topLeft:
                            Radius.circular(MyUniformSizes.buttonsBorderRadius),
                        topRight:
                            Radius.circular(MyUniformSizes.buttonsBorderRadius),
                      ),
                      splashColor: MyColorPallete.splashColor,
                      onTap: () {
                        (_isDropdownPressed)
                            ? setState(() => _isDropdownPressed = false)
                            : setState(() => _isDropdownPressed = true);
                        _showModalSheet();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 8, right: 1),
                        width: MyAdaptiveDimension.getWidth(context) * .5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "2025 Vector Tree",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              (_isDropdownPressed)
                                  ? Icons.arrow_drop_down_rounded
                                  : Icons.arrow_drop_up_rounded,
                              color: MyColorPallete.clickableIconColor,
                              size: MyAdaptiveDimension.getWidth(context) * .09,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MyColorPallete.cardColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(MyUniformSizes.contentsBorderRadius),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: MyColorPallete.cardColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      // margin: const EdgeInsets.all(10),
                      width: MyAdaptiveDimension.getWidth(context) * .90,
                      height: MyAdaptiveDimension.getHeight(context) * .25,
                    ),
                    SizedBox(
                      height: MyAdaptiveDimension.getHeight(context) * .01,
                    ),
                    //para mo balhin sya sa TriumphPage with swipe to left
                    GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity! < 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TriumphPage(),
                            ),
                          );
                        }
                      },
                      child: Column(
                        children: [
                          // ignore: sized_box_for_whitespace
                          Container(
                            height: MyAdaptiveDimension.getHeight(context) * .1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MyAdaptiveDimension.horizontalSpaceGap(
                                              context) *
                                          .35,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Your last victory was on: "),
                                    Text(
                                      "2025-01-23",
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MyAdaptiveDimension.horizontalSpaceGap(
                                              context) *
                                          .10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("You accumulated "),
                                    Text(
                                      _accumulatedVectors.toString(),
                                      style: const TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const Text(" vectors within this week!"),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MyAdaptiveDimension.horizontalSpaceGap(
                                              context) *
                                          .35,
                                ),
                                const Text(
                                  "Good Job!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:
                          MyAdaptiveDimension.horizontalSpaceGap(context) * .35,
                    ),
                    const SizedBox(
                      child: Center(
                        child: Text("Previoud Victories"),
                      ),
                    ),
                    SizedBox(
                        width: MyAdaptiveDimension.getWidth(context) * .90,
                        height: MyAdaptiveDimension.getHeight(context) * .42,
                        child: Scrollbar(
                          // thumbVisibility: true,
                          radius: const Radius.circular(30),
                          trackVisibility: true,
                          child: ListView.builder(
                            itemCount: 30,
                            reverse: true,
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Column(
                                    children: [
                                      Text(
                                        "Victory $index",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        "Date: 2021-10-10",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  leading: const Icon(
                                    Icons.emoji_events_rounded,
                                    color: Color.fromARGB(255, 244, 196, 51),
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => DetailScreen(),
                                    //   ),
                                    // );
                                  },
                                ),
                              );
                            },
                          ),
                        )),
                    // const Spacer(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(10, 255, 255, 255),
                        Color.fromARGB(20, 255, 255, 255),
                        Color.fromARGB(45, 255, 255, 255),
                        Color.fromARGB(95, 255, 255, 255),
                        Color.fromARGB(150, 255, 255, 255),
                        Color.fromARGB(190, 255, 255, 255),
                        Color.fromARGB(222, 255, 255, 255),
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 255, 255, 255),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(MyUniformSizes.contentsBorderRadius))),
                width: MyAdaptiveDimension.getWidth(context),
                height: MyAdaptiveDimension.getHeight(context) * .20,
              ),
            ),
            Positioned(
              // left: MyAdaptiveDimension.getWidth(context) / 6.5,
              bottom: 25,
              child: MyNavigationBar(0),
            )
          ],
        ),
      ),
    );
  }
}
