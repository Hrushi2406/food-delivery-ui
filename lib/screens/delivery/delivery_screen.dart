import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';
import 'package:food_delivery/core/animations/animations.dart';
import 'package:food_delivery/core/animations/slide_animation.dart';
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
          FadeAnimation(
            duration: const Duration(milliseconds: 1000),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 1000),
              begin: const Offset(-100, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CIcons.fromMaterial(
                      size: 64,
                      icon: Icons.card_giftcard,
                      semanticLabel: "delivery"),
                  SizedBox(height: rh(1.5 * space1x)),
                  Text(
                    "Delivery",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: rf(24),
                        ),
                  ),
                  Text(
                    "App",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: rf(24),
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: rh(80),
          ),
          ClippedContainer(
            height: rh(120),
            backgroundColor: Colors.white,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.5 * space5x),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 950),
                intervalStart: 0.45,
                curve: Curves.easeOutBack,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your favorite restaurant",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: rf(18),
                          ),
                    ),
                    SizedBox(
                      height: rh(space1x),
                    ),
                    Text(
                      "food deliverd home",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: rf(18),
                            // fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
