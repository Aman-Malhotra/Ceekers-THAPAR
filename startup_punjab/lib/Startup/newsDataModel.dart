class NewsData {
  List<News> news;

  NewsData({this.news});

  NewsData.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = new List<News>();
      json['news'].forEach((v) {
        news.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  List<About> about;
  String datePublished;
  String description;
  String name;
  List<Provider> provider;
  String url;

  News(
      {this.about,
      this.datePublished,
      this.description,
      this.name,
      this.provider,
      this.url});

  News.fromJson(Map<String, dynamic> json) {
    if (json['about'] != null) {
      about = new List<About>();
      json['about'].forEach((v) {
        about.add(new About.fromJson(v));
      });
    }
    datePublished = json['datePublished'];
    description = json['description'];
    name = json['name'];
    if (json['provider'] != null) {
      provider = new List<Provider>();
      json['provider'].forEach((v) {
        provider.add(new Provider.fromJson(v));
      });
    }
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.about != null) {
      data['about'] = this.about.map((v) => v.toJson()).toList();
    }
    data['datePublished'] = this.datePublished;
    data['description'] = this.description;
    data['name'] = this.name;
    if (this.provider != null) {
      data['provider'] = this.provider.map((v) => v.toJson()).toList();
    }
    data['url'] = this.url;
    return data;
  }
}

class About {
  String name;
  String readLink;

  About({this.name, this.readLink});

  About.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    readLink = json['readLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['readLink'] = this.readLink;
    return data;
  }
}

class Provider {
  String sType;
  Image image;
  String name;

  Provider({this.sType, this.image, this.name});

  Provider.fromJson(Map<String, dynamic> json) {
    sType = json['_type'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_type'] = this.sType;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Image {
  Thumbnail thumbnail;

  Image({this.thumbnail});

  Image.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String contentUrl;

  Thumbnail({this.contentUrl});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    contentUrl = json['contentUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentUrl'] = this.contentUrl;
    return data;
  }
}