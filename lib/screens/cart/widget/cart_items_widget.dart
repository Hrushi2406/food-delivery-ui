import 'package:flutter/material.dart';

import '../../../core/utils/ui_helper.dart';
import '../../../core/widgets/icon/custom_icons.dart';
import 'cart_item.dart';
import 'offer_card.dart';

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      child: Container(
        padding: EdgeInsets.only(top: rh(60), left: space2x, right: space2x),
        width: double.infinity,
        height: deviceSize.height - 120,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
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
                          fontSize: rf(16),
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'New York Donut.',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: rf(20),
                                    color: Colors.white,
                                  )),
                    ],
                  ),
                ),
                SizedBox(
                  width: rw(20),
                ),
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
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
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
                    icon: CIcons.fromMaterial(
                        icon: Icons.car_rental,
                        size: 36,
                        color: Colors.white,
                        semanticLabel: "free deliver"),
                  ),
                  OfferCard(
                    heading: "Delivery",
                    subHeading: "FREE",
                    showAddBTN: true,
                    icon: CIcons.fromMaterial(
                        icon: Icons.disc_full_rounded,
                        size: 36,
                        color: Colors.white,
                        semanticLabel: "free deliver"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
