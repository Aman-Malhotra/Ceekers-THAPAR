import 'package:flutter/material.dart';
import 'package:startup_punjab/Startup/startupDataModel.dart';
import 'package:startup_punjab/Widgets/styles.dart';
import 'package:startup_punjab/Widgets/widgets.dart';

class SearchPage extends StatefulWidget {
   StartupData startupData;
  SearchPage(this.startupData);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller;
  StartupData data;
  @override
  void initState() {
    super.initState();
    data = widget.startupData;
    controller = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    if (data.startup.length == 0) {
      data = widget.startupData;
    }
    return SliverList(
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
                  data.startup = data.startup.where((a) {
                    if (a.city
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()) ||
                        a.name
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()) ||
                        a.age
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()) ||
                        a.industry
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()) ||
                        a.sector
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()) ||
                        a.stage
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()) ||
                        a.funding
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()) ||
                        a.gender
                            .toLowerCase()
                            .contains(controller.text.toLowerCase()))
                      return true;
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
      // delegate: SliverChildListDelegate(
      //   [

      //     ListView.builder(
      //       shrinkWrap: true,
      //       itemCount: data.startup.length,
      //       itemBuilder: (context, index) {
      //         return companyCard(
      //           context: this.context,
      //           startup: data.startup[index],
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
