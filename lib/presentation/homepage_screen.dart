import 'package:diatfori/common/constant.dart';
import 'package:flutter/material.dart';

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
                  margin: const EdgeInsets.only(
                    right: 20
                  ),
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: kSoftGrey),
                  child: TextField(
                    controller: searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 15, right: 5, bottom: 10),
                      hintText: "Search Something ...",
                      hintStyle: const TextStyle(color: kMatteBlack ),
                      prefixIcon: const Icon(Icons.search_rounded),
                      suffixIcon: 
                      isSearch == true
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
                                    : Icon(Icons.close, color: Colors.transparent)
                    ),
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
          )
        ],
      ),
    ));
  }
}
