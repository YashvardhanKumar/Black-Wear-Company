import 'package:bfm/components/custom_icon_icons.dart';
import 'package:bfm/components/custom_page_route.dart';
// import 'package:bfm/routes/bottom%20nav%20bar%20screens/nft%20store%20page/show_bid_product.dart';
import 'package:flutter/material.dart';
import '../../routes/bottom nav bar screens/nft store page/show_bid_product.dart';
import '../custom_text.dart';
class NonLiveBiddingTile extends StatelessWidget {
  const NonLiveBiddingTile({
    Key? key, required this.onLiked, required this.isLiked,
  }) : super(key: key);
  final VoidCallback onLiked;
  final bool isLiked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CustomPageRoute(child: const ShowBidProduct()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // height: 30,
        // width: 180,
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.hardEdge,
                  height: 200,
                  child: Image.asset(
                    'images/cream3d.jpeg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                GestureDetector(
                  onTap: onLiked,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      shape: const CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          CustomIcon.heart,
                          color: isLiked ? Colors.red.shade800 : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(CustomIcon.ethereum,size: 18,),
                    SizedBox(
                      width: 3,
                    ),
                    CustomText(
                      '0.557 ETH',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ],
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.grey,
                        size: 18,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CustomText(
                        '4.5',
                        fontSize: 13,
                        color: Color(0xff49454F),
                      )
                    ],
                  ),
                )
              ],
            ),
            const CustomText(
              'Cream3D #789',
              // fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontSize: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  'StrongQuest',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}