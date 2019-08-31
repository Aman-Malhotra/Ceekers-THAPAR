import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:startup_punjab/Startup/startupDataModel.dart';
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
    @required TextEditingController controller}) {
  return TextFormField(
    validator: validator,
    controller: controller,
    style: Styles(context).subTitle().copyWith(
          color: Colors.grey.shade700,
        ),
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
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 10.0,
          style: BorderStyle.solid,
        ),
      ),
    ),
  );
}

Widget button(
    {@required String text,
    @required Function function,
    @required BuildContext context}) {
  return Container(
    child: MaterialButton(
      onPressed: function,
      // color: Theme.of(context).primaryColor,
      elevation: 0.0,
      color: Colors.transparent,
      child: buttonText(
        context: context,
        text: text,
      ),
    ),
    decoration: BoxDecoration(
      gradient: Styles(context).linearGradient(),
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}

Widget prop(String title, String subtitle, BuildContext context) {
  return Card(
    elevation: 3.0,
    child: ListTile(
      title: Text(
        title,
        style: Styles(context).title(),
      ),
      subtitle: Text(
        subtitle,
        style: Styles(context).title().copyWith(
              color: Colors.grey.shade600,
            ),
      ),
    ),
  );
}

Widget tabCard({
  @required BuildContext context,
  @required Widget widget,
  bool removePadding = false,
}) {
  return Card(
    margin: !removePadding
        ? EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: MediaQuery.of(context).size.height * 0.1,
          )
        : EdgeInsets.all(0.0),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: widget,
    ),
  );
}

Widget profileTopCard(
    {@required Startup startup, @required BuildContext context}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.35,
    padding: EdgeInsets.all(5.0),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Center(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                gradient: Styles(context).linearGradient(),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    upperCamelCase(startup.name),
                    textAlign: TextAlign.center,
                    style: Styles(context).title().copyWith(
                          fontSize: 20.0,
                          color: Theme.of(context).cardColor,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "Industry :",
                              textAlign: TextAlign.center,
                              style: Styles(context).title().copyWith(
                                    fontSize: 17.0,
                                    color: Theme.of(context).cardColor,
                                  ),
                            ),
                            Text(
                              upperCamelCase(startup.industry),
                              textAlign: TextAlign.center,
                              style: Styles(context).subTitle().copyWith(
                                    color: Theme.of(context).cardColor,
                                  ),
                            ),
                          ],
                        ),
                        VerticalDivider(),
                        Column(
                          children: <Widget>[
                            Text(
                              "Sector :",
                              textAlign: TextAlign.center,
                              style: Styles(context).title().copyWith(
                                    fontSize: 17.0,
                                    color: Theme.of(context).cardColor,
                                  ),
                            ),
                            Text(
                              upperCamelCase(startup.sector),
                              textAlign: TextAlign.center,
                              style: Styles(context).subTitle().copyWith(
                                    color: Theme.of(context).cardColor,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Material(
            borderRadius: BorderRadius.circular(50.0),
            elevation: 15.0,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              radius: 40.0,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                height: 45.0,
              ),
            ),
          ),
        ),
      ],
      overflow: Overflow.clip,
    ),
  );
}

String upperCamelCase(String str) {
  str = str.trim();
  return str[0].toUpperCase() + str.substring(1);
}

Widget stackBg({
  @required Widget widget,
  @required BuildContext context,
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
        clipper: WaveClipperOne(),
      ),
      widget
    ],
  );
}
