import 'package:flutter/material.dart';
import '../data/data.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:io';

class MaterialCalculator extends StatefulWidget {
  @override
  _MaterialCalculatorState createState() => _MaterialCalculatorState();
}

class _MaterialCalculatorState extends State<MaterialCalculator> {
  String equation = '', answer = '', expression = '';
  var themeData;
  bool themeChange;

  void onButtonPressed(value) {
    if (value == 'themeChange') {
      setState(() {
        themeChange ? themeData = new DayTheme() : themeData = new NightTheme();
        themeChange = !themeChange;
      });
    } else {
      setState(() {
        if (value == 'C') {
          equation = "";
          answer = '';
          expression = '';
        } else if (value == 'backSpace') {
          equation = equation.substring(0, equation.length - 1);
          expression = equation;
          if (equation == '') {
            answer = "";
          }
        } else if (value == '=') {
          if (expression != '') {
            expression = expression.replaceAll("÷", "/");
            expression = expression.replaceAll("x", "*");
            try {
              Parser p = Parser();
              Expression exp = p.parse(expression);
              print(exp);
              ContextModel contextModel = ContextModel();
              value = exp.evaluate(EvaluationType.REAL, contextModel);
              value == value.round()
                  ? answer = value.round().toString()
                  : answer = value.toString();
            } catch (e) {
              print(e);
              answer = 'ERROR';
            }
          }
        } else if (value == 'menu') {
          print("menu");
        } else {
          equation += value.toString();
          expression = equation;
        }
      });
    }
  }

  Widget materialShadowButton(
      {child,
      childId,
      childColor,
      buttonBgColor,
      primaryShadowColor,
      secondaryShadowColor,
      height = 70.0,
      width = 70.0}) {
    if (childId == null) {
      childId = child;
    }
    return GestureDetector(
      onTap: () {
        if (child == childId) {
          onButtonPressed(child);
        } else {
          onButtonPressed(childId);
        }
      },
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: child.runtimeType != IconData
              ? Text(
                  child.toString(),
                  style: TextStyle(
                      color: childColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                )
              : Icon(
                  child,
                  color: childColor,
                ),
        ),
        decoration: BoxDecoration(
            color: buttonBgColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: primaryShadowColor,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 10.0,
                  spreadRadius: 1),
              BoxShadow(
                  color: secondaryShadowColor,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.5),
            ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    themeData = new DayTheme();
    themeChange = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: themeData.primaryBgColor,
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.35,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  height: height * 0.35 * 0.25,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      materialShadowButton(
                        child: Icons.menu,
                        childId: 'menu',
                        childColor: themeData.themeIconColor,
                        primaryShadowColor: themeData.primaryShadowColor,
                        secondaryShadowColor: themeData.secondaryShadowColor,
                        buttonBgColor: themeData.primaryButtonColor,
                        height: 40.0,
                        width: 40.0,
                      ),
                      materialShadowButton(
                        child: themeData.themeIcon,
                        childId: 'themeChange',
                        childColor: themeData.themeIconColor,
                        primaryShadowColor: themeData.primaryShadowColor,
                        secondaryShadowColor: themeData.secondaryShadowColor,
                        buttonBgColor: themeData.primaryButtonColor,
                        height: 40.0,
                        width: 40.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8.0),
                  height: height * 0.35 * 0.30,
                  width: width,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        equation != '' ? equation : '0',
                        textAlign: TextAlign.left,
                        textScaleFactor: 1.8,
                        style: TextStyle(color: themeData.primaryIconColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    width: width,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        child: Text(
                          answer != '' ? answer : '0',
                          textScaleFactor: 3.5,
                          style: TextStyle(color: themeData.secondaryIconColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      materialShadowButton(
                          child: "C",
                          childColor: themeData.secondaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: "^",
                          childColor: themeData.secondaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: "%",
                          childColor: themeData.secondaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: "÷",
                          childColor: themeData.secondaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      materialShadowButton(
                          child: 7,
                          childColor: themeData.primaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                        child: 8,
                        childColor: themeData.primaryIconColor,
                        primaryShadowColor: themeData.primaryShadowColor,
                        secondaryShadowColor: themeData.secondaryShadowColor,
                        buttonBgColor: themeData.primaryButtonColor,
                      ),
                      materialShadowButton(
                          child: 9,
                          childColor: themeData.primaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: "x",
                          childColor: themeData.secondaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      materialShadowButton(
                          child: 4,
                          childColor: themeData.primaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: 5,
                          childColor: themeData.primaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: 6,
                          childColor: themeData.primaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: "-",
                          childColor: themeData.secondaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      materialShadowButton(
                          child: 1,
                          childColor: themeData.primaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: 2,
                          childColor: themeData.primaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: 3,
                          childColor: themeData.primaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: "+",
                          childColor: themeData.secondaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      materialShadowButton(
                          child: Icons.arrow_back,
                          childId: "backSpace",
                          childColor: themeData.secondaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: 0,
                          childColor: themeData.primaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: ".",
                          childColor: themeData.secondaryIconColor,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.primaryButtonColor),
                      materialShadowButton(
                          child: "=",
                          childColor: Colors.white,
                          primaryShadowColor: themeData.primaryShadowColor,
                          secondaryShadowColor: themeData.secondaryShadowColor,
                          buttonBgColor: themeData.secondaryIconColor)
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
