// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:diatfori/common/constant.dart';
// import 'package:diatfori/data/api/api_service.dart';
// import 'package:diatfori/data/model/resep_list.dart';

// class ResepListProvider extends ChangeNotifier {
//   final ApiService apiService;

//   ResepListProvider({required this.apiService}) {
//     _fetchAllResep();
//   }

//   late Reseplist _resepResult;
//   late ResultState _state;
//   String _message = '';

//   String get message => _message;

//   Reseplist get result => _resepResult;

//   ResultState get state => _state;

//   Future<dynamic> _fetchAllResep() async {
//     try {
//       _state = ResultState.loading;
//       notifyListeners();
//       final resep = await apiService.topHeadlines();
//       if (resep.results.isEmpty) {
//         _state = ResultState.noData;
//         notifyListeners();
//         return _message = 'Empty Data';
//       } else {
//         _state = ResultState.hasData;
//         notifyListeners();
//         return _resepResult = resep;
//       }
//     } on SocketException {
//       _state = ResultState.error;
//       notifyListeners();
//       return _message = "No internet connection";
//     } catch (e) {
//       _state = ResultState.error;
//       notifyListeners();
//       return _message = 'Error --> $e';
//     }
//   }
// }
