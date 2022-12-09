import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/api/api_service.dart';
import 'package:diatfori/presentation/provider/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../data/model/food/food.dart';
import '../../data/model/resep_detail.dart';
import '../../widget/kcal_widget.dart';
import 'food_recipe_screen.dart';

class DetailScreen extends StatelessWidget {
  static const ROUTE_NAME = '/resep-detail';
  String keyResep;
  DetailScreen({super.key, required this.keyResep});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) =>
          DetailProvider(apiService: ApiService(), keyResep: keyResep),
      child: Scaffold(
        body: Consumer<DetailProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.state == ResultState.hasData) {
              var resep = state.result.results;
              return NestedScrollView(
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
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, FoodRecipeScreen.ROUTE_NAME,
                                  arguments: ModalRoute.of(context)?.settings
                                      as ResultDetailResep);
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.fire,
                            )),
                      ],
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      expandedHeight: 300,
                      flexibleSpace: FlexibleSpaceBar(
                        background:
                            Image.network(resep.thumb, fit: BoxFit.cover),
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
                      // Penulis
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration:
                                BoxDecoration(color: kPink.withOpacity(.7)),
                            child: Text('Oleh : ${resep.author.user}'),
                          ),
                          Text(
                            resep.author.datePublished,
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      ),

                      // Nama item
                      Text(
                        resep.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // tingkat kesulitan
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: const BoxDecoration(color: kSoftGreen),
                        child: Text(resep.difficulty),
                      ),

                      // deskripsi
                      // Container(
                      //   margin: const EdgeInsets.symmetric(vertical: 10),
                      //   width: mediaQuery.width,
                      //   child: Text(
                      //     resep.desc,
                      //     maxLines: 4,
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                      // ),
                      ExpandableText(resep.desc)
                    ],
                  ),
                ),
              );
            } else if (state.state == ResultState.error) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );

    // Scaffold(
    //     body: Stack(
    //   children: [
    //     Container(
    //       height: mediaQuery.height,
    //       width: mediaQuery.width,
    //       decoration: BoxDecoration(
    //           color: Colors.grey,
    //           borderRadius:
    //               BorderRadius.only(bottomRight: Radius.circular(30))),
    //       child: Stack(
    //         children: [
    //           Container(
    //             width: mediaQuery.width,
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: NetworkImage('https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),

    //           // ICON BUTTON
    // Container(
    //   width: mediaQuery.width,
    //   margin: EdgeInsets.all(30),
    //   height: 50,
    //   // color: Colors.black,
    //   child: Row(
    //     children: [
    //       customIconButton(Icon(Icons.arrow_back_ios_new_rounded),
    //           () => {print('tapped !')}),
    //       const Spacer(),
    //       customIconButton(
    //           FaIcon(
    //             FontAwesomeIcons.fire,
    //           ),
    //           () => {print('tapped !')}),
    //       const SizedBox(
    //         width: 8,
    //       ),
    //       customIconButton(
    //           Icon(Icons.add), () => {print('tapped !')}),
    //     ],
    //   ),
    // ),
    //     ],
    //   ),
    // ),
    //     Positioned(
    //       bottom: 0,
    //       child: Container(
    //         height: mediaQuery.height / 2.3,
    //         width: mediaQuery.width,
    //         padding: EdgeInsets.symmetric(
    //           vertical: 0,
    //           horizontal: 20
    //         ),
    //         decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
    //             child: ListView(
    //               scrollDirection: Axis.vertical,
    //               children: [
    //                 Container(
    //                   height: 80,
    //                   color: Colors.green,
    //                 )
    //               ],
    //             ),
    //       ),
    //     ),
    //   ],
    // )

    // );
  }

  InkWell customIconButton(icon, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 20,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: kMatteBlack, borderRadius: BorderRadius.circular(10)),
        child: icon,
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text);

  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => new _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      AnimatedSize(
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
              constraints: widget.isExpanded
                  ? BoxConstraints()
                  : BoxConstraints(maxHeight: 50.0),
              child: Text(
                widget.text,
                softWrap: true,
                overflow: TextOverflow.fade,
              ))),
      widget.isExpanded
          ? ConstrainedBox(constraints: BoxConstraints())
          : TextButton(onPressed: () => setState(() => widget.isExpanded = true), child: Text('selengkapnya'))
    ]);
  }
}
