import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:startup_punjab/Govt/chart.dart';
import 'package:startup_punjab/Login/mainPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
