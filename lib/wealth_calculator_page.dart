// Create a Form widget.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'model/model.dart';

class WealthCalculatorPage extends StatefulWidget {
  @override
  WealthCalculatorPageState createState() {
    return WealthCalculatorPageState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class WealthCalculatorPageState extends State<WealthCalculatorPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  double _currentInvestmentReturn = 8;
  double _currentNumberOfYears = 10;
  double _currentSalary = 50000;
  double _annualRaise = 3;

  getWC() {
    return new WealthCalculator(_currentSalary, this._currentInvestmentReturn, this._currentNumberOfYears.toInt(), _annualRaise.toInt());
  }

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController(text: '100000');

  final divider = const Divider(
  height: 20, thickness: 2, indent: 20, endIndent: 20, color: Colors.black45,
  );

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Slider getSlider(valueToChange) {

    double val = valueToChange;
    return Slider(
      value: valueToChange,
      min: 0,
      max: 500000,
      divisions: 500000,
      label: val.round().toString(),
      onChanged: (double value) {
        setState(() {
          val = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return ListView(
    children: [
      Text('Income: \$' + this._currentSalary.toInt().toString()),
      Slider(
        value: _currentSalary,
        min: 0,
        max: 500000,
        divisions: 500,
        label: _currentSalary.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSalary = value;
          });
        },
      ),
      Text('Annual Raise: ' + this._annualRaise.toInt().toString() + '%'),
      Slider(
        value: _annualRaise,
        min: 0,
        max: 50,
        divisions: 50,
        label: _annualRaise.round().toString(),
        onChanged: (double value) {
          setState(() {
            _annualRaise = value;
          });
        },
      ),
          Text('Investment ROI: ' + this._currentInvestmentReturn.toInt().toString() + "%"),
          Slider(
            value: _currentInvestmentReturn,
            min: 0,
            max: 50,
            divisions: 50,
            label: _currentInvestmentReturn.round().toString(),
            onChanged: (double value) {
               setState(() {
                 _currentInvestmentReturn = value;
            });
            },
          ),
          Text('Number of Years:' + this._currentNumberOfYears.toInt().toString()),
          Slider(
            value: _currentNumberOfYears,
            min: 0,
            max: 50,
            divisions: 50,
            label: _currentNumberOfYears.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentNumberOfYears = value;
              });
            },
          ),
      RichText(
        text: TextSpan(text: "After " + this._currentNumberOfYears.round().toString() + " years you would have ",
            style: TextStyle(color: Colors.black))),
      DisplayTotal("in your investments", getWC().getInvestments()),
      //divider,
      DisplayTotal("in your savings", getWC().getSavings()),
      //divider,
      DisplayTotal("given to charity", getWC().getCharity()),
      //divider,
      DisplayTotal("dedicated to living expenses", getWC().getLiving()),
      divider
    ]);
  }
}

class DisplayTotal extends StatelessWidget {
  DisplayTotal(this.description, this.amount);

  final String description;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
        style: TextStyle(color: Colors.black45.withOpacity(0.9)),
        children: <TextSpan>[
          TextSpan(text: this.amount, style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
          TextSpan(text: ' '),
          TextSpan(text: this.description, style: TextStyle(fontWeight: FontWeight.normal, fontStyle: FontStyle.normal))
      ]

    ));
  }
}
