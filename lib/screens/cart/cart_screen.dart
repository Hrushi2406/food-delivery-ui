import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/utils.dart';
import 'package:food_delivery/screens/delivery/delivery_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _navigate() {
    Navigation.push(
      context,
      screen: const DeliveryScreen(),
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
