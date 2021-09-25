import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';
import '../../core/widgets/app_bar/custom_app_bar.dart';
import '../cart/cart_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  _navigate() {
    Navigation.push(
      context,
      screen: const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: rh(380),
              ),

              // food item image
              Positioned(
                left: -150,
                child: Image.asset(
                  "assets/images/temp_donut.png",
                  width: rw(380),
                  height: rh(380),
                ),
              ),

              // food item info
              Positioned(
                top: 0,
                bottom: 0,
                right: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ProductInfoText(
                      text: "Weight",
                      value: "400g",
                    ),
                    ProductInfoText(
                      text: "Calories",
                      value: "567 cal",
                    ),
                    ProductInfoText(
                      text: "Peope",
                      value: "1 person",
                    )
                  ],
                ),
              ),
            ],
          ),
// food item  details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: space2x),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Raspberry Donut",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  "\$12.95",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Theme.of(context).primaryColorDark,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                SizedBox(
                  height: rh(space2x),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nPellentesque habitant morbi tristique senectus et netus.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),

// bottom button
          // Row(
          //   children: [
          //     Buttons.icon(
          //       icon: Icons.favorite_border,
          //       size: 28,
          //       iconColor: Theme.of(context).primaryColorDark,
          //       context: context,
          //       borderRadius: 23,
          //       top: space2x,
          //       left: space2x,
          //       right: space2x,
          //       bottom: space2x,
          //       semanticLabel: "favorate",
          //       onPressed: () {},
          //     ),
          //     Buttons.expanded(
          //         context: context, text: "ADD TO CART", onPressed: () {})
          //   ],
          // )
        ],
      ),
    );
  }
}

class ProductInfoText extends StatelessWidget {
  const ProductInfoText({Key? key, required this.text, required this.value})
      : super(key: key);
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style:
              Theme.of(context).textTheme.headline6!.copyWith(fontSize: rf(16)),
        ),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontSize: rf(18), height: 1.5),
        ),
        SizedBox(height: rh(space3x)),
      ],
    );
  }
}
