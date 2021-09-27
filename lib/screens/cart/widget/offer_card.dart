﻿import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/ui_helper.dart';
import 'package:food_delivery/core/widgets/custom_widgets.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
    required this.heading,
    required this.subHeading,
    required this.icon,
    this.showAddBTN = false,
  }) : super(key: key);

  final bool showAddBTN;
  final String heading;
  final Widget icon;
  final String subHeading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: space2x),
      child: Row(
        children: [
          Container(
              width: rw(75),
              height: rh(75),
              decoration: BoxDecoration(
                color: const Color(0xFF967B9C),
                borderRadius: BorderRadius.circular(10),
              ),
              child: icon),
          SizedBox(
            width: rw(space2x),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              SizedBox(
                height: rh(10),
              ),
              Text(
                subHeading,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.grey.shade300,
                      fontSize: rf(14),
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          const Spacer(),
          if (showAddBTN)
            Buttons.icon(
              context: context,
              onPressed: () {},
              backgroundColor: Theme.of(context).colorScheme.secondary,
              icon: Icons.add,
              size: rf(16),
              borderRadius: 10,
              top: space1x / 2,
              right: space1x / 2,
              left: space1x / 2,
              bottom: space1x / 2,
              semanticLabel: "increament",
            ),
        ],
      ),
    );
  }
}
