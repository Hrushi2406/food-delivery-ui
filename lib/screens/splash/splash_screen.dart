import 'dart:async';

import 'package:flutter/material.dart';
import '../../core/animations/animations.dart';
import '../../core/utils/utils.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _next();
  }

  _next() {
    Timer(const Duration(milliseconds: 450), () {
      Navigation.push(
        context,
        customPageTransition: PageTransition(
          type: PageTransitionType.fadeIn,
          child: const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(),
    );
  }
}
