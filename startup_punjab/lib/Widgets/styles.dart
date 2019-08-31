import 'package:flutter/material.dart';

class Styles {
  BuildContext context;
  Styles(this.context);

  TextStyle title() {
    return TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w700,
      fontSize: 16.0,
    );
  }

  TextStyle subTitle() {
    return TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    );
  }

  TextStyle buttonTextTitle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    );
  }

  LinearGradient linearGradient() {
    return LinearGradient(
      colors: [
        Colors.deepPurple,
        Colors.deepOrange,
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }
}
