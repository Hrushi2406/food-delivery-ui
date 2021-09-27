import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/animations/animations.dart';
import 'package:food_delivery/core/animations/fade_animation.dart';

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

  _navigate() async {
    _height = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});

    await Future.delayed(_duration);

    scheduleMicrotask(() {});

    await Navigation.push(
      context,
      customPageTransition: PageTransition(
        duration: _duration,
        type: PageTransitionType.fadeIn,
        child: const VendorScreen(),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 150));
    _height = MediaQuery.of(context).size.height;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _height = MediaQuery.of(context).size.height;
    setState(() {});
  }

  List<Widget> vendorList = const [
    VendorCard(
        imagePath: "assets/images/temp_donat.jpg",
        name: "Brindle Room",
        rating: 4.2),
    VendorCard(
        imagePath: "assets/images/temp_donat.jpg",
        name: "Brindle Room",
        rating: 4.2),
    VendorCard(
        imagePath: "assets/images/temp_donat.jpg",
        name: "Brindle Room",
        rating: 4.2),
    VendorCard(
        imagePath: "assets/images/temp_donat.jpg",
        name: "Brindle Room",
        rating: 4.2),
    VendorCard(
        imagePath: "assets/images/temp_donat.jpg",
        name: "Brindle Room",
        rating: 4.2),
  ];

  List<Widget> categoryList = const [
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
  ];

  getMaxHeight() {
    Scaffold.of(context);
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
                        style: Theme.of(context).textTheme.headline6!.copyWith(
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
                child: SizedBox(
                  height: rh(120),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: space2x),
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return categoryList[index];
                    },
                  ),
                ),
              ),
              SizedBox(
                height: rh(space5x),
              ),
              // vendor list
              ListView.separated(
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
            ],
          ),
        ),
      ),
    );
  }
}
