import 'dart:ui';

import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('晓智商城'),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return ConstrainedBox(
     constraints: BoxConstraints(
       minHeight: 50,
       minWidth: double.infinity
     ),
     child: Container(
       color: Colors.red,
       height: 5.0,
       child: Text('hello world',style: TextStyle(color: Colors.white)),
     ),
   );
  }
}