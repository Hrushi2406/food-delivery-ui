import 'package:flutter/material.dart';
import 'package:food_delivery/core/animations/slide_animation.dart';
import 'package:food_delivery/core/utils/utils.dart';

class ClippedContainer extends StatelessWidget {
  const ClippedContainer({
    Key? key,
    required this.child,
    this.backgroundColor,
  }) : super(key: key);

  final Widget child;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      intervalStart: 0.4,
      begin: const Offset(450, 0),
      duration: const Duration(milliseconds: 850),
      child: Container(
        height: rh(120),
        margin: const EdgeInsets.only(left: space2x),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(rf(40)),
            bottomLeft: Radius.circular(rf(40)),
          ),
          color: backgroundColor ?? Theme.of(context).primaryColor,
        ),
        child: child,
      ),
    );
  }
}
