import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/utils.dart';

import 'category_item.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  List<String> categoryIconList = [
    "assets/images/cloche.png",
    "assets/images/burger.png",
    "assets/images/pizza-slice.png",
    "assets/images/donut.png",
    "assets/images/cloche.png",
    "assets/images/burger.png",
    "assets/images/pizza-slice.png",
    "assets/images/donut.png",
  ];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: rh(120),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: space2x),
        scrollDirection: Axis.horizontal,
        itemCount: categoryIconList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectIndex = index;
              setState(() {});
            },
            child: CategoryItem(
              backgroundColor:
                  selectIndex == index ? Colors.white : const Color(0xfff2e3db),
              icon: Image.asset(
                categoryIconList[index],
                width: rw(35),
                height: rh(35),
              ),
            ),
          );
        },
      ),
    );
  }
}
