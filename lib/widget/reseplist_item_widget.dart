import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/data/model/resep_list.dart';
import 'package:diatfori/presentation/screen/item_detail_screen.dart';
import 'package:flutter/material.dart';

import '../common/constant.dart';

class ResepItem extends StatelessWidget {
  final ResultResep resep;
  const ResepItem({super.key, required this.resep});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: kSoftGrey,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 
          DetailScreen.ROUTE_NAME,
          arguments: resep.key
          );
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
                    imageUrl: resep.thumb,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Text(
                resep.title,
                maxLines: 2,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Durasi Penyajian : " + resep.times,
                maxLines: 2,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
