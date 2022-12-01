import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/constant.dart';
import '../../data/model/food/food.dart';
import '../../widget/kcal_widget.dart';
import '../../widget/nutritions_widget.dart';

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
    var mediaQuery = MediaQuery.of(context).size;
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama item
              Row(
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, color: kPink))
                ],
              ),

              // ingredients
              Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  constraints: const BoxConstraints(maxWidth: 120),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('ingredients')),

              SizedBox(
                height: 200,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: food.recipe.ingredient.length,
                    itemBuilder: (context, index) {
                      return Text(food.recipe.ingredient[index]);
                    }),
              ),

              // ingredients
              Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  constraints: const BoxConstraints(maxWidth: 120),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('steps')),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: food.recipe.steps.length,
                    itemBuilder: (context, index) {
                      return Text(food.recipe.steps[index]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
