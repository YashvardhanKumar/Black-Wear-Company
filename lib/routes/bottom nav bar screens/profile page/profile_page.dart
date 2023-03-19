import 'package:flutter/material.dart';
import '../../../components/custom_text.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CustomText('Profile Page'),
      ),
    );
  }
}