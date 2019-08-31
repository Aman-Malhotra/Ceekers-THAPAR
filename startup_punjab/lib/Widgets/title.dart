import 'package:flutter/material.dart';
import 'package:startup_punjab/Widgets/styles.dart';

Widget title({
  @required String text,
  @required BuildContext context,
}) {
  return Text(
    text,
    style: Styles(context).title(),
  );
}

Widget subTitle({
  @required String text,
  @required BuildContext context,
}) {
  return Text(
    text,
    style: Styles(context).subTitle(),
  );
}
Widget buttonText({
  @required String text,
  @required BuildContext context,
}) {
  return Text(
    text,
    style: Styles(context).buttonTextTitle(),
  );
}