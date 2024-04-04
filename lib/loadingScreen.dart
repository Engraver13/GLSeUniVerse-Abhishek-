 import 'package:GLSeUniVerse/colors.dart';
import 'package:flutter/material.dart'; 
 import 'package:GLSeUniVerse/validate.dart'; // Import the shared preferences helper file 
 import 'package:flutter_spinkit/flutter_spinkit.dart';
 
 void main() { 
  runApp(MyApp()); 
  } 
  
  class MyApp extends StatelessWidget { 
    
    @override 
    Widget build(BuildContext context) { 
      return MaterialApp( 
        home: loadingScreen(), // Assuming you have a splash screen 
        );
      } 
  } 
        
  class loadingScreen extends StatelessWidget { 
    @override Widget build(BuildContext context) { 
      // Redirect to the correct page after some time 
      navigateToCorrectPage(context); 
      return Scaffold( 
       body: Center( 
        child: SpinKitPulsingGrid(
          color: mainFontColor,
        ),
        ), 
      ); 
      
    } 
  }
