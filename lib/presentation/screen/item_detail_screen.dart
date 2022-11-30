import 'package:diatfori/common/constant.dart';
import 'package:diatfori/widget/kcal_widget.dart';
import 'package:diatfori/widget/nutritions_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  )),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.fire,
                    )),
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
                background: Image.network(
                    "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                    fit: BoxFit.cover),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      constraints: const BoxConstraints(maxWidth: 120),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5
                      ),
                      decoration: BoxDecoration(
                      color: Colors.pink[100],
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: KcalWidget(kcal: 123)),

                      const SizedBox(height: 10,),

                  // Informasi Nutrisi
                  Container(
                    width: mediaQuery.width,
                    height: 80,
                    decoration: BoxDecoration(
                    color: kSoftGreen,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NutritionWidget(title: "prots",total: 120,size: 18, color: kBrightGreen,),
                          NutritionWidget(title: "carbs",total: 120,size: 18, color: kCarbs,),
                          NutritionWidget(title: "fats",total: 120,size: 18,color: kFats,),

                        ],
                      ),
                    ),
                  ),
                  
                ],
              ),
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
