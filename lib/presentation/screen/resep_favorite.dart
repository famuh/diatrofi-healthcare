import 'package:diatfori/common/constant.dart';
import 'package:flutter/material.dart';


class ResepFavoriteScreen extends StatefulWidget {
  static const ROUTE_NAME = '/favorite';
  const ResepFavoriteScreen({super.key});

  @override
  State<ResepFavoriteScreen> createState() => _ResepFavoriteScreen();
}

class _ResepFavoriteScreen extends State<ResepFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ListView(
        children: [
          // title
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                leading: const Icon(
                  Icons.favorite,
                  size: 50,
                  color: kStrongGreen,
                ),
                title: Text('Favorite Receipe !',
                    style:
                    kTitleScreen.copyWith(fontWeight: FontWeight.normal)),
                subtitle: const Text('Enjoy Your Receipce !'),
              )),

          SizedBox(
              height: MediaQuery.of(context).size.height, child: _buildList()),
        ],
      ),
    );
  }

  _buildList() {}
}
