import 'package:flutter/material.dart';
import 'package:small_vectors/home_page.dart';
import 'package:small_vectors/triumph_page.dart';
import 'package:small_vectors/utility_classes/adaptive_dimension.dart';
import 'package:small_vectors/utility_classes/utilities.dart';

// ignore: must_be_immutable
class MyNavigationBar extends StatefulWidget {
  int pageIndex;
  MyNavigationBar(this.pageIndex, {super.key});

  @override
  State<MyNavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<MyNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.pageIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Widget page;
    if (index == 0) {
      page = const HomePage();
    } else if (index == 1) {
      page = const TriumphPage();
    } else if (index == 2) {
      page = const HomePage();
    } else {
      return;
    }

    // Future.delayed(const Duration(milliseconds: 1000), () {
    Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      // );
      // }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColorPallete.navBarColor,
        borderRadius: BorderRadius.all(
          Radius.circular(MyUniformSizes.navBarBorderRadius),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color.fromARGB(50, 6, 94, 202),
        //     offset: Offset(0, 4),
        //     blurRadius: 2.0,
        //     blurStyle: BlurStyle.normal,
        //     spreadRadius: 1.0,
        //   ),
        // ],
      ),
      width: MyAdaptiveDimension.getWidth(context) * .65,
      height: MyAdaptiveDimension.getHeight(context) * .08,
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () => _onItemTapped(0),
            child: Icon(
              Icons.home_rounded,
              size: 35,
              color: (_selectedIndex == 0)
                  ? MyColorPallete.selectedIcon
                  : MyColorPallete.unselectedIcon,
            ),
          ),
          InkWell(
            onTap: () => _onItemTapped(1),
            child: Icon(
              Icons.add_rounded,
              size: 42,
              color: (_selectedIndex == 1)
                  ? MyColorPallete.selectedIcon
                  : MyColorPallete.unselectedIcon,
            ),
          ),
          InkWell(
            onTap: () => _onItemTapped(2),
            child: Icon(
              Icons.plumbing_rounded,
              size: 30,
              color: (_selectedIndex == 2)
                  ? MyColorPallete.selectedIcon
                  : MyColorPallete.unselectedIcon,
            ),
          )
        ],
      ),
    );
  }
}
