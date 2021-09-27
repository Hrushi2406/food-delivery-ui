import 'package:flutter/material.dart';

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
        title: 'Flutter Demo',
        theme: AppTheme.light(),
        home: const HomeScreen(),
        // home: const CartScreen(),
      ),
    );
  }
}
