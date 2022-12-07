import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/model/resep_detail.dart';
import 'package:diatfori/presentation/screen/screen/resep_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemDetailScreen extends StatelessWidget {
  static const ROUTE_NAME = '/detail';
  final ResultDetailResep resep;
  const ItemDetailScreen({super.key, required this.resep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      NestedScrollView(
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
                      Navigator.pushNamed(context, ResepDetailScreen.ROUTE_NAME, arguments: resep);
                    },
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
                    resep.thumb,
                    fit: BoxFit.cover),
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
              Text(
                resep.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              // deskripsi
              Text(
                resep.desc,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
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
