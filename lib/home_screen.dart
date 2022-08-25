import 'package:flutter/material.dart';

import '../Utils/Constant.dart';
import 'Layout-Desktop/Home/desktop-home.dart';
import 'Layout-Mobile/Home/mobile_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Dicoding Daily Manager",
            style: TextStyle(
              letterSpacing: 5,
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (screenWidth > dekstopWidth) {
              return DesktopHome(constraints: constraints);
            } else {
              return MobileHome(constraints: constraints);
            }
          },
        ),
      ),
    );
  }
}


