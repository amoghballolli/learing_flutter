import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; //imported for math calculation
import 'package:flutter/services.dart'; // to prevent autorotation of App

import 'colours.dart'; //colours are placed in different dart file

//two major clasification of widget --> stateful and stateless widget
class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
//main class where all action takes place
//creating varables
  var input = '';
  var output = '';
  var operation = '';

  //outputs size increasing------>  (More variables)
  var hideInput = false;
  double outputSize = 52;

  //creating func to be called on click
  onclickButton(value) {
    //specially math class doesnt undertsand "C", "DEL", "=" should do so define those in onclicking method
    if (value == 'C') {
      //on clicking "C" we just reset evrything to empty
      input = '';
      output = '';
      operation = '';
    } else if (value == 'DEL') {
      //"DEL"-> delets the last digit of user input --> check : substring
      if (input.isNotEmpty) {
        input = input.substring(
          0,
          input.length - 1,
        );
      }
    }
    //testing it to fix printing multiple operation -------------->
    else if (value == '/') {
      // "/"-> on clicking on / option without the input should not print the icon
      if (input.isEmpty && output.isEmpty) {
        //output = '';
      } else if (output.isNotEmpty) {
        output = input;
        input = input + '/';
      } else {
        input = input + '/';
      }
    } else if (value == 'X') {
      // "/"-> on clicking on / option without the input should not print the icon
      if (input.isEmpty && output.isEmpty) {
        //output = '';
      } else if (output.isNotEmpty) {
        output = input;
        input = input + 'X';
      } else {
        input = input + 'X';
      }
    } else if (value == '-') {
      // "/"-> on clicking on / option without the input should not print the icon
      if (input.isEmpty && output.isEmpty) {
        //output = '';
      } else if (output.isNotEmpty) {
        output = input;
        input = input + '-';
      } else {
        input = input + '-';
      }
    } else if (value == '+') {
      // "/"-> on clicking on / option without the input should not print the icon
      if (input.isEmpty && output.isEmpty) {
        //output = '';
      } else if (output.isNotEmpty) {
        output = input;
        input = input + '+';
      } else {
        input = input + '+';
      }
    } else if (value == '=') {
      //most of math operations are done on clicking "=" so every action happes here
      if (input.isNotEmpty) {
        //isNotEmpty is to check on clicking without any operation should not do anything
        var userInput = input; //assigning userInput to input variable
        userInput = input.replaceAll('X',
            '*'); //replaceAll is to replace X because its not multiplication sign
        Parser p = Parser(); //string to int converter
        Expression expression = p.parse(
            userInput); //another class call expression which does all math operation
        ContextModel cm = ContextModel(); //from inported class
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output =
            finalvalue.toString(); //output is declared in the form of string

        //if answer is in decimal values user same substrinf operation to remove decimal values
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }

        //after perfermoving all action keep only output answer
        input = output;
        hideInput = true;
        outputSize = 52.0;
      }
    } else {
      hideInput = false;
      outputSize = 34.0;
      input = input + value;
    }

    setState(() {}); //--> to see changes on screen
  }

  @override
  Widget build(BuildContext context) {
    //prevents for device rotating
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //empty white canvas
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        //full app is column
        children: [
          //input otuput area
          Expanded(
            //takes whole screen space
            child: Container(
              width: double.infinity,
              //color: Colors.red,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    hideInput
                        ? ''
                        : input, //ternary operator to hide when clicked on = sign when true it can be used to hide
                    style: const TextStyle(color: Colors.white, fontSize: 38),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                        color: Colors.orange.withOpacity(0.7),
                        fontSize: outputSize),
                  ),
                ],
              ),
            ),
          ),
          Row(
            //creating buttons using single  method
            children: [
              // const SizedBox(
              //   child: Padding(padding: EdgeInsets.only(top: 100)),
              // ),
              creator(num: 'C', tcolor: orangecolour),
              creator(
                  num: 'DEL',
                  tcolor: orangecolour,
                  buttonBgcolor: operatorcolour),
              creator(num: '', buttonBgcolor: Colors.transparent),
              creator(
                  num: '/',
                  tcolor: orangecolour,
                  buttonBgcolor: operatorcolour),
            ],
          ),
          Row(
            children: [
              creator(num: '7'),
              creator(num: '8'),
              creator(num: '9'),
              creator(
                  num: 'X',
                  tcolor: orangecolour,
                  buttonBgcolor: operatorcolour),
            ],
          ),
          Row(
            children: [
              creator(num: '4'),
              creator(num: '5'),
              creator(num: '6'),
              creator(
                  num: '-',
                  tcolor: orangecolour,
                  buttonBgcolor: operatorcolour),
            ],
          ),
          Row(
            children: [
              creator(num: '1'),
              creator(num: '2'),
              creator(num: '3'),
              creator(
                  num: '+',
                  tcolor: orangecolour,
                  buttonBgcolor: operatorcolour),
            ],
          ),
          Row(
            children: [
              creator(
                num: '%',
                buttonBgcolor: operatorcolour,
                tcolor: orangecolour,
              ),
              creator(num: '0'),
              creator(num: '.'),
              creator(
                num: '=',
                buttonBgcolor: orangecolour,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget creator({
    //widget method --> will use this to create buttons
    //variables
    dynamic num,
    tcolor = Colors
        .white, // not passed in method will take white as default as assigned
    buttonBgcolor =
        buttoncolour, // not passed in method will take buttoncolour declared color as default as assigned
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        //color: Colors.amber,
        child: ElevatedButton(
          //styling button using ElevatedButton.styleFrom
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: buttonBgcolor,
              padding: const EdgeInsets.all(22)),
          //on clicking on each button we call onclickButton(num)--> with num as paremeter
          onPressed: () => onclickButton(num),
          child: Text(
            num,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: tcolor),
          ),
        ),
      ),
    );
  }
}


