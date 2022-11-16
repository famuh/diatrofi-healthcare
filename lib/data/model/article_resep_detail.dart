import 'dart:convert';

ArticleResepDetail articleResepDetailFromJson(String str) => ArticleResepDetail.fromJson(json.decode(str));

String articleResepDetailToJson(ArticleResepDetail data) => json.encode(data.toJson());

class ArticleResepDetail {
  ArticleResepDetail({
    required this.method,
    required this.status,
    required this.results,
  });

  final String method;
  final bool status;
  final Results results;

  factory ArticleResepDetail.fromJson(Map<String, dynamic> json) => ArticleResepDetail(
    method: json["method"],
    status: json["status"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "status": status,
    "results": results.toJson(),
  };
}

class Results {
  Results({
    required this.title,
    required this.thumb,
    required this.author,
    required this.datePublished,
    required this.description,
  });

  final String title;
  final String thumb;
  final String author;
  final String datePublished;
  final String description;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    title: json["title"],
    thumb: json["thumb"],
    author: json["author"],
    datePublished: json["date_published"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "thumb": thumb,
    "author": author,
    "date_published": datePublished,
    "description": description,
  };
}
