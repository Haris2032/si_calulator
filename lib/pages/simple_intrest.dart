import 'package:flutter/material.dart';
import 'package:si_calulator/data/data.dart';
import 'package:si_calulator/widget/input_field.dart';
import 'package:firebase_admob/firebase_admob.dart';

class SimpleIntrest extends StatefulWidget {
  final themeData;

  const SimpleIntrest({Key key, @required this.themeData}) : super(key: key);
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

  static final MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
      testDevices: <String>[],
      keywords: <String>['mobile', 'laptop', 'menswear']);

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return new BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (event) {
        print("Banner clicked");
      },
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _bannerAd = createBannerAd()
      ..load()
      ..show();
    _currentItemselected = Data.periodOfTime[0];
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  TextEditingController amountController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  var display = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.themeData.primaryBgColor,
      appBar: AppBar(
        title: Text("EasyCal"),
      ),
      body: Form(
        key: _formkey,
        autovalidate: _validate,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InputField(
                      textController: amountController,
                      validator: validate,
                      label: "Amount",
                      hint: "Enter the amount eg.100")),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InputField(
                      textController: roiController,
                      validator: validate,
                      label: "Rate of interest",
                      hint: "Enter the rate of interest eg.5%")),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: InputField(
                              textController: yearController,
                              validator: validate,
                              label: _currentItemselected,
                              hint: "eg. 2 $_currentItemselected")),
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
                            textColor: widget.themeData.primaryButtonColor,
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
                              color: widget.themeData.primaryButtonColor,
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
                  display,
                  style: TextStyle(
                      color: widget.themeData.primaryIconColor,
                      fontWeight: FontWeight.w600),
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
    double period = double.parse(yearController.text);
    double divisor;
    if (_currentItemselected == "Month") {
      divisor = 12;
    } else if (_currentItemselected == "Days") {
      divisor = 365;
    } else {
      divisor = 1;
    }

    double sI = amount + (amount * roi * (period / divisor)) / 100;
    String res =
        'After $period ${_currentItemselected.toLowerCase()}, your investment will be worth ${sI.roundToDouble()} ';
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

  String validate(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter a value';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter valid Input';
    }
  }
}
