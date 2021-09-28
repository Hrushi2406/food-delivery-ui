import 'package:flutter/material.dart';

import '../../../core/utils/ui_helper.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.backgroundColor,
  }) : super(key: key);

  final Widget icon;

  final String name;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: space2x),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: rf(30),
            backgroundColor: backgroundColor,
            child: icon,
          ),
          SizedBox(
            height: rh(space1x),
          ),
          Text(
            name,
            // "Dessert ",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: rf(12),
                ),
          )
        ],
      ),
    );
  }
}
