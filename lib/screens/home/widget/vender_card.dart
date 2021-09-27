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
      padding: const EdgeInsets.symmetric(horizontal: space2x),
      child: Row(
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
                    .headline5!
                    .copyWith(fontSize: rf(16)),
              ),
              SizedBox(
                height: rh(5),
              ),
              Row(
                children: [
                  CIcons.fromMaterial(
                    icon: Icons.star,
                    semanticLabel: "rating",
                    size: rf(18),
                    color: const Color(0xFFFFB740),
                  ),
                  SizedBox(
                    width: rw(5),
                  ),
                  Text(
                    "$rating",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: rf(14)),
                  ),
                  Text(
                    " • Fast food • \$2.5",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey.shade400,
                          fontSize: rf(12),
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
                      color: const Color(0xFFF7F2F7),
                    ),
                    child: Row(
                      children: [
                        CIcons.fromMaterial(
                            icon: Icons.timer,
                            semanticLabel: "time",
                            size: rf(12),
                            color: const Color(0xFF977F98)),
                        Text(
                          " 15-20 min",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: rf(12),
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
                          fontSize: rf(12),
                        ),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          const FavoriteIcon()
        ],
      ),
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({Key? key}) : super(key: key);

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return isFav
        ? CIcons.fromMaterial(
            icon: Icons.favorite,
            semanticLabel: "favorate",
            color: Theme.of(context).primaryColorDark,
          )
        : CIcons.fromMaterial(
            icon: Icons.favorite_border,
            semanticLabel: "favorate",
            color: Theme.of(context).primaryColorDark,
          );
  }
}
