import 'package:bfm/routes/bottom%20nav%20bar%20screens/cart_page.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/profile_page.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/stats_page.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/store_page.dart';
import 'package:flutter/material.dart';

import '../components/bottom_nav_bar.dart';
import 'bottom nav bar screens/home_page.dart';

class CommonPage extends StatefulWidget {
  const CommonPage({Key? key}) : super(key: key);

  @override
  State<CommonPage> createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onNavIndexChanged: (int value) {
          idx = value;
          setState(() {});
        },
      ),
      body: [
        HomePage(),
        StorePage(),
        StatsPage(),
        ProfilePage(),
        CartPage(),
      ][idx],
    );
  }
}