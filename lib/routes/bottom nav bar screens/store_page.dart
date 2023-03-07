import 'package:flutter/material.dart';

import '../../components/custom_text.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CustomText('Store Page'),
      ),
    );
  }
}
