import 'wealth_calculator_page.dart';
import 'package:flutter/material.dart';
import 'intro_page.dart';
import 'model/model.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'How To Be Wealthy',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('How to be Wealthy'),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: WealthCalculatorPage(),
        )
      ),
    );
  }
}




