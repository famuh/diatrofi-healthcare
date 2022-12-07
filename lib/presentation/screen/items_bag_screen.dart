import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/data/model/nutrisi.dart';
import 'package:diatfori/presentation/provider/nutrients_provider.dart';
import 'package:diatfori/widget/calculate_food_item_widget.dart';
import 'package:diatfori/widget/kcal_widget.dart';
import 'package:diatfori/widget/nutritions_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constant.dart';

class ItemBagScreen extends StatelessWidget {
  static const ROUTE_NAME = '/item-bag';
  const ItemBagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<NutrientProvider>(
          builder: (context, value, _) {
            return ListView.builder(
              itemCount: value.totalItems.length,
              itemBuilder: (context, index) {
                var item = value.totalItems[index];
                return _itemCal(item, index);
              },
            );
          },
        ),
      ),
    );
  }

  Container _itemCal(Nutrient item, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kSoftGreen
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // nama
          Text(
            '  ${item.name}',
            overflow: TextOverflow.ellipsis,
            style: kSection.copyWith(
              fontSize: 18
            ),
          ),
          const SizedBox(height: 5,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: item.pictureId,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KcalWidget(kcal: item.kalori),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: 160,
                    child: Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,                   
                      children: [
                        NutritionWidget(
                          title: 'prots',
                          total: item.protein,
                          color: kBrightGreen,
                        ),
                        NutritionWidget(
                          title: 'carbs',
                          total: item.karbohidrat,
                          color: kCarbs,
                        ),
                        NutritionWidget(
                          title: 'fats',
                          total: item.lemak,
                          color: kFats,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10,),
              Consumer<NutrientProvider>(
                builder: (context, val, _) {
                  return Row(
                    children: [
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
                          val.addItem(
                              item.id,
                              item.name,
                              item.kategori,
                              item.pictureId,
                              item.kalori,
                              item.lemak,
                              item.protein,
                              item.karbohidrat);
                          val.calculateKalori();
                          print("total ${val.totalItems}");
                        },
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: kStrongGreen,
                          child: Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          val.delItem(index);
                          val.calculateKalori();
                          print("total ${val.totalItems}");
                        },
                      ),
                    ],
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
