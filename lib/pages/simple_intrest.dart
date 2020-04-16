import 'package:flutter/material.dart';
import 'package:si_calulator/data/data.dart';
import 'package:si_calulator/widget/image_icon.dart';
import 'package:si_calulator/widget/input_field.dart';

class SimpleIntrest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SimpleIntrestState();
  }
}

class _SimpleIntrestState extends State<SimpleIntrest> {
  var _formkey = GlobalKey<FormState>();
  bool _validate = false;
  final _minpadding = 5.0;
  var _currentItemselected = '';

  @override
  void initState() {
    super.initState();
    _currentItemselected = Data.periodOfTime[0];
  }

  TextEditingController amountController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  var display = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S.I Calculator"),
      ),
      body: Form(
        key: _formkey,
        autovalidate: _validate,
        child: Padding(
          padding: EdgeInsets.all(_minpadding * 2),
          child: ListView(
            children: <Widget>[
              SimpleImage(),
              Padding(
                  padding:
                      EdgeInsets.only(top: _minpadding, bottom: _minpadding),
                  child: InputField(
                      textController: amountController,
                      validator: aValidate,
                      label: "Amount",
                      hint: "Enter the amount eg.100")),
              Padding(
                  padding:
                      EdgeInsets.only(top: _minpadding, bottom: _minpadding),
                  child: InputField(
                      textController: roiController,
                      validator: rValidate,
                      label: "Rate of interest",
                      hint: "Enter the rate of interest eg.5%")),
              Padding(
                  padding:
                      EdgeInsets.only(top: _minpadding, bottom: _minpadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: InputField(
                              textController: yearController,
                              validator: yValidate,
                              label: "Years",
                              hint: "eg. 5%")),
                      Container(
                        width: _minpadding * 5,
                      ),
                      Expanded(
                          child: DropdownButton<String>(
                        items: Data.periodOfTime.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _currentItemselected,
                        onChanged: (String newValueSelected) {
                          _onDropItemSelected(newValueSelected);
                        },
                      ))
                    ],
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: _minpadding, bottom: _minpadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'Calculate',
                              textScaleFactor: 1.3,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_formkey.currentState.validate()) {
                                  this.display = _calculateTotal();
                                } else {
                                  setState(() {
                                    _validate = true;
                                  });
                                }
                              });
                            }),
                      ),
                      Expanded(
                          child: RaisedButton(
                              color: Theme.of(context).primaryColorLight,
                              textColor: Theme.of(context).accentColor,
                              child: Text(
                                'Reset',
                                textScaleFactor: 1.3,
                              ),
                              onPressed: () {
                                setState(() {
                                  _reset();
                                });
                              })),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.all(_minpadding * 2),
                child: Text(
                  this.display,
                  style: Theme.of(context).textTheme.bodyText1,
                  textScaleFactor: 1.3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onDropItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemselected = newValueSelected;
    });
  }

  String _calculateTotal() {
    double amount = double.parse(amountController.text);
    double roi = double.parse(roiController.text);
    double year = double.parse(yearController.text);

    double sI = amount + (amount * roi * year) / 100;
    String res =
        'After $year years, Your investment will be worth $sI $_currentItemselected';
    return res;
  }

  void _reset() {
    amountController.text = '';
    roiController.text = '';
    yearController.text = '';
    display = '';
    _currentItemselected = Data.periodOfTime[0];
    setState(() {
      _validate = false;
    });
  }

  String aValidate(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter the amount';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter valid Input';
    }
  }

  String rValidate(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter the Intrest';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter valid Input';
    }
  }

  String yValidate(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter the No.of Year';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter valid Input';
    }
  }
}
