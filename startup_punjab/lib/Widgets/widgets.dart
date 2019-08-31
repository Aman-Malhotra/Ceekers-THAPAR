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

Widget formFields(
    {@required BuildContext context,
    @required Function(String) validator,
    @required String hintText,
    @required BorderSide borderSide,
    @required TextEditingController controller}) {
  return TextFormField(
    validator: validator,
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: Styles(context).title().copyWith(
            color: Colors.grey.shade500,
            fontSize: 14.0,
          ),
      labelStyle: Styles(context).title().copyWith(
            color: Colors.grey.shade500,
            fontSize: 14.0,
          ),
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
  @required bool reverse,
}) {
  return Stack(
    children: <Widget>[
      ClipPath(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            gradient: Styles(context).linearGradient(),
          ),
        ),
        clipper: WaveClipperOne(reverse: false),
      ),
      widget
    ],
  );
}
