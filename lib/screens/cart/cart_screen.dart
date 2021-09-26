import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constant.dart';
import '../../core/utils/utils.dart';
import '../../core/widgets/button/buttons.dart';
import '../delivery/delivery_screen.dart';
import 'widget/cart_items_widget.dart';

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
      body: Stack(
        children: [
          Container(
            color: lightPink,
          ),
          // cart form item
          const CartItemsWidget(),
          // bottom bottom
          Positioned(
              bottom: 20,
              left: space2x,
              right: space2x,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(space2x),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Text(
                      "\$22.74",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(
                    width: rw(20),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Buttons.expanded(
                        context: context,
                        text: "CHECKOUT",
                        hPadding: space2x,
                        vPadding: space2x,
                        onPressed: () {}),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
