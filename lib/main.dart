import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "simple Interest Calculator",
      home: SIForm(),
      theme: ThemeData(
        primaryColor: Colors.red[400],
        accentColor: Colors.red[300],
        primaryColorLight: Colors.white,
      ),
    ),
  );
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _formkey = GlobalKey<FormState>();
  bool _validate = false;

  var _currencies = ['Rupees', 'Dollar', 'Pounds'];
  final _minpadding = 5.0;
  var _currentItemselected = '';

  @override
  void initState() {
    super.initState();
    _currentItemselected = _currencies[0];
  }

  TextEditingController amount_c = TextEditingController();
  TextEditingController Roi_c = TextEditingController();
  TextEditingController y_c = TextEditingController();

  var display = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.body2;
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
              getImageAsset(),
              Padding(
                padding: EdgeInsets.only(top: _minpadding, bottom: _minpadding),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: amount_c,
                  validator: A_validate,
                  decoration: InputDecoration(
                      labelText: "Amount",
                      hintText: "Enter the amount eg.100",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(top: _minpadding, bottom: _minpadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: Roi_c,
                    validator: R_validate,
                    decoration: InputDecoration(
                        labelText: "Rate of interest",
                        hintText: "Enter the rate of interest eg.5%",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: _minpadding, bottom: _minpadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: y_c,
                        validator: Y_validate,
                        decoration: InputDecoration(
                            labelText: "Years",
                            hintText: "eg. 5%",
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                      Container(
                        width: _minpadding * 5,
                      ),
                      Expanded(
                          child: DropdownButton<String>(
                        items: _currencies.map((String value) {
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
                  style: textStyle,
                  textScaleFactor: 1.3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage("images/Si_icon.png");
    Image image = Image(
      image: assetImage,
      width: 130.0,
      height: 130.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minpadding * 5),
    );
  }

  void _onDropItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemselected = newValueSelected;
    });
  }

  String _calculateTotal() {
    double amount = double.parse(amount_c.text);
    double roi = double.parse(Roi_c.text);
    double year = double.parse(y_c.text);

    double SI = amount + (amount * roi * year) / 100;
    String res =
        'After $year years, Your investment will be worth $SI $_currentItemselected';
    return res;
  }

  void _reset() {
    amount_c.text = '';
    Roi_c.text = '';
    y_c.text = '';
    display = '';
    _currentItemselected = _currencies[0];
    setState(() {
      _validate = false;
    });
  }

  String A_validate(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter the amount';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter valid Input';
    }
  }

  String R_validate(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter the Intrest';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter valid Input';
    }
  }

  String Y_validate(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter the No.of Year';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter valid Input';
    }
  }
}
