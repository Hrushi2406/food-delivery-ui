import 'package:flutter/material.dart';

import '../../../core/utils/ui_helper.dart';
import '../../../core/widgets/icon/custom_icons.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(space2x),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 34,
            child:
                CIcons.fromMaterial(icon: Icons.ac_unit, semanticLabel: "All"),
          ),
          SizedBox(
            height: rh(10),
          ),
          Text(
            "All",
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
