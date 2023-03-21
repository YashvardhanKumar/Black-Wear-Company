import 'package:bfm/components/buttons/text_button.dart';
import 'package:bfm/components/custom_app_bar.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_page_route.dart';
import 'sell_nft_page.dart';

class NFTAddSuccess extends StatelessWidget {
  const NFTAddSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          CustomTextButton(
            onPressed: () {},
            child: CustomText(
              'View Item',
              fontSize: 18,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/thumbsup.png'),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomText(
                      'Upload Success!',
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomText(
                      'You have successfully upload NFT item. You need to give a price and sell it!',
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomOutlineButton(
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CustomText(
                    'Later',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomFilledButton(
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CustomText('Give Price and Sell',
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context, CustomPageRoute(child: SellNFTPage()));
                },
              ),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
