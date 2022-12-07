import 'package:diatfori/data/model/resep_list.dart';
import 'package:diatfori/presentation/screen/screen/detail_page.dart';
import 'package:flutter/material.dart';

class CardRestaurant extends StatelessWidget {
  final ResultResep restaurant;

  const CardRestaurant({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RestaurantDetailPage(keyResto: restaurant.key);
        }));
      },
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Hero(
                tag: restaurant.thumb,
                child: Container(
                            ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.black),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Row iconWithText(BuildContext context,
        {IconData? icon, required String text}) {
      return Row(
        children: [
          Icon(
            icon,
            size: 15,
            color: Colors.blueGrey,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.deepPurple),
          ),
        ],
      );
    }
