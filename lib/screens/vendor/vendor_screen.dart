import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/animations/animations.dart';
import '../../core/animations/fade_animation.dart';
import '../../core/utils/utils.dart';
import '../../core/widgets/custom_widgets.dart';
import '../../data.dart';
import '../../widgets/clipped_container.dart';
import '../product/product_screen.dart';
import 'widget/vendor_info_card.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({Key? key}) : super(key: key);

  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  final _duration = const Duration(milliseconds: 750);

  final _pseudoDuration = const Duration(milliseconds: 150);

  late double _height;

  _navigate() async {
    await _animateContainerFromBottomToTop();

    //PUSH TO PRODUCT SCREEN
    //Wait till the PRODUCT is poped
    await Navigation.push(
      context,
      customPageTransition: PageTransition(
        duration: _duration,
        type: PageTransitionType.fadeIn,
        child: const ProductScreen(),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: rh(380),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      height: rh(330),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/images/temp_vendor_bg.png",
                          // "assets/images/donut/donut_7.jpg",
                          width: 100 * SizeConfig.widthMultiplier,
                          // height: rh(100),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      child: CustomAppBar(
                        onBackTap: _navigateBack,
                      ),
                    ),
                    const Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: ClippedContainer(
                        backgroundColor: Colors.white,
                        child: VendorInfoCard(
                          title: "New York Donut.",
                          rating: 4.2,
                          sideImagePath: "assets/images/temp_vendor_logo.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: rh(space5x),
              ),
              FadeAnimation(
                duration: const Duration(milliseconds: 1250),
                intervalStart: 0.4,
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 1250),
                  intervalStart: 0.4,
                  begin: const Offset(0, 100),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: productList.length,
                    separatorBuilder: (context, index) => Divider(
                      height: rh(space5x),
                      endIndent: rw(20),
                      indent: rw(20),
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: _navigate,
                        child: productList[index],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
