import 'package:bfm/components/cards/normal_bidding_tile.dart';
import 'package:bfm/components/custom_page_route.dart';
import 'package:flutter/material.dart';
import '../../routes/bottom nav bar screens/nft store page/show_bid_product.dart';
import '../buttons/text_button.dart';
import '../custom_text.dart';
class LiveBiddingTile extends StatelessWidget {
  const LiveBiddingTile({
    Key? key,
    required this.timeLeft,
  }) : super(key: key);
  final String timeLeft;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 30,
      width: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NonLiveBiddingTile(onLiked: () {  }, isLiked: true,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlineButton(
                  onPressed: null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 6,
                    ),
                    child: CustomText(
                      timeLeft,
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ),
                CustomFilledButton(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 9.0, horizontal: 14),
                    child: CustomText(
                      'Place a bid',
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, CustomPageRoute(child: const ShowBidProduct()));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}