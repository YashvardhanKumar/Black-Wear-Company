import 'package:bfm/components/buttons/custom_chips.dart';
import 'package:bfm/components/buttons/search_button.dart';
import 'package:bfm/components/buttons/text_button.dart';
import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/nft%20store%20page/statistic_page.dart';
import 'package:flutter/material.dart';
import '../../../components/buttons/icon_button.dart';
import '../../../components/cards/live_bidding_tile.dart';
import '../../../components/cards/normal_bidding_tile.dart';
import '../../../components/cards/top_creator_card.dart';
import '../../../components/buttons/category_filter.dart';
import '../../../components/buttons/category_of_pref.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_text.dart';
import '../../../components/cards/suggestion_card.dart';
import '../home page of e commerce/cart_page.dart';
import '../home page of e commerce/home_page.dart';
import 'favourites_page.dart';
import 'live_bidding_page.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  bool isWalletConnected = false;
  int? chipCustomSelected;
  final List<Map<String, dynamic>> categoryFilter = [
    {
      'icon': Icons.trending_up_rounded,
      'text': 'Trending',
    },
    {
      'icon': Icons.done_all_rounded,
      'text': 'Top',
    },
    {
      'icon': Icons.palette_rounded,
      'text': 'Art',
    },
    {
      'icon': Icons.photo_rounded,
      'text': 'Photography',
    }
  ];

  List<Widget> categories() {
    List<Widget> list = [];
    for (int index = 0; index < categoryFilter.length; index++) {
      list.add(
        CustomChips(
          icon: Icon(
            categoryFilter[index]['icon'],
          ),
          text: categoryFilter[index]['text'],
          onPressed: (val) {
            if ((chipCustomSelected == index)) {
              chipCustomSelected = null;
            } else {
              chipCustomSelected = index;
            }
            setState(() {});
          },
          selected: chipCustomSelected == index,
        ),
      );
      setState(() {});
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 70,
              // snap: true,
              // floating: true,
              pinned: true,
              // stretch: true,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.white,
              titleSpacing: 20,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: 140,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  height: 70,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // padding: const EdgeInsets.all(8.0),
                  child: SearchBarButton(
                    hintText: 'Search NFTs',
                    isNFTResults: true,
                  ),
                ),
              ),
              title: ConnectWallet(
                onPressed: () {
                  isWalletConnected = true;
                  setState(() {});
                },
                isConnected: isWalletConnected,
              ),
              actions: [
                CustomIconButton(
                  icon: const Icon(Icons.insert_chart_outlined_rounded),
                  onPressed: () {
                    Navigator.push(
                        context, CustomPageRoute(child: StatisticPage()));
                  },
                ), //TODO: Cart Icon
                CustomIconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () => Navigator.push(
                      context, CustomPageRoute(child: const FavouritesPage())),
                ),
                SizedBox(
                  width: 16,
                )
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
                  child: Row(
                    children: categories(),
                  ),
                ),
              ),
              const SuggestionCard(),
              CategoryOfPreference(
                heading: 'Live Bidding',
                onSeeAllClicked: () {
                  Navigator.push(
                      context, CustomPageRoute(child: const LiveBiddingPage()));
                },
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      LiveBiddingTile(
                        timeLeft: '4h 16m left',
                      ),
                      LiveBiddingTile(
                        timeLeft: '4h 16m left',
                      ),
                      LiveBiddingTile(
                        timeLeft: '4h 16m left',
                      ),
                    ],
                  ),
                ),
              ),
              CategoryOfPreference(
                heading: 'Top Creator',
                onSeeAllClicked: () {},
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      TopCreatorListCard(),
                      TopCreatorListCard(),
                      TopCreatorListCard(),
                    ],
                  ),
                ),
              ),
              CategoryOfPreference(
                heading: 'Hot Items',
                onSeeAllClicked: () {},
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      NonLiveBiddingTile(),
                      NonLiveBiddingTile(),
                      NonLiveBiddingTile(),
                      NonLiveBiddingTile(),
                    ],
                  ),
                ),
              ),
              CategoryOfPreference(
                heading: 'Popular',
                onSeeAllClicked: () {},
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      NonLiveBiddingTile(),
                      NonLiveBiddingTile(),
                      NonLiveBiddingTile(),
                      NonLiveBiddingTile(),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 90,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}