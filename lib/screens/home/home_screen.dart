import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';
import '../../core/widgets/custom_widgets.dart';
import '../../widgets/clipped_container.dart';
import '../vendor/vendor_screen.dart';
import 'widget/category_item.dart';
import 'widget/vender_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _navigate() {
    Navigation.push(
      context,
      screen: const VendorScreen(),
    );
  }

  List<Widget> vendorList = const [
    VendorCard(
        imagePath: "assets/images/temp_donat.jpg",
        name: "Brindle Room",
        rating: 4.2),
    VendorCard(
        imagePath: "assets/images/temp_donat.jpg",
        name: "Brindle Room",
        rating: 4.2),
    VendorCard(
        imagePath: "assets/images/temp_donat.jpg",
        name: "Brindle Room",
        rating: 4.2),
    VendorCard(
        imagePath: "assets/images/temp_donat.jpg",
        name: "Brindle Room",
        rating: 4.2),
    VendorCard(
        imagePath: "assets/images/temp_donat.jpg",
        name: "Brindle Room",
        rating: 4.2),
  ];

  List<Widget> categoryList = const [
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
    CategoryItem(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),

            SizedBox(height: rh(space2x)),
            // greedding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: space2x),
              child: RichText(
                text: TextSpan(
                  text: 'Hi, ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: rf(24),
                        fontWeight: FontWeight.normal,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Jack',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: rf(24),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: space2x),
              child: Text(
                "DELIVER TO 779 CASSIE",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: rf(12), height: 1.5),
              ),
            ),
            SizedBox(
              height: rh(20),
            ),
            //
            ClippedContainer(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return categoryList[index];
                },
              ),
            ),
            SizedBox(
              height: rh(space5x),
            ),
            // vendor list
            ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: vendorList.length,
              separatorBuilder: (context, index) => Divider(
                height: rh(space4x),
                endIndent: rw(20),
                indent: rw(20),
              ),
              itemBuilder: (context, index) {
                return vendorList[index];
              },
            ),
          ],
        ),
      ),
    );
  }
}
