// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:GLSeUniVerse/home.dart';
import 'package:GLSeUniVerse/postDiscussion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GLSeUniVerse/barcodePage.dart';
import 'package:GLSeUniVerse/cameraPage.dart';
import 'package:GLSeUniVerse/loginPage.dart';
import 'package:GLSeUniVerse/qrPage.dart';
import 'package:GLSeUniVerse/homePage.dart';
import 'package:GLSeUniVerse/scanQrCode.dart';
import 'package:GLSeUniVerse/securityHomePage.dart';
import 'package:GLSeUniVerse/visitorEntryPage.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => loginPage(),
          ));

      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => homePage(),
      //     ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GLS_eUniverse",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/login',
          page: () => loginPage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/studentHomePage',
          page: () => HomePage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/qrPage',
          page: () => qrPage(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/barcodePage',
          page: () {
            return barcodePage();
          },
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/securityPage',
          page: () {
            return securityPage();
          },
        ),
        GetPage(
          name: '/visitorEntryPage',
          page: () {
            return visitorEntry();
          },
        ),
        GetPage(
          name: '/scanQrCode',
          page: () {
            return QRCodeScannerScreen();
          },
        ),
        GetPage(
          name: '/cameraOpen',
          page: () {
            return CameraApp();
          },
        ),
        GetPage(
          name: '/postDiscussion',
          page: () {
            return postDiscussion();
          },
        ),
      ],
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset("images/mainQr.json"),
          ],
        ),
      )),
    );
  }
}
