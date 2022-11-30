// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Recipe> recipeFromJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe {
  Recipe({
    required this.nama,
    required this.imgUrl,
    required this.kalori,
    required this.protein,
    required this.karbohidrat,
    required this.lemak,
    required this.deskripsi,
    required this.kesulitan,
    required this.cocokUntuk,
    required this.id,
  });

  final String nama;
  final String imgUrl;
  final int kalori;
  final int protein;
  final int karbohidrat;
  final int lemak;
  final String deskripsi;
  final String kesulitan;
  final List<dynamic> cocokUntuk;
  final String id;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        nama: json["nama"],
        imgUrl: json["imgUrl"],
        kalori: json["kalori"],
        protein: json["protein"],
        karbohidrat: json["karbohidrat"],
        lemak: json["lemak"],
        deskripsi: json["deskripsi"],
        kesulitan: json["kesulitan"],
        cocokUntuk: List<dynamic>.from(json["cocokUntuk"].map((x) => x)),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "imgUrl": imgUrl,
        "kalori": kalori,
        "protein": protein,
        "karbohidrat": karbohidrat,
        "lemak": lemak,
        "deskripsi": deskripsi,
        "kesulitan": kesulitan,
        "cocokUntuk": List<dynamic>.from(cocokUntuk.map((x) => x)),
        "id": id,
      };
}
