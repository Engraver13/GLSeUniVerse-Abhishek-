// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:GLSeUniVerse/colors.dart';
import 'package:GLSeUniVerse/home.dart';
import 'package:GLSeUniVerse/postDiscussion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

class loadScreen extends StatefulWidget {
  const loadScreen({super.key});

  @override
  State<loadScreen> createState() => _loadScreenState();
}

class _loadScreenState extends State<loadScreen> {
  @override
  void initState() {
    super.initState();
    getValidationData().whenComplete(() async {
      Timer(const Duration(seconds: 4), () {
        print("In Load: " + finalEmail);

        if(finalrole == 'Student'|| finalrole =='Alumni' || finalrole == 'Staff'){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  finalEmail.isEmpty ? loginPage() : homePage(),
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
    setState(() {});

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
        finaldepartment = await sharedPreferences.getString('dept_abbr') ?? "";
        finalcourse_abbr = await sharedPreferences.getString('course_abbr') ?? "";
        finalcourse_name = await sharedPreferences.getString('course_name') ?? "";
        finalbatch_start_year = await sharedPreferences.getString('batch_start_year') ?? "";
      
      }

      else if(finalrole == 'Staff'){

        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        finalEmail = await sharedPreferences.getString('email') ?? "";
        finalEnrollment = "Not Applicable";
        finalName = await sharedPreferences.getString('name') ?? "";
        finalcontact = await sharedPreferences.getString('contact') ?? "";
        finaldiv = "Not Applicable";
        finalqr_code = await sharedPreferences.getString('qr_code') ?? "";
        finalduration = "Not Applicable";
        finaldepartment = await sharedPreferences.getString('department') ?? "";
        finaldepartment = await sharedPreferences.getString('dept_abbr') ?? "";
        finalcourse_abbr = "Not Applicable";
        finalcourse_name = "Not Applicable";
        finalbatch_start_year = "Not Applicable";
      

      }

      else{
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        finalEmail = await sharedPreferences.getString('email') ?? "";
      }
    setState(() {
      //   finalEmail = obtainEmail.toString();
      //   finalEnrollment = obtainEnrollment.toString();
      //   finalName = obtainName.toString();
      //   finaldiv = obtaindiv.toString();
      //   finalqr_code = obtainqr_code.toString();
      //   finalduration = obtainduration.toString();
      //   finaldepartment = obtaindepartment.toString();
      //   finaldept_abbr = obtaindept_abbr.toString();
      //   finalcourse_abbr = obtaincourse_abbr.toString();
      //   finalcourse_name = obtaincourse_name.toString();
      //   finalbatch_start_year = obtainbatch_start_year.toString();
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulsingGrid(
          color: mainFontColor,
        ),
      ),
    );
  }
}
