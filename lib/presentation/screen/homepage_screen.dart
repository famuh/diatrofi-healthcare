import 'package:diatfori/common/constant.dart';

import 'package:diatfori/data/model/food/food.dart';
import 'package:diatfori/presentation/login/profile.dart';
import 'package:diatfori/presentation/provider/article_provider.dart';
import 'package:diatfori/presentation/provider/resep_list_provider.dart';
import 'package:diatfori/widget/article_item_widget.dart';
import 'package:diatfori/widget/food_item_widget.dart';
import 'package:diatfori/widget/reseplist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../widget/sub_heading.dart';
import 'calculate_screen.dart';

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
    Size size = MediaQuery.of(context).size;
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
                    autofocus: false,
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
                            : const Icon(Icons.close,
                                color: Colors.transparent)),
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
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfilePage.routeName);
                },
                icon: const Icon(
                  Icons.person_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              )
            ],
          ),

          //  gtau ni apaan
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                CalculateScreen.ROUTE_NAME,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 17, bottom: 17),
              padding: const EdgeInsets.symmetric(horizontal: 17),
              height: size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: kPink),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Text(
                          'Selamat datang di Diatrofi',
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      SizedBox(
                        width: 160,
                        child: Text(
                          'Mari wujudkan pola makan sehat mulai dari sekarang.',
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 12,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Lottie.asset(
                    "assets/lottie/login.json",
                    fit: BoxFit.fitWidth,
                    width: 125,
                  ),
                ],
              ),
            ),
          ),

          // articles
          SubHeading(
            title: 'Top 7 Today Articles',
            // onTap: (() => Navigator.push(context, MaterialPageRoute(builder: (_)=> article)))
          ),

          // article items
          Container(
              height: 230,
              // color: Colors.grey,
              padding: const EdgeInsets.only(right: 10),
              child: Consumer<ArticleProvider>(builder: (context, state, _) {
                if (state.state == ResultState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.state == ResultState.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 7, // ke halaman article utk artikel lengkap
                    itemBuilder: (context, index) {
                      var article = state.result.articles[index];
                      return ArticleItemWidget(article: article);
                    },
                  );
                } else if (state.state == ResultState.noData) {
                  return Center(
                    child: Material(
                      child: Text(state.message),
                    ),
                  );
                } else if (state.state == ResultState.error) {
                  return Center(
                    child: Material(
                      child: Text(state.message),
                    ),
                  );
                } else {
                  return const Center(
                    child: Material(
                      child: Text(''),
                    ),
                  );
                }
              })),
          const SizedBox(
            height: 15,
          ),
          // check this out
          SubHeading(
            title: 'check this out',
          ),
          Container(
              height: 230,
              // color: Colors.grey,
              padding: const EdgeInsets.only(right: 10),
              child: Consumer<ResepListProvider>(builder: (context, state, _) {
                if (state.state == ResultState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.state == ResultState.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state.result.results
                        .length, // ke halaman article utk artikel lengkap
                    itemBuilder: (context, index) {
                      var resep = state.result.results[index];
                      return ResepItem(resep: resep);
                    },
                  );
                } else if (state.state == ResultState.noData) {
                  return Center(
                    child: Material(
                      child: Text(state.message),
                    ),
                  );
                } else if (state.state == ResultState.error) {
                  return Center(
                    child: Material(
                      child: Text(state.message),
                    ),
                  );
                } else {
                  return const Center(
                    child: Material(
                      child: Text(''),
                    ),
                  );
                }
              })),
        ],
      ),
    ));
  }
}

_buildList(ctx) {
  return FutureBuilder(
    future: DefaultAssetBundle.of(ctx).loadString('assets/food_data.json'),
    builder: (context, AsyncSnapshot snapshot) {
      if (snapshot.hasError) {
        return const Text("error");
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      final List<Food> foods = foodListFromJson(snapshot.requireData).foods;

      return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: foods.length,
        itemBuilder: (BuildContext context, int index) {
          return FoodItemWidget(food: foods[index]);
        },
      );
    },
  );
}
