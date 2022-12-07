import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/model/resep_detail.dart';
import 'package:diatfori/presentation/screen/screen/item_resep_detail.dart';
import 'package:flutter/material.dart';

class ResepDetail extends StatelessWidget {
  static const ROUTE_NAME = '/resep_detail';
  final ResultDetailResep detailResep;

  const ResepDetail({Key? key, required this.detailResep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kSoftGreen,
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: detailResep.thumb,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 2, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Text(
                      detailResep.title,
                      style: kItemTittleCard,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      detailResep.desc,
                      style: kBodyText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Durasi Penyajian : " + detailResep.times,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 5, right: 20, left: 20),
                          child: Text('NeedItem', style: kAuthScreen),
                        ),
                        ListBody(
                          children: detailResep.needItem.map((food) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, right: 20, left: 20, bottom: 5),
                              child: Text(
                                '- ${detailResep.title}',
                                style: kAuthScreen,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
        onTap: (){
          Navigator.pushNamed(context, ItemDetailScreen.ROUTE_NAME, arguments: detailResep);
        },
      ),
    );
  }
}
