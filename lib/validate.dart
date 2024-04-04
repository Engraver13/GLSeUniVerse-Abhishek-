// shared_preferences_helper.dart 
import 'package:GLSeUniVerse/home.dart';
import 'package:GLSeUniVerse/loginPage.dart';
import 'package:flutter/material.dart'; 
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

Future<void> saveEmailToPrefs(String email) async { 
  
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance(); 
  await sharedPreferences.setString('email', email); 
  
}
  
  Future<bool> isEmailSaved() async { 

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
    
    String email = finalEmail ?? ''; 
    return email.isNotEmpty; 
    
  } 
  
void navigateToCorrectPage(BuildContext context) async { 
  
  bool emailExists = await isEmailSaved(); 
  if (emailExists) { 
    Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => homePage()), // Navigate to Home Page 
  ); } 
  
  else { 
    
    Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => loginPage()), // Navigate to Login Page 
    
  );} 
}
