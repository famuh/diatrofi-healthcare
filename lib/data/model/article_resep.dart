import 'dart:convert';

ArticleResep articleResepFromJson(String str) => ArticleResep.fromJson(json.decode(str));

String articleResepToJson(ArticleResep data) => json.encode(data.toJson());

class ArticleResep {
  ArticleResep({
    required this.method,
    required this.status,
    required this.results,
  });

  final String method;
  final bool status;
  final List<ResultArticle> results;

  factory ArticleResep.fromJson(Map<String, dynamic> json) => ArticleResep(
    method: json["method"],
    status: json["status"],
    results: List<ResultArticle>.from(json["results"].map((x) => ResultArticle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "status": status,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class ResultArticle {
  ResultArticle({
    required this.url,
    required this.key,
  });

  final String url;
  final String key;

  factory ResultArticle.fromJson(Map<String, dynamic> json) => ResultArticle(
    url: json["url"],
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "key": key,
  };
}
