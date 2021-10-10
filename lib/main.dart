import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/Screens/image_screen.dart';
import 'package:wallpaper_app/Screens/search_screen.dart';
import 'package:wallpaper_app/providers/image_provider.dart';

import 'Screens/home_screen.dart';
import 'constants/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: black, systemNavigationBarColor: black));
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ImageGetterProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(backgroundColor: white),
      home: const HomeScreen(),
      routes: {
        ImageScreen.routeName: (ctx) => const ImageScreen(),
        SearchScreen.routeName: (ctx) => const SearchScreen()
      },
    );
  }
}
