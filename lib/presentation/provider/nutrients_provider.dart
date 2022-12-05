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
