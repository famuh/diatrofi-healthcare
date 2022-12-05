import 'dart:async';

import 'package:diatfori/data/model/nutrisi.dart';
import 'package:flutter/material.dart';

import '../../common/constant.dart';
import '../../data/api/api_service.dart';


class NutrientProvider extends ChangeNotifier {
  final ApiService apiService;

  NutrientProvider({required this.apiService}) {
    _fetchAllNutrients();
  }

  final List _totalItems = [];
  final List _totalKalori = [];
  final List _totalLemak = [];
  final List _totalProtein = [];
  final List _totalKarbohidrat = [];

  List get totalItems => _totalItems;
  List get totalKalori => _totalKalori;
  List get totalLemak => _totalLemak;
  List get totalProtein => _totalProtein;
  List get totalKarbohidrat => _totalKarbohidrat;
  
 
  calculateKalori(){
    num hasil = totalKalori.fold(0, (a, b) => a+b);
    return hasil;
  }

  late Nutrients _articlesResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  Nutrients get result => _articlesResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllNutrients() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final article = await apiService.nutrients();
      if (article.nutrients.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _articlesResult = article;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }

  
}
