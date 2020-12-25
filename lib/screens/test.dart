import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: Text('yo')),
        body: Center(
          child: Text('yo'),
        ));
  }
}
