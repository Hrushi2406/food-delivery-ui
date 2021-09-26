import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';
import 'package:food_delivery/core/utils/utils.dart';
import 'package:food_delivery/core/widgets/custom_widgets.dart';
import 'package:food_delivery/screens/home/home_screen.dart';
import 'package:food_delivery/widgets/clipped_container.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  _navigate() {
    Navigation.push(
      context,
      screen: const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPink,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CIcons.fromMaterial(
              size: 64, icon: Icons.card_giftcard, semanticLabel: "delivery"),
          Text(
            "Delivery",
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            "App",
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: rh(80),
          ),
          ClippedContainer(
            height: 120,
            backgroundColor: Colors.white,
            child: Container(
              padding: const EdgeInsets.only(left: space5x),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your favorite restaurant",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  SizedBox(
                    height: rh(10),
                  ),
                  Text(
                    "food deliered home",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.normal,
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
