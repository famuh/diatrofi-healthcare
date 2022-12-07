import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/model/resep_detail.dart';
import 'package:flutter/material.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final ResultDetailResep restaurant;

  const RestaurantDetail({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: restaurant.thumb,
              child: Image.network(
                    restaurant.thumb,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.title,
                            style: kItemTittleCard,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                _barrierContent(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, right: 20, left: 20),
                      child: Text('Description', style: kItemTittleCard),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            top: 10, right: 20, left: 20, bottom: 20),
                        width: double.infinity,
                        child: Text(restaurant.desc,
                            style: kBodyText)),
                  ],
                ),
                _barrierContent(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 5, right: 20, left: 20),
                      child: Text('NeedItem', style: kItemTittleCard),
                    ),
                    ListBody(
                      children: restaurant.needItem.map((review) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 5, right: 20, left: 20, bottom: 5),
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepPurpleAccent),
                                child: Center(
                                    child: Text(
                                  review.itemName.characters.elementAt(0),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                _barrierContent()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _barrierContent() {
  return Container(
    height: 10,
    color: Colors.grey.shade200,
  );
}

Widget _sizebox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget _icon(IconData icon, double size, Color color) {
  return Icon(
    icon,
    size: size,
    color: color,
  );
}
