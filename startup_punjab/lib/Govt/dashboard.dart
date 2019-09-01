import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:startup_punjab/Govt/chart.dart';
import 'package:startup_punjab/Govt/searchPage.dart';
import 'package:startup_punjab/Startup/apiCall.dart';
import 'package:startup_punjab/Startup/startupDataModel.dart';
import 'package:startup_punjab/Widgets/styles.dart';
import 'package:startup_punjab/Widgets/title.dart';
import 'package:startup_punjab/Widgets/title.dart' as prefix0;
import 'package:startup_punjab/Widgets/widgets.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<BottomNavigationBarItem> list = new List();
  int currentIndex = 0;
  var cityMap = Map();
  var industryMap = Map();
  var sectorMap = Map();
  var yearMap = Map();
  var cityList = new List();
  var industryList = new List();
  var sectorList = new List();
  var yearList = new List();
  StartupData data, sampleData, extraData;
  TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = new TextEditingController();
    getData();
    initList();
  }

  printData() {
    cityMap = getMaxCount(cityMap);
    yearMap = getMaxCount(yearMap);
    industryMap = getMaxCount(industryMap);
    sectorMap = getMaxCount(sectorMap);
  }

  maxCityCount() {
    data.startup.forEach((s) {
      cityList.add(s.city);
    });
    cityList.forEach((element) {
      if (!cityMap.containsKey(element)) {
        cityMap[element] = 1;
      } else {
        cityMap[element] += 1;
      }
    });
  }

  maxIndustryCount() {
    data.startup.forEach((s) {
      industryList.add(s.industry);
    });
    industryList.forEach((element) {
      if (!industryMap.containsKey(element)) {
        industryMap[element] = 1;
      } else {
        industryMap[element] += 1;
      }
    });
  }

  maxSectorCount() {
    data.startup.forEach((s) {
      sectorList.add(s.sector);
    });
    sectorList.forEach((element) {
      if (!sectorMap.containsKey(element)) {
        sectorMap[element] = 1;
      } else {
        sectorMap[element] += 1;
      }
    });
  }

  maxYearCount() {
    data.startup.forEach((s) {
      yearList.add(s.date.substring(0, 4));
    });
    yearList.forEach((element) {
      if (!yearMap.containsKey(element)) {
        yearMap[element] = 1;
      } else {
        yearMap[element] += 1;
      }
    });
  }

  getData() {
    ApiCall().getAllProjectsApi().then((StartupData d) {
      this.data = d;
      this.extraData = d;
      // print(d.startup.length);
      maxCityCount();
      maxIndustryCount();
      maxSectorCount();
      maxYearCount();
      printData();
      setState(() {});
    });
  }

  Map getMaxCount(Map m) {
    int max = 0;
    String str = "";
    m.forEach((key, val) {
      if (val > max) {
        max = val;
        str = key;
      }
    });
    return {str: max};
  }

  String getKey(Map m) {
    String key = "";
    m.forEach((k, v) {
      key = k.toString();
    });
    return key;
  }

  String getValue(Map m) {
    String value = "";
    m.forEach((k, v) {
      value = v.toString();
    });
    return value;
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
        icon: Icon(
          FontAwesomeIcons.search,
        ),
        title: Text("Search"),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.scatter_plot,
        ),
        title: Text("Graphs"),
      ),
    ];
  }

  changeOpenedPage(int index) {
    currentIndex = index;
    setState(() {});
  }

  Table table() {
    return Table(
      children: [
        TableRow(children: [
          TableCell(
            child: adminDashboardProp(
              "Location :",
              upperCamelCase(getKey(cityMap)) +
                  "(" +
                  upperCamelCase(getValue(cityMap)) +
                  "%)",
              context,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChartPage(data),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ),
          TableCell(
            child: adminDashboardProp(
                "Year :",
                upperCamelCase(getKey(yearMap)) +
                    "(" +
                    upperCamelCase(getValue(yearMap)) +
                    "%)",
                context,
                () {}),
          ),
        ]),
        TableRow(children: [
          TableCell(
            child: adminDashboardProp(
                "Industry :",
                upperCamelCase(getKey(industryMap)) +
                    "(" +
                    upperCamelCase(getValue(industryMap)) +
                    "%)",
                context,
                () {}),
          ),
          TableCell(
            child: adminDashboardProp(
                "Sector :",
                upperCamelCase(getKey(sectorMap)) +
                    "(" +
                    upperCamelCase(getValue(sectorMap)) +
                    "%)",
                context,
                () {}),
          ),
        ]),
      ],
    );
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
            padding(
              Image.asset(
                'assets/logo.png',
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ),
            Card(
              elevation: 10.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: Styles(context).linearGradient(),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      padding(Text(
                        "Leading statistics :",
                        style: Styles(context).title().copyWith(
                              color: Colors.white,
                            ),
                      )),
                      table(),
                    ],
                  ),
                ),
              ),
            ),
            ChartPage(data),
          ],
        ),
      ),
    ];
  }

  Iterable<Widget> searchSliverList() {
    return [
      SliverAppBar(
        title: Text(
          "Search",
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
            if (index == 0)
              return padding(
                TextField(
                  controller: controller,
                  style: Styles(context).subTitle().copyWith(
                        color: Colors.grey.shade700,
                      ),
                  decoration: InputDecoration(
                    hintText: "Search",
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
                  onChanged: (String s) {
                    data.startup = extraData.startup.where((a) {
                      if (a.city
                          .toLowerCase()
                          .contains(controller.text.toLowerCase())) return true;
                      return false;
                    }).toList();
                    setState(() {});
                  },
                ),
              );
            else {
              index -= 1;
              return companyCard(
                context: this.context,
                startup: data.startup[index],
              );
            }
          },
          childCount: data.startup.length,
        ),
      ),
    ];
  }

  Iterable<Widget> graphsSliverList() {
    return [
      SliverAppBar(
        title: Text(
          "Graphs",
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
        delegate: SliverChildListDelegate(
          [
            Card(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  prefix0.title(
                      context: context, text: "Gender ratio in industries"),
                  Image.asset(
                    "assets/charts/barchart2.jpeg",
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  prefix0.title(
                      context: context,
                      text: "Industry distribution in cities"),
                  Image.asset(
                    "assets/charts/barchart3.jpeg",
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  prefix0.title(
                      context: context,
                      text: "Citi v/s Industry with number of people"),
                  Image.asset(
                    "assets/charts/heatmap.jpeg",
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  prefix0.title(
                      context: context, text: "Gender ratio in industries"),
                  Image.asset(
                    "assets/charts/piechart3.jpeg",
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  prefix0.title(context: context, text: "Funding status"),
                  Image.asset(
                    "assets/charts/piechart.jpeg",
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  prefix0.title(
                      context: context, text: "Startup stages density raito"),
                  Image.asset(
                    "assets/charts/piechart2.jpeg",
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  prefix0.title(
                      context: context,
                      text: "Geographical distribution of startups"),
                  Image.asset(
                    "assets/charts/map.jpeg",
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  prefix0.title(
                      context: context,
                      text: "Year-wise distribution of startups"),
                  Image.asset(
                    "assets/charts/year.jpeg",
                    fit: BoxFit.contain,
                  ),
                ],
              ),
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
                  : currentIndex == 1 ? searchSliverList() : graphsSliverList(),
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
