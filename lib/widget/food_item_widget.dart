import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/presentation/screen/item_detail_screen.dart';
import 'package:diatfori/widget/kcal_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../common/constant.dart';

class FoodItemWidget extends StatelessWidget {
  String foodImageUrl;
  double kcal;
  String foodName;
  String foodDesc;

  FoodItemWidget(
      {super.key,
      required this.foodImageUrl,
      required this.kcal,
      required this.foodName,
      required this.foodDesc});

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
                    imageUrl: foodImageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 2, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // kcal
                    KcalWidget(kcal: kcal),
      
                    // title
                    Text(
                      foodName,
                      style: kItemTittleCard,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      foodDesc,
                      style: kBodyText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                ),
              ))
            ],
          ),
        ),

        onTap: (){
          Navigator.pushNamed(context, DetailScreen.ROUTE_NAME);
        },
      ),
      
    );
  }
}
