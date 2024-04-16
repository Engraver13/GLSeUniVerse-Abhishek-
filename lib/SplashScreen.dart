// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:GLSeUniVerse/alumni_home_page.dart';
import 'package:GLSeUniVerse/home.dart';
import 'package:GLSeUniVerse/loadScreen.dart';
import 'package:GLSeUniVerse/postDiscussion.dart';
import 'package:GLSeUniVerse/staff_home_page.dart';
import 'package:GLSeUniVerse/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:GLSeUniVerse/barcodePage.dart';
import 'package:GLSeUniVerse/cameraPage.dart';
import 'package:GLSeUniVerse/loginPage.dart';
import 'package:GLSeUniVerse/qrPage.dart';
import 'package:GLSeUniVerse/homePage.dart';
import 'package:GLSeUniVerse/securityHomePage.dart';
import 'package:GLSeUniVerse/visitorEntryPage.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'users.dart';

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
        print("Role " + finalrole);
        print("In Load: " + finalprofile);
        
        if(finalrole == 'Student'){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  finalEmail.isEmpty ? loginPage() : homePage(),
            ));
        }
        else if(finalrole == 'Alumni'){
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  finalEmail.isEmpty ? loginPage() : alumni_home_page(),
            ));
        }

        else if(finalrole == 'Staff'){
            print("Entered in Staff");
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  finalEmail.isEmpty ? loginPage() : staff_home_page(),
            ));
        }

        else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  finalEmail.isEmpty ? loginPage() : securityPage(),
            ));
        }
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>
        //           finalEmail.isEmpty ? loginPage() : homePage(),
        //     ));
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => homePage(),
        //     ));
      });
    });
  }

  Future getValidationData() async {

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    finalrole = await sharedPreferences.getString('role') ?? "";

    print("In Splash Check Role :" + finalrole);
    
    if(finalrole == 'Student' || finalrole == 'Alumni')
      {

        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        finalEmail = await sharedPreferences.getString('email') ?? "";
        finalEnrollment = await sharedPreferences.getString('enrollment') ?? "";
        finalName = await sharedPreferences.getString('name') ?? "";
        finaldiv = await sharedPreferences.getString('div') ?? "";
        finalqr_code = await sharedPreferences.getString('qr_code') ?? "";
        finalduration = await sharedPreferences.getString('duration') ?? "";
        finaldepartment = await sharedPreferences.getString('department') ?? "";
        finaldept_abbr = await sharedPreferences.getString('dept_abbr') ?? "";
        finalcourse_abbr = await sharedPreferences.getString('course_abbr') ?? "";
        finalcourse_name = await sharedPreferences.getString('course_name') ?? "";
        finalbatch_start_year = await sharedPreferences.getString('batch_start_year') ?? "";
        finalprofile = await sharedPreferences.getString('profile') ?? "";
        
              
      }

      else if(finalrole == 'Staff'){

        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        finalEmail = await sharedPreferences.getString('email') ?? "";
        //finalEnrollment = "Not Applicable";
        finalName = await sharedPreferences.getString('name') ?? "";
        finalcontact = await sharedPreferences.getString('contact') ?? "";
        //finaldiv = "Not Applicable";
        finalqr_code = await sharedPreferences.getString('qr_code') ?? "";
        //finalduration = "Not Applicable";
        finaldepartment = await sharedPreferences.getString('department') ?? "";
        finaldept_abbr = await sharedPreferences.getString('dept_abbr') ?? "";
        //finalcourse_abbr = "Not Applicable";
        //finalcourse_name = "Not Applicable";
        finalbatch_start_year = "Not Applicable";
        finalprofile = await sharedPreferences.getString('profile') ?? "";
        //finalrole = await sharedPreferences.getString('role') ?? "";
      

      }

      else{
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        finalEmail = await sharedPreferences.getString('email') ?? "";
        finalrole = await sharedPreferences.getString('role') ?? "";
        finalprofile = await sharedPreferences.getString('profile') ?? "";
        //finalrole = await sharedPreferences.getString('role') ?? "";
      }
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
    print(finalrole);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GLS_eUniverse",
      debugShowCheckedModeBanner: false,
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
