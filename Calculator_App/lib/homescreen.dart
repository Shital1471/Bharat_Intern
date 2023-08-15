import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'Clippath.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double firstNum = 0.0;
  double secondnum = 0.0;
  var input = "";
  var output = "";
  var operation = "";
  var hideInput = false;
  var outputSize = 32.0;
  // late int n;
  var c = 0;
  var n;

  onButtonClick(value) {
    if (value == "C") {
      n = 0;
      c = 0;
      input = " ";
      output = " ";
    } else if (value == "<") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        c = c + 1;
        var userInput = input;
        userInput = input.replaceAll('X', '*');
        Parser p = Parser();
        Expression exp = p.parse(userInput);
        ContextModel cm = ContextModel();
        var Finaloutput = exp.evaluate(EvaluationType.REAL, cm);
        output = Finaloutput.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        if (n != 1) {
          input = output;
          hideInput = true;
          outputSize = 34;
        }
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 32;
    }
    setState(() {
      n = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F1F5),
      body: Column(children: [
      
        Expanded(
            // flex: 1,
            child: ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            child:Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
             IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: ()=>Navigator.of(context).pop(), 
              )
            ],),
            //  margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color(0xFF66347F),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 10.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              
            ),
            // child: Container(
            // ),
          ),
        )),
        Expanded(
          // flex: 2,
          child: Container(
            width: double.infinity,
            // height: 100.0,
          
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(color: Colors.black87, width: 1),
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 2.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? "" : input,
                    // overflow: Overflow.Eclipse,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: outputSize,
                    ),
                  )
                ]),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Expanded(
            flex: 1,
            child: Column(children: [
              Row(
                children: [
                  calcubutton(text: "C",buttonbgColor: Color(0xFF9E4784),tColor: Colors.black),
                  calcubutton(text: "%"),
                  calcubutton(text: "<",buttonbgColor:Color(0xFFD27685),tColor: Colors.black),
                  calcubutton(text: "/"),
                ],
              ),
              Row(
                children: [
                  calcubutton(text: "7"),
                  calcubutton(text: "8"),
                  calcubutton(text: "9"),
                  calcubutton(text: "X"),
                ],
              ),
              Row(
                children: [
                  calcubutton(text: "4"),
                  calcubutton(text: "5"),
                  calcubutton(text: "6"),
                  calcubutton(text: "-"),
                ],
              ),
              Row(
                children: [
                  calcubutton(text: "1"),
                  calcubutton(text: "2"),
                  calcubutton(text: "3"),
                  calcubutton(text: "+"),
                ],
              ),
              Row(
                children: [
                  calcubutton(text: "00"),
                  calcubutton(text: "0"),
                  calcubutton(text: "."),
                  calcubutton(text: "=",buttonbgColor: Color(0xFF9E4784),tColor: Colors.black),
                ],
              ),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget calcubutton(
      {text, tColor = Colors.white, buttonbgColor =const Color(0xFF66347F)}) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 15,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.all(16),
          backgroundColor: buttonbgColor,
        ),
        onPressed: () => onButtonClick(text),
        child: Text(
          text,
          style: TextStyle(
            color: tColor,
            fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
