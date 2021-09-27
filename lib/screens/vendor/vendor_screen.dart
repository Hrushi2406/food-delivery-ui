import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery/core/animations/fade_animation.dart';
import 'package:food_delivery/core/widgets/custom_widgets.dart';

import '../../core/utils/utils.dart';
import '../../widgets/clipped_container.dart';
import '../product/product_screen.dart';
import 'widget/product_item.dart';
import 'widget/vendor_info_card.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({Key? key}) : super(key: key);

  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  _navigate() {
    Navigation.push(
      context,
      screen: const ProductScreen(),
    );
  }

  List<Widget> productList = const [
    ProductItem(
      title: "Honey Milk Donut",
      detail: "blueberry + sugar + flawour + some ingrident ...",
      imagePath: "assets/images/temp_donut.png",
    ),
    ProductItem(
      title: "Honey Milk Donut",
      detail: "blueberry + sugar + flawour + some ingrident ...",
      imagePath: "assets/images/temp_donut.png",
    ),
    ProductItem(
      title: "Honey Milk Donut",
      detail: "blueberry + sugar + flawour + some ingrident ...",
      imagePath: "assets/images/temp_donut.png",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  final _duration = const Duration(milliseconds: 750);

  late double _height;

  _navigateBack() async {
    _height = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});

    await Future.delayed(_duration);

    Navigation.pop(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _height = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});

    Timer(const Duration(milliseconds: 150), () {
      _height = MediaQuery.of(context).size.height;
      setState(() {});
    });
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
                        child: FadeAnimation(
                          duration: const Duration(milliseconds: 1000),
                          child: Image.asset(
                            "assets/images/temp_vendor_bg.png",
                            height: rh(300),
                            fit: BoxFit.cover,
                          ),
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
              ListView.separated(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
