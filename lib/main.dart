import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_theme.dart';
import 'package:food_delivery/core/utils/utils.dart';
import 'package:food_delivery/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeConfiguration(
      builder: (_) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light(),
        home: const SplashScreen(),
      ),
    );
  }
}
