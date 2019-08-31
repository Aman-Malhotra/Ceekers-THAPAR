import 'package:flutter/material.dart';
import 'package:startup_punjab/Startup/searchProjects.dart';

class MainAppBar extends StatefulWidget {
  final String title;

  final BuildContext context;
  MainAppBar(
    this.title,
    this.context,
  );
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  String pageOpened;

  void initState() {
    super.initState();
  }

  title() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(1.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        children: <Widget>[
          // Do not delete Drawer Icon
          // Expanded(
          //   flex: 2,
          //   child: IconButton(
          //     icon: Icon(Icons.menu),
          //     color: Theme.of(context).textTheme.subhead.color,
          //     onPressed: () {
          //       Scaffold.of(context).openDrawer();
          //     },
          //   ),
          // ),
          Expanded(
            flex: 8,
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  widget.title ?? "Sample Title",
                  textAlign: TextAlign.left,
                  maxLines: 1,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 10.0,
      title: GestureDetector(
        child: title(),
        onTap: () {
          showSearch(
            context: widget.context,
            delegate: SearchProjectsDelegate(),
          );
        },
      ),
      floating: true,
      pinned: true,
      snap: true,
      bottom: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Text(
            "Recommended for you",
          ),
        ),
      ),
    );
  }
}
