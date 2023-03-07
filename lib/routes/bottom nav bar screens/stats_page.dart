import 'package:flutter/material.dart';

import '../../components/custom_text.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CustomText('Stats Page'),
      ),
    );
  }
}
