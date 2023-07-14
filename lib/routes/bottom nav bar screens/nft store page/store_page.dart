import 'package:bfm/components/buttons/custom_chips.dart';
import 'package:bfm/components/buttons/search_button.dart';
import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/nft%20store%20page/statistic_page.dart';
import 'package:flutter/material.dart';
import '../../../components/buttons/icon_button.dart';
import '../../../components/cards/live_bidding_tile.dart';
import '../../../components/cards/normal_bidding_tile.dart';
import '../../../components/cards/top_creator_card.dart';
import '../../../components/buttons/category_of_pref.dart';
import '../../../components/cards/suggestion_card.dart';
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
              toolbarHeight: 50,
              // snap: true,
              // floating: true,
              pinned: true,
              scrolledUnderElevation: 0,
              // stretch: true,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.white,
              titleSpacing: 20,
              leadingWidth: 0,
              leading: Container(),
              collapsedHeight: 55,
              expandedHeight: 105,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  height: 55,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // padding: const EdgeInsets.all(8.0),
                  child: const SearchBarButton(
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
                        context, CustomPageRoute(child: const StatisticPage()));
                  },
                ), //TODO: Cart Icon
                CustomIconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () => Navigator.push(
                      context, CustomPageRoute(child: const FavouritesPage())),
                ),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      NonLiveBiddingTile(onLiked: () {  }, isLiked: true,),
                      NonLiveBiddingTile(onLiked: () {  }, isLiked: false,),
                      NonLiveBiddingTile(onLiked: () {  }, isLiked: true,),
                      NonLiveBiddingTile(onLiked: () {  }, isLiked: false,),
                    ],
                  ),
                ),
              ),
              CategoryOfPreference(
                heading: 'Popular',
                onSeeAllClicked: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      NonLiveBiddingTile(onLiked: () {  }, isLiked: true,),
                      NonLiveBiddingTile(onLiked: () {  }, isLiked: false,),
                      NonLiveBiddingTile(onLiked: () {  }, isLiked: true,),
                      NonLiveBiddingTile(onLiked: () {  }, isLiked: false,),
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
