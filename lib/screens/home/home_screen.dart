import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/animations/animations.dart';
import 'package:food_delivery/core/animations/fade_animation.dart';
import 'package:food_delivery/screens/home/widget/category_list_view.dart';

import '../../core/utils/utils.dart';
import '../../core/widgets/custom_widgets.dart';
import '../../data.dart';
import '../../widgets/clipped_container.dart';
import '../vendor/vendor_screen.dart';
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

    _height = 0;
    setState(() {});

    //Animate after a short delay
    Timer(const Duration(milliseconds: 50), () {
      _animateContainerFromTopToBottom();
    });
  }

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
