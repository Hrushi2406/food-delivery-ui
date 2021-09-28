import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/animations/animations.dart';
import 'package:food_delivery/core/widgets/custom_widgets.dart';

import '../../core/utils/utils.dart';
import '../../core/widgets/app_bar/custom_app_bar.dart';
import '../cart/cart_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _duration = const Duration(milliseconds: 750);

  final _pseudoDuration = const Duration(milliseconds: 150);

  late double _height;

  _navigate() async {
    await _animateContainerFromBottomToTop();

    //PUSH TO CART SCREEN
    //Wait till the CART is poped
    await Navigation.push(
      context,
      customPageTransition: PageTransition(
        duration: _duration,
        type: PageTransitionType.fadeIn,
        child: const CartScreen(),
      ),
    );

    await _animateContainerFromTopToBottom();
  }

  _navigateBack() async {
    await _animateContainerFromBottomToTop();

    Navigation.pop(context);
  }

  _animateContainerFromBottomToTop() async {
    //Animate back to default value
    _height = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});

    //Wait till animation is completed
    await Future.delayed(_duration);
  }

  _animateContainerFromTopToBottom() async {
    //Wait for few second
    await Future.delayed(_pseudoDuration);

    //Animate from top to bottom
    _height = MediaQuery.of(context).size.height;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ///Default Height
    _height = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});

    //Animate the container From Top to Bottom
    _animateContainerFromTopToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        height: _height,
        curve: Curves.fastOutSlowIn,
        duration: _duration,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      onBackTap: _navigateBack,
                    ),
                    SizedBox(
                      height: 50 * SizeConfig.heightMultiplier,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 0,
                            bottom: 0,
                            left: -180,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: ScaleAnimation(
                                duration: const Duration(milliseconds: 1000),
                                intervalStart: 0.2,
                                begin: 0,
                                curve: Curves.easeOutBack,
                                child: Image.asset(
                                  "assets/images/donut/donut_4.png",
                                  width: rw(380),
                                ),
                              ),
                            ),
                          ),

                          // food item info
                          Positioned.fill(
                            top: rh(40),
                            bottom: 0,
                            right: rw(space4x),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: FadeAnimation(
                                duration: const Duration(milliseconds: 1250),
                                child: ScaleAnimation(
                                  intervalStart: 0.4,
                                  duration: const Duration(milliseconds: 1250),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
// food item  details
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: space2x),
                      child: FadeAnimation(
                        intervalStart: 0.4,
                        duration: const Duration(milliseconds: 1300),
                        child: SlideAnimation(
                          intervalStart: 0.4,
                          begin: const Offset(0, 80),
                          duration: const Duration(milliseconds: 1300),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Raspberry Donut",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(),
                              ),
                              SizedBox(height: rh(space1x)),
                              Text(
                                "\$12.95",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: rf(18),
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              SizedBox(
                                height: rh(space2x),
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\nPellentesque habitant morbi tristique senectus et netus.',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
// bottom button
              FadeAnimation(
                duration: const Duration(milliseconds: 1500),
                intervalStart: 0.4,
                child: ScaleAnimation(
                  duration: const Duration(milliseconds: 1500),
                  intervalStart: 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: space2x,
                      vertical: space5x,
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Buttons.icon(
                            context: context,
                            icon: Icons.favorite_border,
                            size: 28,
                            iconColor: Theme.of(context).primaryColorDark,
                            top: space2x,
                            left: space2x,
                            right: space2x,
                            bottom: space2x,
                            semanticLabel: "favorate",
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: rw(space2x)),
                        Expanded(
                          child: Buttons.flexible(
                            vPadding: 20,
                            borderRadius: 15,
                            context: context,
                            text: "ADD TO CART",
                            onPressed: _navigate,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: rf(14)),
        ),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontSize: rf(16), height: 1.5),
        ),
        SizedBox(height: rh(space5x)),
      ],
    );
  }
}
