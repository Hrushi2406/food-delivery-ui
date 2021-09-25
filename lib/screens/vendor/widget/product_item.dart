import 'package:flutter/material.dart';

import '../../../core/utils/ui_helper.dart';
import '../../../core/widgets/button/buttons.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {Key? key,
      required this.title,
      required this.detail,
      required this.imagePath})
      : super(key: key);

  final String imagePath;
  final String title;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(space2x),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: rw(60),
            height: rh(60),
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: rw(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: rh(10),
              ),
              SizedBox(
                width: rw(160),
                child: Text(
                  detail,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.grey.shade400, fontSize: rf(12)),
                  maxLines: 2,
                ),
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                "\$9.75",
                style: Theme.of(context).textTheme.headline6,
              ),
              Buttons.text(
                  context: context,
                  textColor: Theme.of(context).primaryColorDark,
                  text: "Add to cart",
                  onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}
