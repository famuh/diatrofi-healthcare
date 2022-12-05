// import 'dart:io';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:diatfori/common/constant.dart';
// import 'package:diatfori/data/api/api_service.dart';
// import 'package:diatfori/data/model/resep_detail.dart';

// class DetailResepProvider extends ChangeNotifier {
//   final ApiService apiService;
//   final String key;

//   late Resepdetail _detailResep;
//   late ResultState _state;
//   String _message = '';

//   DetailResepProvider({required this.key, required this.apiService}) {
//     getDetailResep(key);
//   }

//   String get message => _message;
//   Resepdetail get result => _detailResep;
//   ResultState get state => _state;

//   Future<dynamic> getDetailResep(String key) async {
//     try {
//       _state = ResultState.loading;
//       notifyListeners();
//       final detailResep = await apiService.getDetailId(key);
//       if (detailResep.status) {
//         _state = ResultState.noData;
//         notifyListeners();
//         return _message = 'Empty Data';
//       } else {
//         _state = ResultState.hasData;
//         notifyListeners();
//         return _detailResep = detailResep;
//       }
//     } on SocketException {
//       _state = ResultState.error;
//       notifyListeners();
//       return _message = "No internet connection";
//     } catch (e) {
//       _state = ResultState.error;
//       notifyListeners();
//       return _message = e.toString();
//     }
//   }
// }
