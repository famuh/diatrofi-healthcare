import 'package:diatfori/common/constant.dart';
import 'package:diatfori/widget/calculate_food_item_widget.dart';
import 'package:diatfori/widget/sub_heading.dart';
import 'package:flutter/material.dart';

import '../widget/nutritions_widget.dart';

class CalculateScreen extends StatefulWidget {
  static const ROUTE_NAME = '/cal';
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    final listItem = [];
    final double totalProts = 0;
    final double totalCarbs = 0;
    final double totalFats = 0;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculate Your Intake'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: SizedBox(
          width: mediaQuery.width,
          height: mediaQuery.height,
          child: Stack(
            children: [
              // 1
              SizedBox(
                width: mediaQuery.width,
                height: mediaQuery.height / 1.3,
                // color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  child: ListView(
                    children: [
                      SubHeading(
                          title: 'food',
                          // onTap: (() => print('ke halaman more'))
                          ),
                      Container(
                        height: 120,
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CalculateFoodItemWidget(
                                imgUrl:
                                    'https://images.unsplash.com/photo-1577110058859-74547db40bc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                                kcal: 123,
                                itemName: 'Rice',
                                prots: 103,
                                carbs: 13,
                                fats: 144),
                            CalculateFoodItemWidget(
                                imgUrl:
                                    'https://images.unsplash.com/photo-1577110058859-74547db40bc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                                kcal: 123,
                                itemName: 'Rice',
                                prots: 103,
                                carbs: 13,
                                fats: 144),
                            CalculateFoodItemWidget(
                                imgUrl:
                                    'https://images.unsplash.com/photo-1577110058859-74547db40bc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                                kcal: 123,
                                itemName: 'Rice',
                                prots: 103,
                                carbs: 13,
                                fats: 144),
                          ],
                        ),
                      ),
                      SubHeading(
                          title: 'drink',
                          // onTap: (() => print('ke halaman more'))
                          ),
                      Container(
                        height: 120,
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CalculateFoodItemWidget(
                                imgUrl:
                                    'https://images.unsplash.com/photo-1577110058859-74547db40bc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                                kcal: 123,
                                itemName: 'Rice',
                                prots: 103,
                                carbs: 13,
                                fats: 144),
                            CalculateFoodItemWidget(
                                imgUrl:
                                    'https://images.unsplash.com/photo-1577110058859-74547db40bc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                                kcal: 123,
                                itemName: 'Rice',
                                prots: 103,
                                carbs: 13,
                                fats: 144),
                            CalculateFoodItemWidget(
                                imgUrl:
                                    'https://images.unsplash.com/photo-1577110058859-74547db40bc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                                kcal: 123,
                                itemName: 'Rice',
                                prots: 103,
                                carbs: 13,
                                fats: 144),
                          ],
                        ),
                      ),
                      SubHeading(
                          title: 'fruit & vegie',
                          // onTap: (() => print('ke halaman more'))
                          ),
                      Container(
                        height: 120,
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CalculateFoodItemWidget(
                                imgUrl:
                                    'https://images.unsplash.com/photo-1577110058859-74547db40bc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                                kcal: 123,
                                itemName: 'Rice',
                                prots: 103,
                                carbs: 13,
                                fats: 144),
                            CalculateFoodItemWidget(
                                imgUrl:
                                    'https://images.unsplash.com/photo-1577110058859-74547db40bc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                                kcal: 123,
                                itemName: 'Rice',
                                prots: 103,
                                carbs: 13,
                                fats: 144),
                            CalculateFoodItemWidget(
                                imgUrl:
                                    'https://images.unsplash.com/photo-1577110058859-74547db40bc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                                kcal: 123,
                                itemName: 'Rice',
                                prots: 103,
                                carbs: 13,
                                fats: 144),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              
              // total
              Positioned(
                bottom: 0,
                child: Container(
                  width: mediaQuery.width,
                  height: mediaQuery.height / 5.5,
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: kStrongGreen,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(bottom: 8),

                        // width: mediaQuery.width/5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('total for', style: kItemTittleCard.copyWith(fontWeight: FontWeight.w500, color: kSoftGrey),),
                            const Spacer(),
                            SizedBox(
                                width: 90,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: kMatteBlack,
                                      child: Text(listItem.length.toString()),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Text('items', style: kItemTittleCard.copyWith(fontWeight: FontWeight.w500, color: kSoftGrey)),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        height: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 50,
                              child: NutritionWidget(
                                title: 'prots',
                                total: totalProts,
                                color: kBrightGreen,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: NutritionWidget(
                                title: 'carbs',
                                total: totalCarbs,
                                color: Colors.orange[800],
                                size: 18,
                                
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: NutritionWidget(
                                title: 'fats',
                                total: totalFats,
                                color: const Color.fromARGB(255, 212, 132, 3),
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
