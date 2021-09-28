import 'package:flutter/material.dart';

import '../../../core/animations/animations.dart';
import '../../../core/utils/ui_helper.dart';
import '../../../core/widgets/icon/custom_icons.dart';
import 'cart_item.dart';
import 'offer_card.dart';

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: space2x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cart",
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
          ),
          SizedBox(
            height: rh(10),
          ),
          Text(
            "DELIVER TO 779 CASSIE",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: rf(12),
                  height: 1.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
          ),
          SizedBox(
            height: rh(20),
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: 'FROM    ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: rf(14),
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'New York Donut.',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: rf(18),
                              color: Colors.white,
                            )),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(space1x),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  // color: const Color(0xFFF7F2F7),
                ),
                child: Row(
                  children: [
                    CIcons.fromMaterial(
                      icon: Icons.timer,
                      semanticLabel: "time",
                      size: 17,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    Text(
                      " 15-20 min",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: rh(10),
          ),
          // food item
          FadeAnimation(
            intervalStart: 0.60,
            duration: const Duration(milliseconds: 1750),
            child: SlideAnimation(
              intervalStart: 0.6,
              duration: const Duration(milliseconds: 1750),
              begin: const Offset(0, 200),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  const CardItem(
                    imagePath: "assets/images/temp_donat.jpg",
                    quantity: 1,
                    name: "Raspberry\nDonut",
                    price: 12.95,
                  ),
                  const CardItem(
                    imagePath: "assets/images/temp_donat.jpg",
                    quantity: 1,
                    name: "Raspberry\nDonut",
                    price: 12.95,
                  ),
                  OfferCard(
                      heading: "Delivery",
                      subHeading: "FREE",
                      icon: Image.asset("assets/images/fast-delivery.png",
                          color: Colors.white)),
                  OfferCard(
                    heading: "Promo Code",
                    subHeading: "No Code",
                    showAddBTN: true,
                    icon: Image.asset(
                      "assets/images/discount.png",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
