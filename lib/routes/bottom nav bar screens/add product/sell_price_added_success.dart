import 'package:bfm/components/custom_app_bar.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/add%20product/view_link.dart';
import 'package:flutter/material.dart';

import '../../../components/buttons/text_button.dart';
import '../../../components/custom_page_route.dart';
import 'sell_nft_page.dart';

class SellPriceAddedSuccess extends StatelessWidget {
  const SellPriceAddedSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Container(
            width: size.width,
            height: size.width,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30.0),
            child: CircleAvatar(
              backgroundColor: Colors.lightBlue.shade50,
              radius: 80,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
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
                    'You have successfully listed a NFT for sale. You can see it in your profile.',
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
            child: CustomFilledButton(
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomText('View Link',
                    fontWeight: FontWeight.w600, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context, CustomPageRoute(child: ViewLink()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomOutlineButton(
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(14.0),
                child: CustomText(
                  'Create Store',
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
