import 'package:covid19_updates/home_page.dart';
import'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Updates',
      theme: ThemeData(
        primarySwatch:Colors.blue,
        brightness: Brightness.dark,
      ),
      home: Home(),
    );
  }
}