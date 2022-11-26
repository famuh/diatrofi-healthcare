import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/presentation/article_web_view.dart';
import 'package:flutter/material.dart';

import '../common/constant.dart';
import '../data/model/article.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSoftGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 80,
        child: Center(
          child: ListTile(
              // contentPadding:
              //     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              leading: SizedBox(
                // height: 100,
                height: 100,
                width: 100,
                // color: Colors.black,
                // margin: const EdgeInsets.only(bottom: 5),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              title: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                // style: TextStyle(
                //   fontWeight: FontWeight.w400,
                //   fontSize: 16
                // ),
              ),
              subtitle: Text(article.author!),
              onTap: () {
                Navigator.pushNamed(
                  context, ArticleWebView.routeName,
                    arguments: article.url);
              }
              // Navigator.pushNamed(
              //   context,
              //   ArticleDetailPage.routeName,
              //   arguments: article,
              // ),
              ),
        ),
      ),
    );
  }
}
