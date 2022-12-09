import 'dart:convert';

ArticleResepCategory articleResepCategoryFromJson(String str) => ArticleResepCategory.fromJson(json.decode(str));

String articleResepCategoryToJson(ArticleResepCategory data) => json.encode(data.toJson());

class ArticleResepCategory {
  ArticleResepCategory({
    required this.method,
    required this.status,
    required this.results,
  });

  final String method;
  final bool status;
  final List<ResultCategory> results;

  factory ArticleResepCategory.fromJson(Map<String, dynamic> json) => ArticleResepCategory(
    method: json["method"],
    status: json["status"],
    results: List<ResultCategory>.from(json["results"].map((x) => ResultCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "status": status,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class ResultCategory {
  ResultCategory({
    required this.title,
    required this.key,
  });

  final String title;
  final String key;

  factory ResultCategory.fromJson(Map<String, dynamic> json) => ResultCategory(
    title: json["title"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "key": key,
  };
}
