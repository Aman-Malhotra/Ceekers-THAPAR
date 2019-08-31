class StartupData {
  List<Startup> startup;

  StartupData({this.startup});

  StartupData.fromJson(Map<String, dynamic> json) {
    if (json['startup'] != null) {
      startup = new List<Startup>();
      json['startup'].forEach((v) {
        startup.add(new Startup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.startup != null) {
      data['startup'] = this.startup.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Startup {
  String age;
  String ceo;
  String city;
  String funding;
  String gender;
  String industry;
  String name;
  String noOfPpl;
  String sector;
  String stage;
  String state;
  String approve;
  String date;
  String sid;

  Startup(
      {this.age,
      this.ceo,
      this.city,
      this.funding,
      this.gender,
      this.industry,
      this.name,
      this.noOfPpl,
      this.sector,
      this.stage,
      this.state,
      this.approve,
      this.date,
      this.sid});

  Startup.fromJson(Map<String, dynamic> json) {
    age = json['Age'];
    ceo = json['CEO'];
    city = json['City'];
    funding = json['Funding'];
    gender = json['Gender'];
    industry = json['Industry'];
    name = json['Name'];
    noOfPpl = json['NoOfPpl'];
    sector = json['Sector'];
    stage = json['Stage'];
    state = json['State'];
    approve = json['approve'];
    date = json['date'];
    sid = json['sid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Age'] = this.age;
    data['CEO'] = this.ceo;
    data['City'] = this.city;
    data['Funding'] = this.funding;
    data['Gender'] = this.gender;
    data['Industry'] = this.industry;
    data['Name'] = this.name;
    data['NoOfPpl'] = this.noOfPpl;
    data['Sector'] = this.sector;
    data['Stage'] = this.stage;
    data['State'] = this.state;
    data['approve'] = this.approve;
    data['date'] = this.date;
    data['sid'] = this.sid;
    return data;
  }
}