import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
// import 'package:si_calulator/pages/simple_intrest.dart';
import '../data/data.dart';

class MaterialCalculator extends StatefulWidget {
  @override
  _MaterialCalculatorState createState() => _MaterialCalculatorState();
}

class _MaterialCalculatorState extends State<MaterialCalculator>
    with SingleTickerProviderStateMixin {
  // for calculation
  String equation = '', answer = '', expression = '';
  // for changing theme
  var themeData;
  bool themeChange;
  // for animating menu icon
  var menuIcon = Icons.menu;
  bool menuClicked = false;
  static double unitDirection = 57.295779513;
  double direction = 90 / unitDirection;
  AnimationController animationController;
  Animation menuTranslationAnimation, rotationAnimation;

  double _containerHeight = 0;
  double _containerWidth = 0;

  double iconSize = 3.5;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    menuTranslationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    rotationAnimation = Tween(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    super.initState();
    themeData = new DayTheme();
    themeChange = false;
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    themeData = new DayTheme();
    themeChange = false;
    animationController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: themeData.primaryBgColor,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: height * 0.35,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20.0, right: 5.0, left: 5.0),
                      height: height * 0.35 * 0.25,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          materialShadowButton(
                            child: themeData.themeIcon,
                            childId: 'themeChange',
                            childColor: themeData.themeIconColor,
                            primaryShadowColor: themeData.primaryShadowColor,
                            secondaryShadowColor:
                                themeData.secondaryShadowColor,
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
                              textScaleFactor: iconSize,
                              style: TextStyle(
                                  color: themeData.secondaryIconColor),
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
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: "^",
                              childColor: themeData.secondaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: "%",
                              childColor: themeData.secondaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: "÷",
                              childColor: themeData.secondaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
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
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                            child: 8,
                            childColor: themeData.primaryIconColor,
                            primaryShadowColor: themeData.primaryShadowColor,
                            secondaryShadowColor:
                                themeData.secondaryShadowColor,
                            buttonBgColor: themeData.primaryButtonColor,
                          ),
                          materialShadowButton(
                              child: 9,
                              childColor: themeData.primaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: "x",
                              childColor: themeData.secondaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
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
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: 5,
                              childColor: themeData.primaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: 6,
                              childColor: themeData.primaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: "-",
                              childColor: themeData.secondaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
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
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: 2,
                              childColor: themeData.primaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: 3,
                              childColor: themeData.primaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: "+",
                              childColor: themeData.secondaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
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
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: 0,
                              childColor: themeData.primaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: ".",
                              childColor: themeData.secondaryIconColor,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.primaryButtonColor),
                          materialShadowButton(
                              child: "=",
                              childColor: Colors.white,
                              primaryShadowColor: themeData.primaryShadowColor,
                              secondaryShadowColor:
                                  themeData.secondaryShadowColor,
                              buttonBgColor: themeData.secondaryIconColor)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () => onButtonPressed("menu"),
            child: AnimatedContainer(
              duration: Duration(microseconds: 400),
              height: _containerHeight,
              width: _containerWidth,
              color: themeChange ? Colors.white12 : Colors.black12,
              curve: Curves.easeOutCirc,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset.fromDirection(
                        direction, menuTranslationAnimation.value * 175.0),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          rotationAnimation.value / unitDirection)
                        ..scale(menuTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: materialShadowButton(
                          child: Icons.settings,
                          childId: 'settings',
                          childColor: themeData.themeIconColor,
                          primaryShadowColor: Colors.transparent,
                          secondaryShadowColor: Colors.transparent,
                          buttonBgColor: themeData.primaryButtonColor,
                          height: 50.0,
                          width: 50.0,
                          iconSize: 35.0),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(
                        direction, menuTranslationAnimation.value * 115.0),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          rotationAnimation.value / unitDirection)
                        ..scale(menuTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: materialShadowButton(
                          child: Icons.person,
                          childId: 'about',
                          childColor: themeData.themeIconColor,
                          primaryShadowColor: Colors.transparent,
                          secondaryShadowColor: Colors.transparent,
                          buttonBgColor: themeData.primaryButtonColor,
                          height: 50.0,
                          width: 50.0,
                          iconSize: 35.0),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(
                        direction, menuTranslationAnimation.value * 55.0),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          rotationAnimation.value / unitDirection)
                        ..scale(menuTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: materialShadowButton(
                        child: Icons.monetization_on,
                        childId: 'simple intrest',
                        childColor: themeData.themeIconColor,
                        primaryShadowColor: Colors.transparent,
                        secondaryShadowColor: Colors.transparent,
                        buttonBgColor: themeData.primaryButtonColor,
                        height: 50.0,
                        width: 50.0,
                        iconSize: 35.0,
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(
                        rotationAnimation.value / unitDirection),
                    alignment: Alignment.center,
                    child: materialShadowButton(
                      child: menuIcon,
                      childId: 'menu',
                      childColor: themeData.themeIconColor,
                      primaryShadowColor: themeData.primaryShadowColor,
                      secondaryShadowColor: themeData.secondaryShadowColor,
                      buttonBgColor: themeData.primaryButtonColor,
                      height: 40.0,
                      width: 40.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
          iconSize = 3.5;
        } else if (value == 'backSpace') {
          equation = equation.substring(0, equation.length - 1);
          expression = equation;
          if (equation == '') {
            answer = "";
            iconSize = 3.5;
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
                  : answer =
                      double.parse((value).toStringAsFixed(8)).toString();
              if (answer.length > 13){
                iconSize = 2.0;
              }
            } catch (e) {
              print(e);
              answer = 'ERROR';
            }
          }
        } else if (value == 'menu') {
          setState(() {
            if (!menuClicked) {
              menuIcon = Icons.close;
              _containerHeight = MediaQuery.of(context).size.height;
              _containerWidth = MediaQuery.of(context).size.width;
            } else {
              menuIcon = Icons.menu;
              _containerHeight = 0;
              _containerWidth = 0;
            }
            menuClicked = !menuClicked;
          });
          if (animationController.isCompleted) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
          print(value);
        } else if (value == 'settings') {
          print(value);
        } else if (value == 'about') {
          print(value);
        } else if (value == 'simple intrest') {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => SimpleIntrest(themeData: themeData)));
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
      width = 70.0,
      iconSize = 28.0}) {
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
                      fontSize: iconSize,
                      fontWeight: FontWeight.bold),
                )
              : Icon(
                  child,
                  color: childColor,
                  size: iconSize,
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
}
