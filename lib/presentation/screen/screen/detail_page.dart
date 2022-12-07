import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/api/api_service.dart';
import 'package:diatfori/presentation/provider/resep_detail_provider.dart';
import 'package:diatfori/presentation/screen/screen/detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restauran_detail';
  final String keyResto;
  const RestaurantDetailPage({Key? key, required this.keyResto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          "Detail",
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: ChangeNotifierProvider<DetailResepProvider>(
        create: (_) =>
            DetailResepProvider(apiService: ApiService(), key: keyResto),
        child: Consumer<DetailResepProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.state == ResultState.hasData) {
              final restaurants = state.result.results;
              return RestaurantDetail(
                restaurant: restaurants,
              );
            } else if (state.state == ResultState.noData) {
              return Center(child: Text(state.message));
            } else if (state.state == ResultState.error) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Sorry, please check your internet connection.'));
            }
          },
        ),
      ),
    );
  }
}