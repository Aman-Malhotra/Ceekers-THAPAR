import 'package:flutter/material.dart';
import 'package:startup_punjab/Startup/signUp.dart' as startup;
import 'package:startup_punjab/Widgets/widgets.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(
      length: 2,
      vsync: this,
    );
  }

  Widget tabCard(Widget widget) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: MediaQuery.of(context).size.height * 0.1,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: widget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: stackBg(
        widget: TabBarView(
          controller: controller,
          children: <Widget>[
            tabCard(
              startup.SignUp(),
            ),
            tabCard(Container()),
          ],
        ),
        context: context,
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        labelColor: Theme.of(context).primaryColor,
        tabs: <Widget>[
          Tab(
            child: Text("Startup"),
            // icon: Icon(Icons.star),
          ),
          Tab(
            child: Text("Authority"),
            // icon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
