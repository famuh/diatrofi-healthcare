import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/data/model/article.dart';
import 'package:flutter/material.dart';

import '../common/constant.dart';
import '../presentation/article_web_view.dart';

class ArticleItemWidget extends StatelessWidget {
  final Article article;
  ArticleItemWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: kSoftGrey,
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(
                  context, ArticleWebView.routeName,
                    arguments: article.url);
        },
        child: Container(
          width: 210,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: 100,
                width: 200,
                height: 200 / 1.5,
                margin: const EdgeInsets.only(bottom: 5),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              Text(
                article.title,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                article.publishedAt.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kBodyText,
              )
            ],
          ),
        ),
      ),
      
    );
  }
}
