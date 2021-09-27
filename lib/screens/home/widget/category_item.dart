import 'package:flutter/material.dart';

import '../../../core/utils/ui_helper.dart';
import '../../../core/widgets/icon/custom_icons.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.all(space2x),
      padding: const EdgeInsets.symmetric(horizontal: space2x),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: rf(30),
            backgroundColor: const Color(0xfff2e3db),
            child: CIcons.fromMaterial(
              icon: Icons.ac_unit,
              semanticLabel: "All",
              size: rf(18),
            ),
          ),
          SizedBox(
            height: rh(space1x),
          ),
          Text(
            "Dessert ",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: rf(12),
                ),
          )
        ],
      ),
    );
  }
}
