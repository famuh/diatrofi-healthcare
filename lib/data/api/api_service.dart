import 'dart:convert';
import 'package:diatfori/data/model/article.dart';
import 'package:diatfori/data/model/nutrisi.dart';
import 'package:http/http.dart' as http;
import 'package:diatfori/data/model/resep_list.dart';


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

  // Future<Resepdetail> getDetailId(String key) async {
  //   final response = await http.get(Uri.parse("$_baseUrl/api/recipe/:$key"));
  //   if (response.statusCode == 200) {
  //     return Resepdetail.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception(_throw);
  //   }
  // }

  // Future<Resepsearch> getTextField(String parameter) async {
  //   final response =
  //       await http.get(Uri.parse('${_baseUrl}api/search/?q=$parameter'));
  //   if (response.statusCode == 200) {
  //     return Resepsearch.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception(_throw);
  //   }
  // }

  // article
  static const String _articleBaseUrl = 'https://newsapi.org/v2/';
  static const String _articleApiKey = '711d960e44b242d0b13100d48d6b3ec3';
  static const String _articleCategory = 'health';
  static const String _articleCountry = 'id';

  Future<ArticlesResult> articleTopHeadline() async {
    final response = await http.get(Uri.parse(
        "${_articleBaseUrl}top-headlines?country=$_articleCountry&category=$_articleCategory&apiKey=$_articleApiKey"));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
  Future<Nutrients> nutrients() async {
    final response = await http.get(Uri.parse(
        "https://mocki.io/v1/b1b15cac-0116-4122-bb81-6915c22741d4"));
    if (response.statusCode == 200) {
      return Nutrients.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load nutrients');
    }
  }

}
