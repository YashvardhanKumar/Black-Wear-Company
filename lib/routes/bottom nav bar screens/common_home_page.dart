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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int idx = 0;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onNavIndexChanged: (int value) {
          idx = value;
          setState(() {});
        },
        onPlusClicked: () {},
        deviceSize: deviceSize,
      ),
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
