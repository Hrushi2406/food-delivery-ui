import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/animations/animations.dart';
import '../../core/utils/utils.dart';
import '../../core/widgets/button/buttons.dart';
import '../../core/widgets/custom_widgets.dart';
import '../delivery/delivery_screen.dart';
import 'widget/cart_items_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  final _duration = const Duration(milliseconds: 750);

  final _pseudoDuration = const Duration(milliseconds: 150);

  late double _height;

  late double _innerHeight;

  bool _showButtons = true;

  late final AnimationController _animationController;

  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(100 * SizeConfig.widthMultiplier, 0),
      // begin: Offset(300, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _slideInContainer() async {
    // await Future.delayed(Duration(milliseconds: 250));
    _animationController.forward();
  }

  _slideOutContainer() {
    _animationController.reverse();
  }

  _navigate() async {
    await _animateInnerContainerFromBottomToTop();

    await Future.delayed(const Duration(milliseconds: 250));

    //PUSH TO DELIVERY SCREEN
    //Wait till the CART is poped
    await Navigation.push(
      context,
      customPageTransition: PageTransition(
        duration: _duration,
        type: PageTransitionType.fadeIn,
        child: const DeliveryScreen(),
      ),
    );

    await _animateContainerFromTopToBottom();
  }

  _navigateBack() async {
    await _animateInnerContainerFromBottomToTop();

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

  _animateInnerContainerFromBottomToTop() async {
    //Animate back to default value
    _innerHeight = MediaQuery.of(context).padding.top + rh(50);
    _showButtons = false;
    setState(() {});

    //Wait till animation is completed
    await Future.delayed(_duration);

    _slideOutContainer();
  }

  _animateInnerContainerFromTopToBottom() async {
    await Future.delayed(
      const Duration(milliseconds: 200),
    );
    _slideInContainer();
    //Wait for few second
    await Future.delayed(
      const Duration(milliseconds: 750),
    );

    //Animate from top to bottom
    _innerHeight = 0.85 * MediaQuery.of(context).size.height;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ///Default Height
    _height = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});

    _innerHeight = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});

    //Animate the outer container From Top to Bottom
    _animateContainerFromTopToBottom();

    //Animate the inner container from top to bottom
    _animateInnerContainerFromTopToBottom();
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
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _slideAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: _slideAnimation.value,
                    child: child,
                  );
                },
                child: AnimatedContainer(
                  height: _innerHeight,
                  curve: Curves.fastOutSlowIn,
                  duration: _duration,
                  padding: const EdgeInsets.only(
                    bottom: space1x,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(rf(30)),
                      topRight: Radius.circular(rf(30)),
                      bottomLeft: Radius.circular(rf(30)),
                      bottomRight: Radius.circular(rf(30)),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          isHeroAnimated: false,
                          showOptions: false,
                          onBackTap: _navigateBack,
                        ),
                        SizedBox(height: rh(space3x)),
                        const CartItemsWidget(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: rh(space4x)),
              _showButtons
                  ? FadeAnimation(
                      duration: const Duration(milliseconds: 1750),
                      intervalStart: 0.50,
                      child: ScaleAnimation(
                        duration: const Duration(milliseconds: 1750),
                        intervalStart: 0.50,
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: space2x),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(space2x),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(rf(10)),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "\$22.74",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              SizedBox(
                                width: rw(space2x),
                              ),
                              Expanded(
                                child: Buttons.flexible(
                                  context: context,
                                  text: "CHECKOUT",
                                  borderRadius: 10,
                                  vPadding: space3x,
                                  onPressed: _navigate,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(height: rh(space4x)),
            ],
          ),
        ),
      ),
    );
  }
}
