import 'package:flutter/material.dart';
import 'package:si_calulator/pages/simple_intrest.dart';

void main() {
  runApp(
    MaterialApp(
      title: "simple Interest Calculator",
      home: SimpleIntrest(),
      theme: ThemeData(
        primaryColor: Colors.red[400],
        accentColor: Colors.red[300],
        primaryColorLight: Colors.white,
      ),
    ),
  );
}
