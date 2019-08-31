import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:startup_punjab/Startup/apiCall.dart';
import 'package:startup_punjab/Startup/startupDataModel.dart';
import 'package:startup_punjab/Widgets/styles.dart';
import 'package:startup_punjab/Widgets/widgets.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<BottomNavigationBarItem> list = new List();
  int currentIndex = 0;

  Startup startup;
  StartupData data;
  @override
  void initState() {
    super.initState();
    getData();
    initList();
  }

  getData() {
    ApiCall().getAllProjectsApi().then((StartupData d) {
      this.data = d;
      startup = data.startup[10];
      setState(() {});
    });
  }

  initList() {
    list = [
      BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.home,
        ),
        title: Text("Home"),
      ),
      BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.newspaper),
        title: Text("News"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.face),
        title: Text("Profile"),
      ),
    ];
  }

  changeOpenedPage(int index) {
    currentIndex = index;
    setState(() {});
  }

  Iterable<Widget> homeSliverList() {
    return [
      SliverAppBar(
        title: Text(
          "Home",
          style: Styles(context).title().copyWith(
                color: Colors.white,
              ),
        ),
        elevation: 10.0,
        floating: true,
        pinned: true,
        snap: true,
        // automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            profileTopCard(
              context: context,
              startup: startup,
            ),
          ],
        ),
      ),
    ];
  }

  Iterable<Widget> newsSliverList() {
    return [
      SliverAppBar(
        title: Text(
          "News",
          style: Styles(context).title().copyWith(
                color: Colors.white,
              ),
        ),
        elevation: 10.0,
        floating: true,
        pinned: true,
        snap: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              title: Text("This is tile number $index"),
            );
          },
          childCount: 10,
        ),
      ),
    ];
  }

  Iterable<Widget> profileSliverList() {
    return [
      SliverAppBar(
        title: Text(
          "Profile",
          style: Styles(context).title().copyWith(
                color: Colors.white,
              ),
        ),
        elevation: 10.0,
        floating: true,
        pinned: true,
        snap: true,
        // automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            profileTopCard(
              context: context,
              startup: startup,
            ),
            Table(
              children: [
                TableRow(children: [
                  TableCell(
                    child:
                        prop("CEO Name", upperCamelCase(startup.ceo), context),
                  ),
                  TableCell(
                    child: prop("Age", startup.age, context),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child:
                        prop("State", upperCamelCase(startup.state), context),
                  ),
                  TableCell(
                    child: prop("City", upperCamelCase(startup.city), context),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: prop("Funding type", upperCamelCase(startup.funding),
                        context),
                  ),
                  TableCell(
                    child: prop("Start Date", startup.date, context),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: prop("Number of people",
                        upperCamelCase(startup.noOfPpl), context),
                  ),
                  TableCell(
                    child: prop("Number of people",
                        upperCamelCase(startup.noOfPpl), context),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      drawer: Drawer(),
      body: data != null
          ? CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: currentIndex == 0
                  ? homeSliverList()
                  : currentIndex == 1 ? newsSliverList() : profileSliverList(),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: list,
        currentIndex: currentIndex,
        elevation: 0.0,
        backgroundColor: Theme.of(context).cardColor,
        selectedLabelStyle: Styles(context).subTitle().copyWith(
              color: Theme.of(context).accentColor,
              fontSize: 12.0,
            ),
        onTap: (int i) {
          changeOpenedPage(i);
        },
      ),
    );
  }
}
