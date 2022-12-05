// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:diatfori/common/constant.dart';
// import 'package:diatfori/data/api/api_service.dart';
// import 'package:diatfori/data/model/resep_search.dart';

// class SearchResepProvider extends ChangeNotifier {
//   final ApiService apiService;

//   SearchResepProvider({required this.apiService}) {
//     fetchAllResep(search);
//   }

//   Resepsearch? _resepResult;
//   ResultState? _state;
//   String _message = '';
//   String _search = '';

//   String get message => _message;

//   Resepsearch? get result => _resepResult;

//   String get search => _search;

//   ResultState? get state => _state;

//   Future<dynamic> fetchAllResep(String search) async {
//     try {
//       if (search.isNotEmpty) {
//         _state = ResultState.loading;
//         _search = search;
//         notifyListeners();
//         final resep = await apiService.getTextField(search);
//         if (resep.results.isEmpty) {
//           _state = ResultState.noData;
//           notifyListeners();
//           return _message = 'Empty Data!';
//         } else {
//           _state = ResultState.hasData;
//           notifyListeners();
//           return _resepResult = resep;
//         }
//       } else {
//         return _message = 'text null';
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
