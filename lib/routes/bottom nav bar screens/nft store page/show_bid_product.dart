import 'package:bfm/components/custom_page_route.dart';
import 'package:flutter/material.dart';
import '../../../components/bottom_sheets/set_bid_amount.dart';
import '../../../components/bottom_sheets/share_bottom_sheet.dart';
import '../../../components/buttons/category_of_pref.dart';
import '../../../components/buttons/icon_button.dart';
import '../../../components/buttons/text_button.dart';
import '../../../components/cards/top_creator_card.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_text.dart';
import 'favourites_page.dart';

class ShowBidProduct extends StatefulWidget {
  const ShowBidProduct({Key? key}) : super(key: key);

  @override
  State<ShowBidProduct> createState() => _ShowBidProductState();
}

class _ShowBidProductState extends State<ShowBidProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: const CustomText(
          'Cream3D #789',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          CustomIconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                context: context,
                builder: (_) => const ShareBidDialog(),
              );
            },
          ),
          CustomIconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.push(
                context, CustomPageRoute(child: const FavouritesPage())),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BottomSheet(
        enableDrag: false,
        backgroundColor: Colors.white,
        onClosing: () {},
        builder: (BuildContext context) => Container(
          // alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          // color: Colors.white,
          height: 90,
          child: CustomFilledButton(
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: CustomText(
                  'Place a bid',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                context: context,
                builder: (_) => const PlaceBidDialog(),
              );
              // Navigator.pushNamed(context, ShowBidProduct.id);
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'images/cream3d.jpeg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: CustomText(
                    'Cream3D #789',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Flexible(
                  child: CustomOutlineButton(
                    onPressed: null,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 10,
                      ),
                      child: CustomText(
                        '4h 16m 27s left',
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Flexible(
                    child: TopCreatorListCard(
                  topCreator: 'StrongQuest',
                )),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'images/ethereum.png',
                      height: 18,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const CustomText('0.557 ETH',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 15),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: CustomText(
              'Cream3D is a collection of random NFT generated and resides on the Ethereum Blockchain. '
              'We focus on making NFTs that are unique and rare and will continue to be updated regularly.',
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          CategoryOfPreference(
            heading: 'History of Bid',
            onSeeAllClicked: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Flexible(
                      child: TopCreatorListCard(
                        topCreator: 'StrongQuest',
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'images/ethereum.png',
                          height: 18,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const CustomText('0.557 ETH',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 15),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Flexible(
                        child: TopCreatorListCard(
                      topCreator: 'StrongQuest',
                    )),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'images/ethereum.png',
                          height: 18,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const CustomText('0.557 ETH',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 15),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
