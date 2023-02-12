import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // buttons variables
  var buttonColor =  Color.fromARGB(255, 82, 80, 80);
  var firstRowButtonColor = Color.fromARGB(255, 197, 192, 192);
  var firstRowTextColor = Colors.black;
  var lastColumnButtonColor = Colors.orange;

  // method variables
  var input = " ";
  var output = " ";


  // method for the functionality
  onButtonClick(value){
    // print(value);
    if(value=="AC"){
      input = " ";
      output = " ";
    }
    else if(value=="<-")
    {
      input = input.substring(0,input.length-1);
    }
    else if(value=="=")
    {
      var userInput = input;
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
    }
    else
    {
      input = input + value;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [


          // input-output area
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(input,style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Text(output,style: TextStyle(
                      fontSize: 30,
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),




        // buttons area
          Row(
            children: [
              Button(text: "AC",textColor: firstRowTextColor,buttonBgColor: firstRowButtonColor),
              Button(text: "<-",textColor: firstRowTextColor,buttonBgColor: firstRowButtonColor),
              Button(text: "%",textColor: firstRowTextColor,buttonBgColor: firstRowButtonColor),
              Button(text: "/",buttonBgColor: lastColumnButtonColor),
              ],
          ),

          Row(
            children: [
              Button(text: "7",buttonBgColor: buttonColor),
              Button(text: "8",buttonBgColor: buttonColor),
              Button(text: "9",buttonBgColor: buttonColor),
              Button(text: "*",buttonBgColor: lastColumnButtonColor),
              ],
          ),

          Row(
            children: [
              Button(text: "4",buttonBgColor: buttonColor),
              Button(text: "5",buttonBgColor: buttonColor),
              Button(text: "6",buttonBgColor: buttonColor),
              Button(text: "-",buttonBgColor: lastColumnButtonColor),
              ],
          ),

          Row(
            children: [
              Button(text: "1",buttonBgColor: buttonColor),
              Button(text: "2",buttonBgColor: buttonColor),
              Button(text: "3",buttonBgColor: buttonColor),
              Button(text: "+",buttonBgColor: lastColumnButtonColor),
              ],
          ),

          Row(
            children: [
              Button(text: "e",buttonBgColor: buttonColor),
              Button(text: "0",buttonBgColor: buttonColor),
              Button(text: ".",buttonBgColor: buttonColor),
              Button(text: "=",buttonBgColor: lastColumnButtonColor),
              ],
          ),
        ],
      ),
    );
  }


  Widget Button({text,textColor = Colors.white, buttonBgColor = Colors.black}){
     return Expanded(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonBgColor,
                      padding: EdgeInsets.all(22),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                    onPressed: () => onButtonClick(text), 
                    child: Text(text,style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),),
                    ),
                ),
              );
  }
}