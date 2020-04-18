import 'package:flutter/material.dart';
import '../data/data.dart';
import 'package:calc_core/calc.dart';

class MaterialCalculator extends StatefulWidget {
  @override
  _MaterialCalculatorState createState() => _MaterialCalculatorState();
}

class _MaterialCalculatorState extends State<MaterialCalculator> {
  var valueEntered = '', answer = '';
  Calculator calc = Calculator();
  var numList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  var themeIcon = Icons.wb_sunny;
  var themeColor = dayColor;

  addDigit(int digit) {
    setState(() {
      calc.addDigit(digit);
      valueEntered = calc.text;
    });
  }

  addPoint() {
    setState(() {
      calc.addPoint();
      valueEntered = calc.text;
    });
  }

  addSum() {
    setState(() {
      calc.setAdditionOperator();
      valueEntered = calc.text;
    });
  }

  addSub() {
    setState(() {
      calc.setSubtranctionOperator();
      valueEntered = calc.text;
    });
  }

  addProduct() {
    setState(() {
      calc.setProductOperator();
      valueEntered = calc.text;
    });
  }

  addDiv() {
    setState(() {
      calc.setDivisinOperator();
      valueEntered = calc.text;
    });
  }

  backspace() {
    setState(() {
      calc.backspace();
      valueEntered = calc.text;
    });
  }

  clear() {
    setState(() {
      calc.clear();
      valueEntered = calc.text;
    });
  }

  operate() {
    setState(() {
      calc.operate();
      answer = calc.text;
    });
  }

  void onButtonPressed(value) {
    if (value == 'C') {
      setState(() {
        answer = '';
        clear();
      });
    } else if (value == 'backSpace') {
      backspace();
    } else if (value == '=') {
      operate();
    } else if (value == '.') {
      addPoint();
    } else if (numList.contains(value)) {
      addDigit(value);
    } else if (value == 'day') {
      setState(() {
        themeIcon = Icons.brightness_2;
        themeColor = nightColor;
      });
    } else if (value == 'night') {
      setState(() {
        themeIcon = Icons.wb_sunny;
        themeColor = dayColor;
      });
    } else if (value == 'menu') {
      setState(() {
        themeIcon = Icons.wb_sunny;
        themeColor = dayColor;
      });
    } else {
      switch (value) {
        case '+':
          addSum();
          break;
        case '-':
          addSub();
          break;
        case 'x':
          addProduct();
          break;
        case '÷':
          addDiv();
          break;
        default:
          print(value);
      }
    }
  }

  Widget materialShadowButton(
      {child,
      childColor,
      buttonBgColor,
      primaryShadowColor,
      secondaryShadowColor,
      height = 70.0,
      width = 70.0}) {
    return GestureDetector(
      onTap: () {
        if (child == Icons.arrow_back) {
          onButtonPressed("backSpace");
        } else if (child == Icons.wb_sunny) {
          onButtonPressed("day");
        } else if (child == Icons.brightness_2) {
          onButtonPressed("night");
        } else if (child == Icons.menu) {
          onButtonPressed("menu");
        } else {
          onButtonPressed(child);
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
                  margin: EdgeInsets.only(top: 15.0),
                  height: height * 0.35 * 0.25,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      materialShadowButton(
                        child: Icons.menu,
                        childColor: nightColor,
                        primaryShadowColor: primaryShadowColor,
                        secondaryShadowColor: secondaryShadowColor,
                        buttonBgColor: primaryButtonColor,
                        height: 40.0,
                        width: 40.0,
                      ),
                      materialShadowButton(
                          child: themeIcon,
                          height: 40.0,
                          width: 40.0,
                          childColor: themeColor,
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
                      valueEntered != '' ? valueEntered : '0',
                      textAlign: TextAlign.left,
                      textScaleFactor: 1.8,
                      style: TextStyle(color: primaryIconColor),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    width: width,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer != '' ? answer : '0',
                        textScaleFactor: 3.5,
                        style: TextStyle(color: secondaryIconColor),
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
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
                          child: "+/-",
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
                          child: "%",
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
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
                      materialShadowButton(
                          child: 7,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
                        child: 8,
                        childColor: primaryIconColor,
                        primaryShadowColor: primaryShadowColor,
                        secondaryShadowColor: secondaryShadowColor,
                        buttonBgColor: primaryButtonColor,
                      ),
                      materialShadowButton(
                          child: 9,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
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
                      materialShadowButton(
                          child: 4,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
                          child: 5,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
                          child: 6,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
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
                      materialShadowButton(
                          child: 1,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
                          child: 2,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
                          child: 3,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
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
                      materialShadowButton(
                          child: Icons.arrow_back,
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
                          child: 0,
                          childColor: primaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
                          child: ".",
                          childColor: secondaryIconColor,
                          primaryShadowColor: primaryShadowColor,
                          secondaryShadowColor: secondaryShadowColor,
                          buttonBgColor: primaryButtonColor),
                      materialShadowButton(
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
