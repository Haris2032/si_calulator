import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final textController, validator, label, hint;
  const InputField(
      {Key key,
      @required this.textController,
      @required this.validator,
      @required this.label,
      @required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    return TextFormField(
      keyboardType: TextInputType.number,
      style: textStyle,
      controller: textController,
      validator: validator,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: textStyle,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }
}
