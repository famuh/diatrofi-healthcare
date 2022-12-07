import 'package:diatfori/presentation/screen/resep_screen.dart';
import 'package:flutter/material.dart';

class RestaurantHomePage extends StatefulWidget {
  const RestaurantHomePage({Key? key}) : super(key: key);

  @override
  State<RestaurantHomePage> createState() => _RestaurantHomePageState();
}

class _RestaurantHomePageState extends State<RestaurantHomePage> {
  int _selectedIndex = 0;
  static const TextStyle myTextTheme =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const ResepScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: const Text(
          "Restaurants",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      unselectedFontSize: 0,
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black.withOpacity(0.5),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: Colors.deepPurple,
      elevation: 0, //ketebalan shadow
      items: const [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search))
      ],
      onTap: (index) {
        _onItemTapped(index);
      },
    );
  }
}