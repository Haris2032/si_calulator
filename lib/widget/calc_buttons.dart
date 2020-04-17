import 'package:flutter/material.dart';

class MaterialShadowButton extends StatefulWidget {
  final child,
      childColor,
      buttonBgColor,
      primaryShadowColor,
      secondaryShadowColor,
      height,
      width;

  const MaterialShadowButton(
      {Key key,
      @required this.child,
      @required this.childColor,
      @required this.buttonBgColor,
      @required this.primaryShadowColor,
      @required this.secondaryShadowColor,
      this.height = 70.0,
      this.width = 70.0})
      : super(key: key);

  @override
  _MaterialShadowButtonState createState() => _MaterialShadowButtonState();
}

class _MaterialShadowButtonState extends State<MaterialShadowButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.child);
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        child: Center(
          child: widget.child.runtimeType != IconData
              ? Text(
                  widget.child.toString(),
                  style: TextStyle(
                      color: widget.childColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                )
              : Icon(
                  widget.child,
                  color: widget.childColor,
                ),
        ),
        decoration: BoxDecoration(
            color: widget.buttonBgColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: widget.primaryShadowColor,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 10.0,
                  spreadRadius: 1),
              BoxShadow(
                  color: widget.secondaryShadowColor,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.5),
            ]),
      ),
    );
  }
}
