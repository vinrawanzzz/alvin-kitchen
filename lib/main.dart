import 'package:alvin_kitchen/screens/home_screen.dart';
import 'package:alvin_kitchen/screens/order_screen.dart';
import 'package:alvin_kitchen/screens/splash_screen.dart';

import './screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A-Kitchen',
      initialRoute: '/',
      routes: {
        '/': (ctx) => SplashScren(),
        // ignore: prefer_const_constructors
        LoginScreen.routeName: (ctx) => LoginScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        OrderScreen.routeName: (ctx) => OrderScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
