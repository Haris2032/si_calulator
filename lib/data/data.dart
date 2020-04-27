import 'package:flutter/material.dart';

class Data {
  Data._();

  static List<String> periodOfTime = ['Year', 'Month', 'Days'];
  static const String image = "images/calculator.png";
}

class DayTheme {
  final primaryBgColor = Color(0xffe7e7e7);
  final primaryButtonColor = Color(0xffe7e7e7);
  final primaryIconColor = Colors.black;
  final secondaryIconColor = Color(0xff50bfc3);
  final primaryShadowColor = Colors.white;
  final secondaryShadowColor = Color(0xffd1d1d1);

  final themeIcon = Icons.wb_sunny;
  final themeIconColor = Colors.amber;
}

class NightTheme {
  final primaryBgColor = Color(0xff262626);
  final primaryButtonColor = Color(0xff262626);
  final primaryIconColor = Color(0xffe7e7e7);
  final secondaryIconColor = Color(0xff50bfc3);
  final primaryShadowColor = Color(0xff424242);
  final secondaryShadowColor = Colors.black45;

  final themeIcon = Icons.brightness_2;
  final themeIconColor = Colors.blueGrey;
}
