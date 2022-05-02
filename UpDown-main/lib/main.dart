import 'package:flutter/material.dart';
import 'up_down.dart';
// Soar Development Sandbox
// Copyright 2022 Tradezone Development, Inc. All rights reserved.
// Contractor Name:
// Card Number:
// Revision Number:
// Project:


// Welcome to the Soar Development Sandbox!
// This is a bare bones project consisting of a new widget and a main page to
// display it on. To make your widget, refactor both the up_down.dart name
// as well as the widget new_widget itself by right clicking and clicking
// refactor and type in the name of your widget. Then build your widget in the
// other dart file.

// Happy Coding!

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soar Sandbox',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Soar Sandbox'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [ Text(widget.title)]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[up_down(),],
        ),
      ),

    );
  }
}
