import 'package:flutter/material.dart';

import '../../../core/utils/ui_helper.dart';
import '../../../core/widgets/custom_widgets.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imagePath,
  }) : super(key: key);

  final String name;
  final double price;
  final int quantity;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: space2x),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: rw(80),
              height: rh(80),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: rw(space2x),
          ),
          Text(
            "x$quantity",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          SizedBox(
            width: rw(space2x),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
              ),
              SizedBox(
                height: rh(10),
              ),
              Text(
                "\$$price",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CIcons.fromMaterial(
                icon: Icons.close,
                size: rf(16),
                semanticLabel: "remove from cart",
                color: Colors.white,
              ),
              SizedBox(
                height: rh(30),
              ),
              Row(
                children: [
                  Buttons.icon(
                    context: context,
                    onPressed: () {},
                    backgroundColor: const Color(0xFF967B9C),
                    iconColor: Colors.white,
                    icon: Icons.remove,
                    size: rf(16),
                    borderRadius: 10,
                    top: space1x / 2,
                    right: space1x / 2,
                    left: space1x / 2,
                    bottom: space1x / 2,
                    semanticLabel: "decrement",
                  ),
                  SizedBox(
                    width: rw(10),
                  ),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
