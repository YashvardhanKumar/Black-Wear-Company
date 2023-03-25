import 'package:bfm/components/cards/product_card.dart';
import 'package:bfm/components/custom_grid_view.dart';
import 'package:flutter/material.dart';

import '../../../components/buttons/text_button.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_text.dart';

class ShowStorePage extends StatelessWidget {
  const ShowStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: CustomText('Display Store'),
      ),
      body: CustomGridView(
        itemCount: 2,
        itemBuilder: (_, i) => ProductCard(
          discountedPrice: '\$33.00',
          isLiked: true,
          onLiked: () {},
        ),
      ),
      bottomNavigationBar: BottomSheet(
        elevation: 0,
        onClosing: () {  },
        builder:(_) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomFilledButton(
            // width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: CustomText(
                'OK',
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              while(Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
        ),
      ),
    );
  }
}
