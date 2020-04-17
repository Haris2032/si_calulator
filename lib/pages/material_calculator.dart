import 'package:flutter/material.dart';
import 'package:si_calulator/widget/calc_buttons.dart';

import '../data/data.dart';
import '../data/data.dart';
import '../data/data.dart';
import '../data/data.dart';

class MaterialCalculator extends StatefulWidget {
  @override
  _MaterialCalculatorState createState() => _MaterialCalculatorState();
}

class _MaterialCalculatorState extends State<MaterialCalculator> {
  var valueEntered, answer;

  @override
  void initState() {
    super.initState();
    valueEntered = "52+50";
    answer = "102";
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryBgColor,
      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.35,
            child: Column(
              children: <Widget>[
                Container(
                  height: height * 0.35 * 0.30,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialShadowButton(
                        child: Icons.menu,
                        childColor: nightColor,
                        primaryShadowColor: primaryShadowColor,
                        secondaryShadowColor: secondaryShadowColor,
                        buttonBgColor: primaryButtonColor,
                        height: 40.0,
                        width: 40.0,
                      ),
                      MaterialShadowButton(
                          child: Icons.wb_sunny,
                          height: 40.0,
                          width: 40.0,
                          childColor: dayColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8.0),
                  height: height * 0.35 * 0.30,
                  width: width,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      valueEntered.toString(),
                      textAlign: TextAlign.left,
                      textScaleFactor: 1.8,
                      style: TextStyle(color:primaryIconColor),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8.0),
                  height: height * 0.35 * 0.40,
                  width: width,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      answer.toString(),
                      textScaleFactor: 3.5,
                      style: TextStyle(color: secondaryIconColor),
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
                      MaterialShadowButton(
                          child: "C",
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: "+/-",
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: "%",
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: "÷",
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      MaterialShadowButton(
                          child: 7,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                        child: 8,
                        childColor: primaryIconColor,
                        primaryShadowColor: primaryShadowColor,
                        secondaryShadowColor: secondaryShadowColor,
                        buttonBgColor: primaryButtonColor,
                      ),
                      MaterialShadowButton(
                          child: 9,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: "x",
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      MaterialShadowButton(
                          child: 4,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: 5,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: 6,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: "-",
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      MaterialShadowButton(
                          child: 1,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: 2,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: 3,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: "+",
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      MaterialShadowButton(
                          child: Icons.arrow_back,
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: 0,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: ".",
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      MaterialShadowButton(
                          child: "=",
                          childColor: Colors.white,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: Colors.blue[100],
                          buttonBgColor: Colors.blue)
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
