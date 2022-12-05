import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/constant.dart';
import '../../data/model/food/food.dart';


class FoodRecipeScreen extends StatefulWidget {
  static const ROUTE_NAME = '/food-recipe';
  final Food food;
  const FoodRecipeScreen({super.key, required this.food});

  @override
  State<FoodRecipeScreen> createState() => _FoodRecipeScreenState();
}

class _FoodRecipeScreenState extends State<FoodRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    var food = widget.food;
    // var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //     title: const Text('Calculate Your Intake'),
      //     leading: IconButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         icon: const Icon(Icons.arrow_back_ios_rounded)),
      //   ),
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  )),
              actions: [
                // IconButton(
                //     onPressed: () {},
                //     icon: FaIcon(
                //       FontAwesomeIcons.fire,
                //     )),
                IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.plus,
                    )),
              ],
              elevation: 0,
              shadowColor: Colors.transparent,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(food.imgUrl, fit: BoxFit.cover),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              // Nama item
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        color: kPink,
                        size: 30,
                      ))
                ],
              ),

              // ingredients
              _sectionRecipe('ingredients'),
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  constraints: const BoxConstraints(
                    maxHeight: 50
                  ),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: food.recipe.ingredient.length,
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kStrongGreen),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(food.recipe.ingredient[index])
                            ],
                          );
                        }),
                  )),

              // steps
              _sectionRecipe('steps'),
              const SizedBox(height: 5,),
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 100,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: food.recipe.ingredient.length,
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kStrongGreen),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(food.recipe.steps[index])
                            ],
                          );
                        }),
                  )),

            ],
          ),
        ),
      ),
    );
  }

  Container _sectionRecipe(String title) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 120),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.pink[100], borderRadius: BorderRadius.circular(20)),
        child: Text(title));
  }
}
