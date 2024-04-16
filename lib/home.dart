// ignore_for_file: file_names
import 'package:GLSeUniVerse/colors.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:GLSeUniVerse/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GLSeUniVerse/barcodePage.dart';
import 'package:GLSeUniVerse/main.dart';
import 'package:GLSeUniVerse/qrPage.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
// import 'dart:ui' as ui;

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int pageIndex = 1;

  List<Widget> pages = [
    qrPage(),
    HomePage(),
    barcodePage(),
  ];

  @override
  void initState(){
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
  @override
  void dispose(){
    FlutterWindowManager.clearFlags(
      FlutterWindowManager.FLAG_SECURE
    );

    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: getBody(),
      bottomNavigationBar: getFooter(),
      // floatingActionButton: SafeArea(
      //   child: SizedBox(
      //     // height: 30,
      //     // width: 40,
      //     child: FloatingActionButton(
      //       onPressed: () {},
      //       child: Icon(
      //         Icons.add,
      //         size: 20,
      //       ),
      //       backgroundColor: buttoncolor,
      //       // shape:
      //       //     BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
      //     ),
      //   ),
      // ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      CupertinoIcons.qrcode,
      CupertinoIcons.home,
      CupertinoIcons.barcode,
    ];
    return AnimatedBottomNavigationBar(
        backgroundColor: primary,
        icons: iconItems,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        gapLocation: GapLocation.none,
        activeIndex: pageIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 30,
        rightCornerRadius: 10,
        elevation: 2,
        onTap: (index) {
          setTabs(index);
        });
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}


// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int myIndex = 1;
//   List<Widget> widgetList = [
//     qrPage(),
//     HomePage(),
//     barcodePage(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: CupertinoColors.activeBlue,
//         onTap: (index) {
//           setState(() {
//             myIndex = index;
//           });
//         },
//         currentIndex: myIndex,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR Code'),
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.bar_chart_sharp), label: 'Barcode'),
//         ],
//       ),
//       body: Center(
//         child: widgetList[myIndex],
//       ),
//     );
//   }
// }
