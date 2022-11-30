import 'dart:convert';
import 'package:diatfori/data/model/article.dart';
import 'package:diatfori/data/model/article_category.dart';
import 'package:diatfori/data/model/article_resep.dart';
import 'package:diatfori/data/model/article_resep_detail.dart';
import 'package:http/http.dart' as http;
import 'package:diatfori/data/model/resep_list.dart';
import 'package:diatfori/data/model/resep_detail.dart';
import 'package:diatfori/data/model/resep_search.dart';

import '../model/recipe/recipe.dart';

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

  // recipe
  static const String _recipeBaseUrl = 'https://63802b4f8efcfcedacfe2a8a.mockapi.io/';

  Future<Recipe> recipeTopHeadline() async {
    final response = await http.get(Uri.parse("${_recipeBaseUrl}reseplist"));
    if (response.statusCode == 200) {
      print(response.body);
      return Recipe.fromJson(json.decode(response.body));
    } else {
      throw Exception(_throw);
    }
  }

}

