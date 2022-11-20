import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/common/constant.dart';
import 'package:diatfori/widget/article_item_widget.dart';
import 'package:diatfori/widget/food_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  bool? isSearch;
  String? searchItem;

  @override
  void initState() {
    isSearch = false;
    searchItem = '';
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListView(
        children: [
          // diatrofi
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Text('Diatrofi', style: kDiatrofi)),

          // search and profile
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // SEARCH
              Expanded(
                child: Container(
                  // width: 300,
                  margin: const EdgeInsets.only(right: 20),
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kSoftGrey),
                  child: TextField(
                    controller: searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                            left: 15, right: 5, bottom: 10),
                        hintText: "Search Something ...",
                        hintStyle: const TextStyle(color: kMatteBlack),
                        prefixIcon: const Icon(Icons.search_rounded),
                        suffixIcon: isSearch == true
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    searchController.value =
                                        TextEditingValue.empty;
                                    isSearch = false;
                                  });
                                },
                                icon: const Icon(Icons.close_rounded),
                              )
                            : Icon(Icons.close, color: Colors.transparent)),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          searchItem = value;
                          isSearch = true;
                        });
                      } else {
                        setState(() {
                          isSearch = false;
                        });
                      }
                    },
                  ),
                ),
              ),

              // PROFILE
              const CircleAvatar(
                backgroundColor: kStrongGreen,
              )
            ],
          ),

          //  gtau ni apaan
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: kPink,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text('Belum Tau ini mau dibuat fitur apa'),
            ),
          ),

          // articles
          _buildSubHeading(
              title: 'articles',
              onTap: (() => print('navigasi ke halaman article'))),

          // article items
          Container(
            height: 230,
            // color: Colors.grey,
            padding: const EdgeInsets.only(right: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ArticleItemWidget(
                    articleTitle: 'Lorem Ipsum dolor sit amet',
                    articleSubtitle:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    articleImageUrl:
                        'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                ArticleItemWidget(
                    articleTitle: 'Lorem Ipsum dolor sit amet',
                    articleSubtitle:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    articleImageUrl:
                        'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                ArticleItemWidget(
                    articleTitle: 'Lorem Ipsum dolor sit amet',
                    articleSubtitle:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    articleImageUrl:
                        'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
              ],
            ),
          ),

          // check this out
          _buildSubHeading(
              title: 'check this out',
              onTap: () => print('ke halaman rekomendasi')),

          // check this out item
          SizedBox(
            height: 500,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FoodItemWidget(foodImageUrl: 'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', kcal: 123, foodName: 'Spaghetti ayam bawank', foodDesc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                FoodItemWidget(foodImageUrl: 'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', kcal: 123, foodName: 'Spaghetti ayam bawank', foodDesc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                FoodItemWidget(foodImageUrl: 'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', kcal: 123, foodName: 'Spaghetti ayam bawank', foodDesc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                FoodItemWidget(foodImageUrl: 'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', kcal: 123, foodName: 'Spaghetti ayam bawank', foodDesc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                FoodItemWidget(foodImageUrl: 'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', kcal: 123, foodName: 'Spaghetti ayam bawank', foodDesc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
              ],
            ),
          )
        ],
      ),
    ));
  }

  _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kSection,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'See More',
                style: TextStyle(color: kBrightGreen),
              )),
        ),
      ],
    );
  }
}
