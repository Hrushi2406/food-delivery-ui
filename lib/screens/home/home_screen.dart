import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/utils.dart';
import 'package:food_delivery/core/widgets/custom_widgets.dart';
import 'package:food_delivery/screens/vendor/vendor_screen.dart';
import 'package:food_delivery/widgets/clipped_container.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            SizedBox(height: rh(space4x)),
            ClippedContainer(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
