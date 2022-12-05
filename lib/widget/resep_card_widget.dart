import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/data/model/resep_list.dart';
import 'package:flutter/material.dart';

import '../common/constant.dart';
import '../data/model/article.dart';
import '../presentation/screen/article_web_view.dart';

class ResepCard extends StatelessWidget {
  final ResultResep resep;

  const ResepCard({Key? key, required this.resep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSoftGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 80,
        child: Center(
          child: ListTile(
              leading: SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: resep.thumb,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
              ),
              title: Text(
                resep.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(resep.thumb),
              onTap: () {}
          ),
        ),
      ),
    );
  }
}
