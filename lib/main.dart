import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Goals Calendar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Calendário de Objetivos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var _lineCounter = 1;
  var squareCounter = 10;

  void _incrementLine() {
    setState(() {
      _lineCounter++;
    });
  }

  Container _dataContainer() {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0)),
    );
  }

  Expanded _dataContainerList() {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: squareCounter,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
              ),
            );
          }),
    );
  }

  Container _dateCalendar(day) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Text(day.toString()));
  }

  Row _goalRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      const SizedBox(
        width: 250,
        child: TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
          ),
        ),
      ),
      _dataContainerList(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(width: 257), // TODO HARDCODED
                  for (var i = 1; i <= squareCounter; i++) _dateCalendar(i),
                ],
              ),
              _goalRow()
            ],
          ),
        ),
        bottomSheet: Row(children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: FloatingActionButton(
              onPressed: _incrementLine,
              tooltip: 'Adicionar linha',
              child: const Icon(Icons.add),
            ),
          ),
        ]));
  }
}
