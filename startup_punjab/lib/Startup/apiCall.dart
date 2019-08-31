import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:startup_punjab/Startup/startupDataModel.dart';

class ApiCall {
  Future<StartupData> getAllProjectsApi() async {
    StartupData data;
    await http.get(
      "https://savestartup-lk4ub52mvq-uc.a.run.app/getstartup/",
      headers: {"Content-Type": "application/json"},
    ).then((http.Response r) {
      print("Result from get startups response");

      data = StartupData.fromJson(
        jsonDecode(
          r.body,
        ),
      );
    });
    return data;
  }
}
