import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';
import '../../widgets/clipped_container.dart';
import '../product/product_screen.dart';
import 'widget/product_item.dart';
import 'widget/vendor_info_card.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({Key? key}) : super(key: key);

  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  _navigate() {
    Navigation.push(
      context,
      screen: const ProductScreen(),
    );
  }

  List<Widget> productList = const [
    ProductItem(
      title: "Honey Milk Donut",
      detail: "blueberry + sugar + flawour + some ingrident ...",
      imagePath: "assets/images/temp_donut.png",
    ),
    ProductItem(
      title: "Honey Milk Donut",
      detail: "blueberry + sugar + flawour + some ingrident ...",
      imagePath: "assets/images/temp_donut.png",
    ),
    ProductItem(
      title: "Honey Milk Donut",
      detail: "blueberry + sugar + flawour + some ingrident ...",
      imagePath: "assets/images/temp_donut.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: rh(380),
                width: double.infinity,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/temp_vendor_bg.png",
                  height: rh(300),
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ClippedContainer(
                  child: VendorInfoCard(
                    title: "New York Donut.",
                    rating: 4.2,
                    sideImagePath: "assets/images/temp_vendor_logo.png",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: rh(20),
          ),
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: productList.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              endIndent: rw(20),
              indent: rw(20),
            ),
            itemBuilder: (context, index) {
              return productList[index];
            },
          ))
        ],
      ),
    );
  }
}
