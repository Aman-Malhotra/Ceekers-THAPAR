class SchemesData {
  List<Schemes> schemes;

  SchemesData({this.schemes});

  SchemesData.fromJson(Map<String, dynamic> json) {
    if (json['schemes'] != null) {
      schemes = new List<Schemes>();
      json['schemes'].forEach((v) {
        schemes.add(new Schemes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schemes != null) {
      data['schemes'] = this.schemes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schemes {
  String fiscalIncentive;
  String industry;
  String overview;
  String scheme;
  String time;

  Schemes(
      {this.fiscalIncentive,
      this.industry,
      this.overview,
      this.scheme,
      this.time});

  Schemes.fromJson(Map<String, dynamic> json) {
    fiscalIncentive = json['fiscal_incentive'];
    industry = json['industry'];
    overview = json['overview'];
    scheme = json['scheme'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fiscal_incentive'] = this.fiscalIncentive;
    data['industry'] = this.industry;
    data['overview'] = this.overview;
    data['scheme'] = this.scheme;
    data['time'] = this.time;
    return data;
  }
}