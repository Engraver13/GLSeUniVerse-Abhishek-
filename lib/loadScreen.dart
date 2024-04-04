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

String finalEmail = '';
String finalEnrollment ='';
String finalName = '';
String finaldiv = '';
String finalqr_code = '';
String finalduration = '';
String finaldepartment = '';
String finaldept_abbr = '';
String finalcourse_abbr = '';
String finalcourse_name = '';
String finalbatch_start_year = '';

class loadScreen extends StatefulWidget {
  const loadScreen({super.key});

  @override
  State<loadScreen> createState() => _loadScreenState();
}

class _loadScreenState extends State<loadScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async{
       Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => finalEmail == 'null' ? loginPage() : homePage(),
          ));

      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => homePage(),
      //     ));
    });
    });
    super.initState();
   
  }

  Future getValidationData() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainEmail = sharedPreferences.getString('email');
    var obtainEnrollment = sharedPreferences.getString('enrollment');
    var obtainName = sharedPreferences.getString('name');
    var obtaindiv = sharedPreferences.getString('div');
    var obtainqr_code = sharedPreferences.getString('qr_code');
    var obtainduration = sharedPreferences.getString('duration');
    var obtaindepartment = sharedPreferences.getString('department');
    var obtaindept_abbr = sharedPreferences.getString('dept_abbr');
    var obtaincourse_abbr = sharedPreferences.getString('course_abbr');
    var obtaincourse_name = sharedPreferences.getString('course_name');
    var obtainbatch_start_year = sharedPreferences.getString('batch_start_year');
    
    
    setState(() {
      finalEmail = obtainEmail.toString(); 
      finalEnrollment = obtainEnrollment.toString(); 
      finalName = obtainName.toString(); 
      finaldiv = obtaindiv.toString(); 
      finalqr_code = obtainqr_code.toString(); 
      finalduration = obtainduration.toString(); 
      finaldepartment = obtaindepartment.toString(); 
      finaldept_abbr = obtaindept_abbr.toString(); 
      finalcourse_abbr = obtaincourse_abbr.toString(); 
      finalcourse_name = obtaincourse_name.toString(); 
      finalbatch_start_year = obtainbatch_start_year.toString(); 
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
