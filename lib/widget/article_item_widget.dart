import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common/constant.dart';

class ArticleItemWidget extends StatelessWidget {
  String articleTitle;
  String articleSubtitle;
  String articleImageUrl;
  ArticleItemWidget(
      {super.key,
      required this.articleTitle,
      required this.articleSubtitle,
      required this.articleImageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: kSoftGrey,
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
                  imageUrl: articleImageUrl,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Text(
              articleTitle,
              style: kItemTittleCard,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              articleSubtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: kBodyText,
            )
          ],
        ),
      ),
    );
  }
}
