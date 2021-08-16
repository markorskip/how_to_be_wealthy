import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage();

  final String introText= "Anyone can achieve wealth over time by following a very simple financial formula."
      "  Use the calculator to see"
  + " how long it would take to achieve your financial wealth goals using this wealth formula.";

  final String formulaExplanation = 'Of your income, 10 percent invest, '
      '10 percent save,'
      'and 10 percent give to the charity or church of your choice.'
      ' This simple financial discipline will produce great wealth over time '
      'regardless of your starting wealth or income. Use the calculator on '
      'the next screen to see how much wealth you will accumulate over time '
      'using this formula.';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        Container(child: Text(introText),
          padding: EdgeInsets.all(4),
        ),
        Row(children: [
          Icon(Icons.attach_money),
          Text('LIVE OFF 70% OF YOUR INCOME', textAlign: TextAlign.center)]
        ),
        Row(children: [
          Icon(Icons.attach_money),
          Text('10% GIVE tO CHARITY', textAlign: TextAlign.center)]
        ),
        Row(children: [
          Icon(Icons.attach_money),
          Text('10% INVEST', textAlign: TextAlign.center)]
        ),
        Row(children: [
          Icon(Icons.attach_money),
          Text('10% SAVE', textAlign: TextAlign.center)]
        ),
        Container(child: Text(formulaExplanation),
          padding: EdgeInsets.all(4),
        )
      ],
    );
  }
}
