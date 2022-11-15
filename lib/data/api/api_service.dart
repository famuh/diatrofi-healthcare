import 'dart:convert';
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
}
