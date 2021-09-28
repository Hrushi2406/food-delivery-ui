import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/animations/animations.dart';
import 'package:food_delivery/core/animations/fade_animation.dart';
import 'package:food_delivery/screens/home/widget/category_list_view.dart';

import '../../core/utils/utils.dart';
import '../../core/widgets/custom_widgets.dart';
import '../../widgets/clipped_container.dart';
import '../vendor/vendor_screen.dart';
import 'widget/category_item.dart';
import 'widget/vender_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double _height;

  final Duration _duration = const Duration(milliseconds: 750);

  final _pseudoDuration = const Duration(milliseconds: 150);

  _navigate() async {
    ///Animated Screen container from bottom to top
    await _animateContainerFromBottomToTop();

    //PUSH TO VENDOR SCREEN
    //Wait till the Vendor is poped
    await Navigation.push(
      context,
      customPageTransition: PageTransition(
        duration: _duration,
        type: PageTransitionType.fadeIn,
        child: const VendorScreen(),
      ),
    );

    await _animateContainerFromTopToBottom();
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

    //Initial Animation

    // _height = MediaQuery.of(context).padding.top + rh(50);
    _height = 0;
    setState(() {});
    Timer(const Duration(milliseconds: 50), () {
      _animateContainerFromTopToBottom();
    });
  }

  List<Widget> vendorList = const [
    VendorCard(
        imagePath: "assets/images/logo/gladis_logo.jpg",
        name: "Gladis Baker",
        rating: 4.2),
    VendorCard(
        imagePath: "assets/images/logo/tasties_logo.jpg",
        name: "Tasties by tina",
        rating: 4.5),
    VendorCard(
        imagePath: "assets/images/logo/donut2_logo.jpg",
        name: "New York Donut.",
        rating: 4.2),
    VendorCard(
        imagePath: "assets/images/logo/sweet-shop-logo.jpg",
        name: "Sweets Shop.",
        rating: 4.0),
    VendorCard(
        imagePath: "assets/images/logo/leliuious_logo.jpg",
        name: "Leliuious.",
        rating: 4.3),
    VendorCard(
        imagePath: "assets/images/logo/monginis-logo.png",
        name: "Monginis",
        rating: 3.8),
    VendorCard(
        imagePath: "assets/images/logo/lila_logo.png",
        name: "Lial Manila Sweets",
        rating: 4.2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SlideAnimation(
        begin: const Offset(0, 400),
        duration: const Duration(milliseconds: 750),
        child: AnimatedContainer(
          height: _height,
          curve: Curves.fastOutSlowIn,
          duration: _duration,
          padding: EdgeInsets.only(bottom: rh(20)),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  hasBackButton: false,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: space2x),
                  child: RichText(
                    text: TextSpan(
                      text: 'Hi, ',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: rf(24),
                            fontWeight: FontWeight.normal,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Jack',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: rf(24),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: space2x),
                  child: Text(
                    "DELIVER TO 779 CASSIE",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: rf(12), height: 1.5),
                  ),
                ),
                SizedBox(
                  height: rh(20),
                ),
                //
                ClippedContainer(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: const CategoryListView(),
                ),
                SizedBox(
                  height: rh(space5x),
                ),
                // vendor list
                FadeAnimation(
                  duration: const Duration(milliseconds: 1250),
                  intervalStart: 0.4,
                  child: SlideAnimation(
                    begin: const Offset(0, 100),
                    intervalStart: 0.4,
                    duration: const Duration(milliseconds: 1250),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: vendorList.length,
                      separatorBuilder: (context, index) => Divider(
                        height: rh(space4x),
                        endIndent: rw(20),
                        indent: rw(20),
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: _navigate,
                          child: vendorList[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
