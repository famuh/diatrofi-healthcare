import 'package:diatfori/common/constant.dart';
import 'package:diatfori/presentation/homepage_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    List screen = [
      HomeScreen()
    ];

    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
        height: 55,
        decoration: BoxDecoration(
          color: kStrongGreen,
          borderRadius: BorderRadius.circular(30),

        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kMatteBlack,
          unselectedItemColor: kSoftGreen,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) {
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_rounded), label: "article"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded), label: "favorite"),
                BottomNavigationBarItem(
                icon: Icon(Icons.restaurant), label: "recipe"),
          ],
        ),
      ),
    );
  }
}
