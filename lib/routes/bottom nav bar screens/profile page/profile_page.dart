import 'package:bfm/components/buttons/text_button.dart';
import 'package:bfm/components/cards/product_card.dart';
import 'package:bfm/components/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import '../../../components/buttons/custom_chips.dart';
import '../../../components/buttons/icon_button.dart';
import '../../../components/cards/normal_bidding_tile.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_grid_view.dart';
import '../../../components/custom_text.dart';
import '../nft store page/nft_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int pageNo = 0;

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size devSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        // padding: false,
        // toolbarHeight: 54,

        actions: [
          CustomIconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          CustomIconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
            },
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: CircleAvatar(
                        radius: 70,
                        foregroundImage: AssetImage('images/man.jpg'),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            'Adam Smith',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          const CustomText(
                            '@adamsmith',
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    children: [
                                      const CustomText(
                                        'Orders',
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CustomText(
                                        (pageNo == 0) ?'120' : '62',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    children: [
                                      const CustomText(
                                        'Revenue',
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CustomText(
                                        (pageNo == 0) ? '\$2290.83' : '2.000 ETH',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomOutlineButton(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2),
                              child: CustomText(
                                'Insights',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            StickySliver(
              child: Container(
                height: 70,
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: CustomChips(
                          onPressed: (value) {
                            pageNo = 0;
                            controller.animateToPage(pageNo,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.ease);

                            setState(() {});
                          },
                          selected: pageNo == 0,
                          text: 'Store',
                          icon: const Icon(Icons.shopping_bag_rounded),
                        ),
                      ),
                      Expanded(
                        child: CustomChips(
                          onPressed: (value) {
                            pageNo = 1;
                            controller.animateToPage(pageNo,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.ease);
                            setState(() {});
                          },
                          selected: pageNo == 1,
                          text: 'NFTs',
                          icon: const Icon(CustomIcon.ethereum),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SizedBox(
          height: devSize.height,
          child: PageView(
            onPageChanged: (value) {
              pageNo = value;
              setState(() {});
            },
            controller: controller,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomGridView(
                  // isSliverType: true,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return ProductCard(
                      onLiked: () {},
                      isLiked: i % 2 == 0,
                      discountedPrice: '\$33.00',
                      onCardClicked: () {},
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomGridView(
                  // isSliverType: true,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return NonLiveBiddingTile(
                      onLiked: () {},
                      isLiked: i % 2 == 0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
