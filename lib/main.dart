import 'package:diatfori/common/constant.dart';
import 'package:diatfori/firebase_options.dart';
import 'package:diatfori/presentation/login/profile.dart';
import 'package:diatfori/presentation/login/welcome.dart';
import 'package:diatfori/presentation/screen/item_detail_screen.dart';
import 'package:diatfori/presentation/screen/test_recipe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'common/utils.dart';
import 'presentation/screen/article_web_view.dart';
import 'presentation/screen/calculate_screen.dart';
import 'presentation/screen/mainpage.dart';

void main() async {
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
      home: const WelcomePage(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MainPage.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => const MainPage());
          case CalculateScreen.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => const CalculateScreen());
          // case '/articles':
          //   return MaterialPageRoute(builder: (_) => ArticleScreen());
          case ArticleWebView.routeName:
            final url = settings.arguments as String;
            return MaterialPageRoute(
                builder: (_) => ArticleWebView(url: url), settings: settings);
          case DetailScreen.ROUTE_NAME:
            return MaterialPageRoute(builder: (_) => DetailScreen());
          case ProfilePage.routeName:
            return MaterialPageRoute(builder: (_) => ProfilePage());
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
