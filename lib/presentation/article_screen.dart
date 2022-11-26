import 'package:diatfori/common/constant.dart';
import 'package:diatfori/presentation/provider/article_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/article_card_widget.dart';

class ArticleScreen extends StatefulWidget {
  static const ROUTE_NAME = '/articles';
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListView(
        children: [
          // title
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Text('Articles', style: kTitleScreen)),

          // // reccomendations
          // Text('Recommendation', style: kSection,),
            Container(
            height: MediaQuery.of(context).size.height,
            // color: Colors.grey,
            padding: const EdgeInsets.only(right: 10),
            child: _buildList()
          ),
          

          
        ],
      ),
    );
  }
  _buildList(){
    return Consumer<ArticleProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.result.articles.length,
            itemBuilder: (context, index) {
              var article = state.result.articles[index];
              return CardArticle(article: article);
            },
          );
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else {
          return const Center(
            child: Material(
              child: Text(''),
            ),
          );
        }
  });
  }}