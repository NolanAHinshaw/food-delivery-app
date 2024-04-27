import 'package:flutter/material.dart';
import 'package:fooddeliverapp/helper/auth.dart';
import 'package:fooddeliverapp/pages/BrowseRestaurants.dart';
import 'package:fooddeliverapp/pages/HomePage.dart';
import 'package:fooddeliverapp/pages/LandingPage.dart';
import 'package:fooddeliverapp/pages/LoginPage.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LandingPage();
        }
      },
    );
  }
}
