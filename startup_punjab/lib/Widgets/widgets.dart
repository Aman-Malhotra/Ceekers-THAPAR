import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:startup_punjab/Widgets/styles.dart';
import 'package:startup_punjab/Widgets/title.dart';

Padding padding(Widget widget) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 10.0,
    ),
    child: widget,
  );
}

Widget formFields({
  @required BuildContext context,
  @required Function(String) validator,
  @required String hintText,
  @required BorderSide borderSide,
}) {
  return TextFormField(
    validator: validator,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(borderSide: borderSide),
    ),
  );
}

Widget button(
    {@required String text,
    @required Function function,
    @required BuildContext context}) {
  return MaterialButton(
    onPressed: function,
    // color: Theme.of(context).primaryColor,
    elevation: 0.0,
    color: Colors.transparent,
    child: buttonText(
      context: context,
      text: text,
    ),
  );
}

Widget stackBg({
  @required Widget widget,
  @required BuildContext context,
}) {
  return Stack(
    children: <Widget>[
      ClipPath(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: Styles(context).linearGradient(),
          ),
        ),
        clipper: WaveClipperOne(),
      ),
      widget
    ],
  );
}
