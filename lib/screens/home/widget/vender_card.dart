import 'package:flutter/material.dart';

import '../../../core/utils/ui_helper.dart';
import '../../../core/widgets/icon/custom_icons.dart';

class VendorCard extends StatelessWidget {
  const VendorCard(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.rating})
      : super(key: key);
  final String imagePath;
  final String name;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(space2x),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: rw(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 20),
              ),
              SizedBox(
                height: rh(10),
              ),
              Row(
                children: [
                  CIcons.fromMaterial(
                    icon: Icons.star,
                    semanticLabel: "rating",
                    color: const Color(0xFFFFB740),
                  ),
                  SizedBox(
                    width: rw(8),
                  ),
                  Text(
                    "$rating",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    " • fast food • \$\$",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey.shade400,
                          fontSize: 16,
                        ),
                  )
                ],
              ),
              SizedBox(
                height: rh(10),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(space1x),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF7F2F7)),
                    child: Row(
                      children: [
                        CIcons.fromMaterial(
                            icon: Icons.timer,
                            semanticLabel: "time",
                            size: 17,
                            color: const Color(0xFF977F98)),
                        Text(
                          " 15-20 min",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF977F98)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: space1x,
                  ),
                  Text(
                    "2.4 km",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey.shade400,
                          fontSize: 16,
                        ),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          CIcons.fromMaterial(
              icon: Icons.favorite_border,
              semanticLabel: "favorate",
              color: Theme.of(context).primaryColorDark)
        ],
      ),
    );
  }
}
