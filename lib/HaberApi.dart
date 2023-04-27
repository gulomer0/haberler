// To parse this JSON data, do
//
//     final haber = haberFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Haber {
  Haber({
    required this.success,
    required this.result,
  });

  bool success;
  List<ResultClass> result;

  factory Haber.fromRawJson(String str) => Haber.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Haber.fromJson(Map<String, dynamic> json) => Haber(
        success: json["success"],
        result: List<ResultClass>.from(
            json["result"].map((x) => ResultClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class ResultClass {
  ResultClass({
    required this.key,
    required this.url,
    required this.description,
    required this.image,
    required this.name,
    required this.source,
  });

  String key;
  String url;
  String description;
  String image;
  String name;
  String source;

  factory ResultClass.fromRawJson(String str) =>
      ResultClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultClass.fromJson(Map<String, dynamic> json) => ResultClass(
        key: json["key"],
        url: json["url"],
        description: json["description"],
        image: json["image"],
        name: json["name"],
        source: json["source"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "url": url,
        "description": description,
        "image": image,
        "name": name,
        "source": source,
      };
}
