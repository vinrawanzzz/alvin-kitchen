import 'dart:async';

import 'package:alvin_kitchen/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScren extends StatefulWidget {
  SplashScren({Key? key}) : super(key: key);

  @override
  _SplashScrenState createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  timer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() async {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // ignore: sized_box_for_whitespace
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('./assets/images/BG_Panca.png'),
              fit: BoxFit.cover),
        ),
        width: 1500,
        height: 1500,
        child: const Image(
          image: AssetImage('./assets/images/Artboard1.png'),
        ),
      )),
    );
  }
}
