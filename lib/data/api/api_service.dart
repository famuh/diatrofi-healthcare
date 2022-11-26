import 'dart:convert';
import 'package:diatfori/data/model/article.dart';
import 'package:diatfori/data/model/article_category.dart';
import 'package:diatfori/data/model/article_resep.dart';
import 'package:diatfori/data/model/article_resep_detail.dart';
import 'package:http/http.dart' as http;
import 'package:diatfori/data/model/resep_list.dart';
import 'package:diatfori/data/model/resep_detail.dart';
import 'package:diatfori/data/model/resep_search.dart';

class ApiService {
  static const String _baseUrl = 'https://masak-apa.tomorisakura.vercel.app/';
  static const String _throw = 'Failed to load data';

  Future<Reseplist> topHeadlines() async {
    final response = await http.get(Uri.parse("${_baseUrl}api/recipes"));
    if (response.statusCode == 200) {
      return Reseplist.fromJson(json.decode(response.body));
    } else {
      throw Exception(_throw);
    }
  }

  Future<Resepdetail> getDetailId(String key) async {
    final response = await http.get(Uri.parse("${_baseUrl}/api/recipe/:$key"));
    if (response.statusCode == 200) {
      return Resepdetail.fromJson(json.decode(response.body));
    } else {
      throw Exception(_throw);
    }
  }

  Future<Resepsearch> getTextField(String parameter) async {
    final response = await http.get(Uri.parse('${_baseUrl}api/search/?q=$parameter'));
    if (response.statusCode == 200) {
      return Resepsearch.fromJson(json.decode(response.body));
    } else {
      throw Exception(_throw);
    }
  }

  // Future<ArticleResep> getArticleResep() async {
  //   final response = await http.get(Uri.parse("${_baseUrl}api/articles/new"));
  //   if (response.statusCode == 200) {
  //     return ArticleResep.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception(_throw);
  //   }
  // }

  // Future<ArticleResepDetail> getArticleResepDetail(String tag, key) async {
  //   final response = await http.get(Uri.parse("${_baseUrl}/api/article/:$tag/:$key"));
  //   if (response.statusCode == 200) {
  //     return ArticleResepDetail.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception(_throw);
  //   }
  // }

  // Future<ArticleResepCategory> getArticleResepCategory() async {
  //   final response = await http.get(Uri.parse('${_baseUrl}api/category/article'));
  //   if (response.statusCode == 200) {
  //     return ArticleResepCategory.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception(_throw);
  //   }
  // }
  
// https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=711d960e44b242d0b13100d48d6b3ec3
  // article
  static const String _articleBaseUrl = 'https://newsapi.org/v2/';
  static const String _articleApiKey = '711d960e44b242d0b13100d48d6b3ec3';
  static const String _articleCategory = 'health';
  static const String _articleCountry = 'id'; 

  Future<ArticlesResult> articleTopHeadline() async {
    final response = await http.get(Uri.parse("${_articleBaseUrl}top-headlines?country=$_articleCountry&category=$_articleCategory&apiKey=$_articleApiKey"));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}

