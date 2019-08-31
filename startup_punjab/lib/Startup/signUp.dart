import 'package:flutter/material.dart';
import 'package:startup_punjab/Widgets/styles.dart';
import 'package:startup_punjab/Widgets/widgets.dart';
import 'package:startup_punjab/Widgets/title.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }

  loginClick() {}

  signupClick() {}

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Image.asset(
          'assets/logo.png',
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        ListTile(
          title: title(context: context, text: "Login"),
        ),
        padding(
          formFields(
            context: context,
            hintText: "Email",
            validator: validateEmail,
            borderSide: BorderSide(
              color: Colors.deepPurple,
              width: 10.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        padding(
          formFields(
            context: context,
            hintText: "Password",
            validator: validateEmail,
            borderSide: BorderSide(
              color: Colors.deepPurple,
              width: 0.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        padding(
          Container(
            child: button(
              context: context,
              function: loginClick,
              text: "Login",
            ),
            decoration: BoxDecoration(
              gradient: Styles(context).linearGradient(),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        padding(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Not registered yet ?"),
              subTitle(
                context: context,
                text: "Sign Up",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
