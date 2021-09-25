import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/ui_helper.dart';
import '../custom_widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    this.title = '',
    this.isTitleCentered,
    this.hasBackButton = true,
    this.isHeroAnimated = true,
    this.actions,
  });

  ///Title of text
  final String title;

  ///Should the title be centered
  ///
  ///[Default is null]
  final bool? isTitleCentered;

  ///Platform adaptive back icon
  ///
  ///[Default is true]
  final bool hasBackButton;

  ///The widgets are rendered from end
  final List<Widget>? actions;

  ///Is Hero animated
  final bool isHeroAnimated;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: isHeroAnimated ? 'app_bar' : 'no_hero_animation',
      child: Container(
        width: double.infinity,
        color: Theme.of(context).scaffoldBackgroundColor,
        height: Scaffold.of(context).appBarMaxHeight,
        padding: EdgeInsets.only(
          top: rh(50),
          left: space2x,
          right: space2x,
          bottom: rh(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                //Back Button
                if (hasBackButton)
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: PlatformIcon(),
                  ),

                //Main Heading and Title
                Align(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),

                //Actions
                // if (actions != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CIcons.fromMaterial(
                        icon: Icons.shopping_bag_outlined,
                        semanticLabel: 'Bag',
                      ),
                      SizedBox(width: rw(space3x)),
                      CIcons.fromMaterial(
                        icon: Icons.favorite_outline,
                        semanticLabel: 'Heart',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //Back Button
          ],
        ),
      ),
    );
  }
}

class PlatformIcon extends StatelessWidget {
  const PlatformIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Buttons.icon(
        context: context,
        icon: CupertinoIcons.back,
        right: 12,
        semanticLabel: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      );
    } else {
      return Buttons.icon(
        context: context,
        icon: Icons.arrow_back_sharp,
        right: 12,
        semanticLabel: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }
  }
}
