import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:startup_punjab/Govt/schemesData.dart';
import 'package:startup_punjab/Startup/apiCall.dart';
import 'package:startup_punjab/Startup/newsDataModel.dart';
import 'package:startup_punjab/Startup/newsDataModel.dart' as prefix0;
import 'package:startup_punjab/Startup/startupDataModel.dart';
import 'package:startup_punjab/Widgets/styles.dart';
import 'package:startup_punjab/Widgets/title.dart';
import 'package:startup_punjab/Widgets/title.dart' as prefix2;
import 'package:startup_punjab/Widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<BottomNavigationBarItem> list = new List();
  int currentIndex = 0;
  NewsData newsData;
  SchemesData schemesData;
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
      var rng = new Random();
      startup = data.startup[rng.nextInt(d.startup.length)];
      ApiCall().getAllNewsApi(startup.name).then((NewsData n) {
        newsData = n;
        setState(() {});
      });
      ApiCall()
          .getAllSchemesApi(upperCamelCase(startup.industry))
          .then((SchemesData s) {
        schemesData = s;
        // print("This is the number of schemes " + s.schemes.length.toString());
        setState(() {});
      });
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
          delegate: SliverChildBuilderDelegate(
        (c, i) {
          if (i == 0) {
            return profileTopCard(
              context: context,
              startup: startup,
            );
          } else if (i == 1) {
            return padding(
              prefix2.title(
                  context: context, text: "Recommended Government Schemes"),
            );
          } else {
            i -= 1;
            return Card(
              elevation: 3.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: ListTile(
                title: title(
                  context: context,
                  text: schemesData.schemes[i].scheme,
                ),
                subtitle: Text(
                  schemesData.schemes[i].overview,
                  style: Styles(context).subTitle().copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
              ),
            );
          }
        },
        childCount: schemesData.schemes.length + 2,
      )),
    ];
  }

  launchURL(String u) async {
    String url = u;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
            return Card(
              elevation: 3.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: ListTile(
                title: title(
                  context: context,
                  text: newsData.news[index].name
                      .replaceAll("<b>", "")
                      .replaceAll("</b>", ""),
                ),
                subtitle: Text(
                  newsData.news[index].description
                      .replaceAll("<b>", "")
                      .replaceAll("</b>", ""),
                  style: Styles(context).subTitle().copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
                onTap: () {
                  launchURL(newsData.news[index].url);
                },
              ),
            );
          },
          childCount: newsData.news.length,
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
      body: data != null && newsData != null && schemesData != null
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
