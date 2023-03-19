import 'package:flutter/material.dart';
import '../../../components/custom_text.dart';
class CreateNFTPage extends StatelessWidget {
  const CreateNFTPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText('Add NFT Page'),
      ),
    );
  }
}