import 'package:diatfori/common/constant.dart';
import 'package:diatfori/presentation/calculate_screen.dart';
import 'package:diatfori/presentation/mainpage.dart';
import 'package:diatfori/testing_ui.dart';
import 'package:flutter/material.dart';

import 'common/utils.dart';
import 'presentation/homepage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        colorScheme: kColorScheme,
        primaryColor: kMatteBlack,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CalculateScreen(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name){
          case '/home':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case '/cal':
            return MaterialPageRoute(builder: (_) => CalculateScreen());
          default:
             return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
        }
      },
    );
  }
}

