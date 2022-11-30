import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/widget/nutritions_widget.dart';
import 'package:flutter/material.dart';

import '../common/constant.dart';
import 'kcal_widget.dart';

class CalculateFoodItemWidget extends StatefulWidget {
  String imgUrl;
  double kcal;
  String itemName;
  double prots;
  double carbs;
  double fats;

  CalculateFoodItemWidget(
      {super.key,
      required this.imgUrl,
      required this.kcal,
      required this.itemName,
      required this.prots,
      required this.carbs,
      required this.fats});

  @override
  State<CalculateFoodItemWidget> createState() =>
      _CalculateFoodItemWidgetState();
}

class _CalculateFoodItemWidgetState extends State<CalculateFoodItemWidget> {
  @override
  Widget build(BuildContext context) {
    String imgUrl = widget.imgUrl;
    double kcal = widget.kcal;
    String itemName = widget.itemName;
    double prots = widget.prots;
    double carbs = widget.carbs;
    double fats = widget.fats;

    return Container(
      width: 320,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: kSoftGreen, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // foto
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),

          // segmen 2
          SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KcalWidget(kcal: kcal),
                          const SizedBox(height: 5),
                          Text(
                            itemName,
                            style: kItemTittleCard,
                          )
                        ],
                      ),
                      InkWell(
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: kStrongGreen,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          print('add item');
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NutritionWidget(
                        title: 'prots',
                        total: prots,
                        color: kBrightGreen,
                      ),
                      NutritionWidget(
                        title: 'carbs',
                        total: carbs,
                        color: kCarbs,
                      ),
                      NutritionWidget(
                        title: 'fats',
                        total: fats,
                        color: kFats,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
