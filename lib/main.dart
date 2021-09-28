import 'package:flutter/material.dart';
import 'package:food_delivery/screens/cart/cart_screen.dart';
import 'package:food_delivery/screens/delivery/delivery_screen.dart';
import 'package:food_delivery/screens/splash/splash_screen.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/utils.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeConfiguration(
      builder: (_) => MaterialApp(
        title: 'Delicious',
        theme: AppTheme.light(),
        home: const SplashScreen(),
      ),
    );
  }
}
