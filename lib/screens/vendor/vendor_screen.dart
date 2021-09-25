import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/utils.dart';
import 'package:food_delivery/screens/product/product_screen.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({Key? key}) : super(key: key);

  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  _navigate() {
    Navigation.push(
      context,
      screen: const ProductScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
