import 'package:flutter/material.dart';
import 'package:startup_punjab/Widgets/title.dart';
import 'package:startup_punjab/Widgets/widgets.dart';
import 'package:startup_punjab/Widgets/styles.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController sname,
      cname,
      age,
      state,
      city,
      funding,
      industry,
      sector;
  String selectedG;
  DateTime date;

  @override
  void initState() {
    super.initState();
    cname = new TextEditingController();
    sname = new TextEditingController();
    age = new TextEditingController();
    state = new TextEditingController();
    city = new TextEditingController();
    funding = new TextEditingController();
    industry = new TextEditingController();
    sector = new TextEditingController();
  }

  String validate(String str) {
    return null;
  }

  Widget gender() {
    return new DropdownButton<String>(
      hint: Text(
        "Gender *",
        style: Styles(context).subTitle().copyWith(
              color: Colors.grey.shade600,
            ),
      ),
      value: selectedG,
      style: Styles(context).subTitle().copyWith(
            color: Colors.grey.shade700,
          ),
      items: <String>[
        'Male',
        'Female',
      ].map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: new Text(
              value,
            ),
          ),
        );
      }).toList(),
      onChanged: (String str) {
        selectedG = str;
        setState(() {});
      },
    );
  }

  onDateClick() {
    showDatePicker(
      context: context,
      initialDate: date != null ? date : DateTime(DateTime.now().year),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year),
    ).then((DateTime date) {
      print(date);
      date = date;
      setState(() {});
    });
  }

  onRegister() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: stackBg(
        context: context,
        widget: tabCard(
          context: context,
          widget: Form(
            key: _formKey,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                ListTile(
                  title: title(context: context, text: "Register Startup"),
                  dense: true,
                ),
                padding(
                  formFields(
                    context: context,
                    controller: sname,
                    hintText: "Startup Name",
                    validator: validate,
                  ),
                ),
                padding(
                  formFields(
                    context: context,
                    controller: cname,
                    hintText: "CEO Name",
                    validator: validate,
                  ),
                ),
                padding(
                  formFields(
                    context: context,
                    controller: age,
                    hintText: "Age",
                    validator: validate,
                  ),
                ),
                padding(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      padding(
                        gender(),
                      ),
                      padding(
                        FlatButton(
                          child: Text(
                            date == null
                                ? "Date of Birth *"
                                : (date.day.toString() +
                                    "/" +
                                    date.month.toString() +
                                    "/" +
                                    date.year.toString()),
                            textAlign: TextAlign.left,
                            style: Styles(context).subTitle().copyWith(
                                  color: Colors.grey.shade600,
                                ),
                          ),
                          onPressed: () {
                            onDateClick();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                padding(
                  formFields(
                    context: context,
                    controller: state,
                    hintText: "State",
                    validator: validate,
                  ),
                ),
                padding(
                  formFields(
                    context: context,
                    controller: city,
                    hintText: "City",
                    validator: validate,
                  ),
                ),
                padding(
                  formFields(
                    context: context,
                    controller: funding,
                    hintText: "Funding",
                    validator: validate,
                  ),
                ),
                padding(
                  formFields(
                    context: context,
                    controller: industry,
                    hintText: "Industry",
                    validator: validate,
                  ),
                ),
                padding(
                  formFields(
                    context: context,
                    controller: sector,
                    hintText: "Sector",
                    validator: validate,
                  ),
                ),
                padding(
                  button(
                    context: context,
                    function: onRegister,
                    text: "Register Startup",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
