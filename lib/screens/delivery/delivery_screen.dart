import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';
import 'package:food_delivery/core/animations/animations.dart';
import 'package:food_delivery/core/utils/utils.dart';
import 'package:food_delivery/core/widgets/custom_widgets.dart';
import 'package:food_delivery/screens/home/home_screen.dart';
import 'package:food_delivery/widgets/clipped_container.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen>
    with SingleTickerProviderStateMixin {
  //Using for fade transition
  late final AnimationController _animationController;

  //For animating the delivery icon
  late final Animation<Offset> _slideFromLeft;
  //For animating the text in clipped container
  late final Animation<Offset> _slideFromRight;
  //For animating clipped container
  late final Animation<Offset> _slideClippedContainer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 950),
    );

    _slideFromLeft = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));

    _slideFromRight = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.4,
        1,
        curve: Curves.easeOutBack,
      ),
    ));
    _slideClippedContainer = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));

    _animationController.forward();

    //Navigate to home screen after 2 seconds
    Timer(const Duration(seconds: 2), _navigate);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _navigate() async {
    _animationController.reverse();
    //Wait until the animation is finished
    await Future.delayed(const Duration(milliseconds: 750));

    Navigation.push(
      context,
      customPageTransition: PageTransition(
        type: PageTransitionType.fadeIn,
        child: const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPink,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _animationController,
            child: SlideTransition(
              position: _slideFromLeft,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/delivery.png",
                    width: rw(90),
                  ),
                  SizedBox(height: rh(space1x)),
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
                          fontSize: rf(20),
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: rh(80),
          ),
          SlideTransition(
            position: _slideClippedContainer,
            child: ClippedContainer(
              height: rh(120),
              backgroundColor: Colors.white,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.5 * space5x),
                child: SlideTransition(
                  position: _slideFromRight,
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
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
