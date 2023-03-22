import 'package:bfm/components/cards/normal_bidding_tile.dart';
import 'package:bfm/components/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../components/bottom_sheets/nft_filter_bottom_sheet.dart';
import '../../../components/buttons/custom_chips.dart';
import '../../../components/buttons/icon_button.dart';
import '../../../components/cards/product_card.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_grid_view.dart';
import '../../../components/custom_text.dart';
import 'statistic_page.dart';

class NFTProfilePage extends StatefulWidget {
  const NFTProfilePage({Key? key}) : super(key: key);

  @override
  State<NFTProfilePage> createState() => _NFTProfilePageState();
}

class _NFTProfilePageState extends State<NFTProfilePage> {
  int pageNo = 0;

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size devSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        // padding: false,
        // toolbarHeight: 54,

        actions: [
          CustomIconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          ),
          CustomIconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {
              showModalBottomSheet(
                // enableDrag: false,
                isScrollControlled: true,
                context: context,
                builder: (_) => NFTFilterBottomSheet(screenSize: devSize),
              );
            },
          ),
          CustomIconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                // margin: const EdgeInsets.only(top: 70 + 24, bottom: 70),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('images/cream3d.jpeg'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          'StrongQuest',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                CustomIcon.twitter,
                                size: 18,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                CustomIcon.instagram,
                                size: 18,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.share,
                                size: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomText(
                      '3D Cools Box is a collection of 3D NFT and resides '
                      'on the Ethereum Blockchain. We focus on making '
                      'NFTs that are unique and rare.',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                CustomText(
                                  '3.77K',
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  'Items',
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                CustomText(
                                  '1.24K',
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  'Owners',
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      CustomIcon.ethereum,
                                      size: 18,
                                    ),
                                    CustomText(
                                      '3.77K',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  'Floor price',
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      CustomIcon.ethereum,
                                      size: 18,
                                    ),
                                    CustomText(
                                      '674',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  'Traded',
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StickySliver(
              child: Container(
                height: 70,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                          text: 'Items',
                          icon: const Icon(Icons.dashboard_rounded),
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
                          text: 'Activity',
                          icon: const Icon(Icons.show_chart_rounded),
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
            controller: controller,
            onPageChanged: (value) {
              pageNo = value;
              setState(() {});
            },
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
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
              ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const ActivityTile(
                    nftName: '3DMaps Cool #267',
                    userId: 'pedrogadelha',
                    activityType: 'Sale',
                    timePassed: '01 seconds ago',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RenderStickySliver extends RenderSliverSingleBoxAdapter {
  RenderStickySliver({RenderBox? child}) : super(child: child);

  @override
  void performLayout() {
    child?.layout(
      constraints.asBoxConstraints(),
      parentUsesSize: true,
    );
    double childExtent = child?.size.height ?? 0;
    geometry = SliverGeometry(
      paintExtent: childExtent,
      maxPaintExtent: childExtent,
      paintOrigin: constraints.scrollOffset,
    );
    setChildParentData(child!, constraints, geometry!);
    // TODO: implement performLayout
  }
}

class StickySliver extends SingleChildRenderObjectWidget {
  const StickySliver({Widget? child, Key? key}) : super(child: child, key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStickySliver();
  }
}
