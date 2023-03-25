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
      extendBody: true,
      bottomNavigationBar: BottomNavBar(
        onNavIndexChanged: (int value) {
          idx = value;
          setState(() {});
        },
        deviceSize: deviceSize,
      ),
      body: SafeArea(
        bottom: false,
        child: [
          const HomePage(),
          const StorePage(),
          const NotificationPage(),
          const ProfilePage(),
        ][idx],
      ),
    );
  }
}
