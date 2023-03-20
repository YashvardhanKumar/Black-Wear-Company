import 'package:bfm/routes/bottom%20nav%20bar%20screens/create%20nft/create_nft_page.dart';
import 'notification%20page/notification_page.dart';
import 'profile%20page/profile_page.dart';
import 'nft%20store%20page/store_page.dart';
import 'package:flutter/material.dart';
import '../../../components/bottom_nav_bar.dart';
import 'home page of e commerce/home_page.dart';

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
      bottomNavigationBar: BottomNavBar(onNavIndexChanged: (int value) {
        idx = value;
        setState(() {});
      }, onPlusClicked: () {

      }),
      body: SafeArea(
        child: [
          HomePage(),
          StorePage(),
          NotificationPage(),
          ProfilePage(),
        ][idx],
      ),
    );
  }
}
