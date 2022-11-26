import 'package:diatfori/common/constant.dart';
import 'package:diatfori/presentation/article_screen.dart';
import 'package:diatfori/presentation/calculate_screen.dart';
import 'package:diatfori/firebase_options.dart';
import 'package:diatfori/presentation/login/welcome.dart';
import 'package:diatfori/presentation/mainpage.dart';
import 'package:diatfori/testing_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'common/utils.dart';
import 'presentation/homepage_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
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

      home: const MainPage(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name){
          case MainPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => MainPage());
          case CalculateScreen.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => CalculateScreen());
          // case '/articles':
          //   return MaterialPageRoute(builder: (_) => ArticleScreen());
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

