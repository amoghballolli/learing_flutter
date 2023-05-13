import 'package:flutter/material.dart';
import 'calculator.dart';


//program entry point --> runApp()
//every widget is availabe at material.io so app created is MaterialApp()
//Scafold --> is ike empty can and starting point of material UI building 
main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculatorApp(),
  ));
}


