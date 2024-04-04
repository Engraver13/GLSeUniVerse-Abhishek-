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
import 'package:shared_preferences/shared_preferences.dart';
import 'users.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    getValidationData().whenComplete(() async {
      Timer(const Duration(seconds: 4), () {
        print("In Splash: " + finalEmail);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  finalEmail.isEmpty ? loginPage() : homePage(),
            ));

        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => homePage(),
        //     ));
      });
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    finalEmail = await sharedPreferences.getString('email') ?? "";
    finalEnrollment = await sharedPreferences.getString('enrollment') ?? "";
    finalName = await sharedPreferences.getString('name') ?? "";
    finaldiv = await sharedPreferences.getString('div') ?? "";
    finalqr_code = await sharedPreferences.getString('qr_code') ?? "";
    finalduration = await sharedPreferences.getString('duration') ?? "";
    finaldepartment = await sharedPreferences.getString('department') ?? "";
    finaldepartment = await sharedPreferences.getString('dept_abbr') ?? "";
    finalcourse_abbr = await sharedPreferences.getString('course_abbr') ?? "";
    finalcourse_name = await sharedPreferences.getString('course_name') ?? "";
    finalbatch_start_year =
        await sharedPreferences.getString('batch_start_year') ?? "";

    setState(() {
      // finalEmail = obtainEmail.toString();
      // finalEnrollment = obtainEnrollment.toString();
      // finalName = obtainName.toString();
      // finaldiv = obtaindiv.toString();
      // finalqr_code = obtainqr_code.toString();
      // finalduration = obtainduration.toString();
      // finaldepartment = obtaindepartment.toString();
      // finaldept_abbr = obtaindept_abbr.toString();
      // finalcourse_abbr = obtaincourse_abbr.toString();
      // finalcourse_name = obtaincourse_name.toString();
      // finalbatch_start_year = obtainbatch_start_year.toString();
    });
    print(finalEmail);
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
