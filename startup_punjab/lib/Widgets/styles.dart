import 'package:flutter/material.dart';

class Styles {
  BuildContext context;
  Styles(this.context);

  TextStyle title() {
    return TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w700,
      fontSize: 15.0,
      letterSpacing: 0.3,
    );
  }

  TextStyle subTitle() {
    return TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 13.0,
      letterSpacing: 0.3,
    );
  }

  TextStyle buttonTextTitle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.3,
      fontSize: 13.0,
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
  LinearGradient linearGradientReverse() {
    return LinearGradient(
      colors: [
        Colors.deepPurple,
        Colors.deepOrange,
      ],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    );
  }
}
