import 'package:flutter/material.dart';
import 'package:islamic_app/app_theme.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme: MyAppTheme.lightTheme,
      routes: {HomeScreen.routeName: (context) => HomeScreen()},
    );
  }
}
