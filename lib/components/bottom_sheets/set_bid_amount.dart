import 'package:bfm/components/custom_page_route.dart';
import 'package:flutter/material.dart';

import '../../routes/bottom nav bar screens/nft store page/bid_success.dart';
import '../buttons/icon_button.dart';
import '../buttons/text_button.dart';
import '../custom_text.dart';

class PlaceBidDialog extends StatefulWidget {
  const PlaceBidDialog({Key? key}) : super(key: key);

  @override
  State<PlaceBidDialog> createState() => _PlaceBidDialogState();
}

class _PlaceBidDialogState extends State<PlaceBidDialog> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            shape: StadiumBorder(),
            color: Colors.grey,
            child: SizedBox(
              height: 2,
              width: 30,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomText(
              'Place a bid',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomIconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'images/ethereum.png',
                      height: 25,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const CustomText(
                      '0.557 ETH',
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ],
                ),
                CustomIconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomText(
              'Balance: 25.172 ETH',
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            // color: Colors.red,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 0.85,
                  child: Checkbox(
                    activeColor: Colors.black,
                    splashRadius: 0,
                    side: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    value: checked,
                    onChanged: (bool? value) {
                      checked = value ?? false;
                      setState(() {});
                    },
                  ),
                ),
                const CustomText(
                  'By checking this box, I agree to NFT\'s Terms of Service',
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomFilledButton(
              onPressed: () {
                Navigator.push(
                    context, CustomPageRoute(child: BidSuccessPage()));
              },
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CustomText(
                    'Place a bid',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  }