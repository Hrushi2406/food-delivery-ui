//Home Screen Data
import 'package:flutter/material.dart';

import 'screens/home/widget/vender_card.dart';
import 'screens/vendor/widget/product_item.dart';

List<Widget> vendorList = const [
  VendorCard(
      imagePath: "assets/images/logo/gladis_logo.jpg",
      name: "Gladis Baker",
      rating: 4.2),
  VendorCard(
      imagePath: "assets/images/logo/tasties_logo.jpg",
      name: "Tasties by tina",
      rating: 4.5),
  VendorCard(
      imagePath: "assets/images/logo/donut2_logo.jpg",
      name: "New York Donut.",
      rating: 4.2),
  VendorCard(
      imagePath: "assets/images/logo/sweet-shop-logo.jpg",
      name: "Sweets Shop.",
      rating: 4.0),
  VendorCard(
      imagePath: "assets/images/logo/leliuious_logo.jpg",
      name: "Leliuious.",
      rating: 4.3),
  VendorCard(
      imagePath: "assets/images/logo/monginis-logo.png",
      name: "Monginis",
      rating: 3.8),
  VendorCard(
      imagePath: "assets/images/logo/lila_logo.png",
      name: "Lial Manila Sweets",
      rating: 4.2),
];

//Vendor Screen
List<Widget> productList = const [
  ProductItem(
    title: "Honey Milk Donut",
    detail: "blueberry + sugar + flawour + some ingrident ...",
    imagePath: "assets/images/donut/donut_7.png",
  ),
  ProductItem(
    title: "Honey Milk Donut",
    detail: "blueberry + sugar + flawour + some ingrident ...",
    imagePath: "assets/images/donut/donut_2.png",
  ),
  ProductItem(
    title: "Honey Milk Donut",
    detail: "blueberry + sugar + flawour + some ingrident ...",
    imagePath: "assets/images/donut/donut_3.png",
  ),
  ProductItem(
    title: "Honey Milk Donut",
    detail: "blueberry + sugar + flawour + some ingrident ...",
    imagePath: "assets/images/donut/donut_4.png",
  ),
  ProductItem(
    title: "Honey Milk Donut",
    detail: "blueberry + sugar + flawour + some ingrident ...",
    imagePath: "assets/images/donut/donut_5.png",
  ),
  ProductItem(
    title: "Honey Milk Donut",
    detail: "blueberry + sugar + flawour + some ingrident ...",
    imagePath: "assets/images/donut/donut_6.png",
  ),
];
