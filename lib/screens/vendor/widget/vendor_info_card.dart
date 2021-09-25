import 'package:flutter/material.dart';

import '../../../core/utils/ui_helper.dart';
import '../../../core/widgets/icon/custom_icons.dart';

class VendorInfoCard extends StatelessWidget {
  const VendorInfoCard(
      {Key? key,
      required this.title,
      required this.rating,
      required this.sideImagePath})
      : super(key: key);

  final String title;
  final double rating;
  final String sideImagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: space2x, top: space2x),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(rf(40)),
            bottomLeft: Radius.circular(rf(40)),
          ),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 10,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline4,
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
                    " • fast food • \$\$ • 15-20 min",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey.shade400,
                          fontSize: 16,
                        ),
                  ),
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
                      color: const Color(0xFFFFE3DA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Free deliver",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: rf(14)),
                    ),
                  ),
                  SizedBox(
                    width: rw(10),
                  ),
                  Text(
                    "21 reviews",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.grey.shade400, fontSize: rf(14)),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            width: rw(10),
          ),
          Image.asset(
            sideImagePath,
            width: rw(80),
            height: rh(80),
          )
        ],
      ),
    );
  }
}
