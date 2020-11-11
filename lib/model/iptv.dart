// To parse this JSON data, do
//
//     final iptv = iptvFromJson(jsonString);

import 'dart:convert';

List<Iptv> iptvFromJson(String str) =>
    List<Iptv>.from(json.decode(str).map((x) => Iptv.fromJson(x)));

String iptvToJson(List<Iptv> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Iptv {
  Iptv({
    this.name,
    this.logo,
    this.url,
    this.category,
    this.language,
    this.country,
    this.tvg,
  });

  String name;
  String logo;
  String url;
  String category;
  List<Country> language;
  Country country;
  Tvg tvg;

  factory Iptv.fromJson(Map<String, dynamic> json) => Iptv(
        name: json["name"] == null ? null : json["name"],
        logo: json["logo"] == null ? null : json["logo"],
        url: json["url"] == null ? null : json["url"],
        category: json["category"] == null ? null : json["category"],
        language: json["language"] == null
            ? null
            : List<Country>.from(
                json["language"].map((x) => Country.fromJson(x))),
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        tvg: json["tvg"] == null ? null : Tvg.fromJson(json["tvg"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "logo": logo == null ? null : logo,
        "url": url == null ? null : url,
        "category": category == null ? null : category,
        "language": language == null
            ? null
            : List<dynamic>.from(language.map((x) => x.toJson())),
        "country": country == null ? null : country.toJson(),
        "tvg": tvg == null ? null : tvg.toJson(),
      };
}

class Country {
  Country({
    this.code,
    this.name,
  });

  String code;
  String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "name": name == null ? null : name,
      };
}

class Tvg {
  Tvg({
    this.id,
    this.name,
    this.url,
  });

  String id;
  String name;
  String url;

  factory Tvg.fromJson(Map<String, dynamic> json) => Tvg(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}
