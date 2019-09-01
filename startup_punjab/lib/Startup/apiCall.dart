import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:startup_punjab/Govt/schemesData.dart';
import 'package:startup_punjab/Startup/newsDataModel.dart';
import 'package:startup_punjab/Startup/startupDataModel.dart';

class ApiCall {
  Future<StartupData> getAllProjectsApi() async {
    StartupData data;
    await http.get(
      "https://savestartup-lk4ub52mvq-uc.a.run.app/getstartup/",
      headers: {"Content-Type": "application/json"},
    ).then((http.Response r) {
      data = StartupData.fromJson(
        jsonDecode(
          r.body,
        ),
      );
    });
    return data;
  }

  Future<NewsData> getAllNewsApi(String query) async {
    NewsData data;
    var body = jsonEncode({"sname": "$query"});
    await http.post(
      "https://getnews-lk4ub52mvq-uc.a.run.app/getnews/",
      body: body,
      headers: {"Content-Type": "application/json"},
    ).then((http.Response r) {
      data = NewsData.fromJson(
        jsonDecode(
          r.body,
        ),
      );
    });
    return data;
  }

  Future<SchemesData> getAllSchemesApi(String query) async {
    print(query);
    SchemesData data;
    var body = jsonEncode({"industry": "$query"});
    await http.post(
      "https://savescheme-lk4ub52mvq-uc.a.run.app/getscheme/",
      body: body,
      headers: {"Content-Type": "application/json"},
    ).then((http.Response r) {
      data = SchemesData.fromJson(jsonDecode(r.body));
      print(data.schemes.length);
    });
    return data;
  }
}
