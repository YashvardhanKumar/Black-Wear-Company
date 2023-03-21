import 'dart:async';
import '../../../components/buttons/category_of_pref.dart';
import '../../../components/custom_page_route.dart';
import 'product_page.dart';
import 'package:flutter/material.dart';
import '../../../components/buttons/category_tile.dart';
import '../../../components/buttons/icon_button.dart';
import '../../../components/buttons/search_button.dart';
import '../../../components/buttons/text_button.dart';
import '../../../components/cards/product_card.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_text.dart';
import '../../intro_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  bool isWalletConnected = false;

  void changePage(bool left) {
    var duration = const Duration(milliseconds: 400);
    var curve = Curves.ease;
    int page = pageController.page!.round();
    page = left ? page - 1 : page + 1;
    page = page % 5;
    pageController.animateToPage(page, duration: duration, curve: curve);
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      index++;
      changePage(false);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  int index = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      // appBar: CustomAppBar(
      //
      //   isLeadingPresent: false,
      //   title: SizedBox(
      //     height: 70,
      //       child: const SearchBarButton()),
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 70,
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
              expandedHeight: 140,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  height: 70,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // padding: const EdgeInsets.all(8.0),
                  child: const SearchBarButton(
                    hintText: 'Search Products',
                    isNFTResults: false,
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
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomIconButton(
                      icon: Icon(
                        Icons.shopping_cart_rounded,
                        color: Color(0xff49454F),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context, CustomPageRoute(child: CartPage()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 4),
                      child: Material(
                        color: Colors.red.shade800,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CustomText(
                            '3',
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomIconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    // Navigator.push(context,
                    //   CustomPageRoute(child: const FavouritesPage()));
                  },
                ),
                SizedBox(
                  width: 16,
                )
              ],
            ),
          ];
        },
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (val) {
                  index = val;
                  setState(() {});
                  timer?.cancel();
                  timer = Timer.periodic(const Duration(seconds: 5), (timer) {
                    index++;
                    changePage(false);
                    // pageController.animateToPage(pageController.page!.round(),
                    //     duration: const Duration(milliseconds: 400), curve: Curves.ease);
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/Banner.png',
                          fit: BoxFit.cover,
                        )),
                  );
                },
                itemCount: 5,
              ),
            ),
            // SizedBox(height: 10,),
            DotIndicator(
              nextClickedNo: index + 1,
              itemCount: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            CategoryOfPreference(heading: 'Categories', onSeeAllClicked: () {}),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CategoryTile(),
                    CategoryTile(),
                    CategoryTile(),
                    CategoryTile(),
                    CategoryTile(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CategoryOfPreference(
              heading: 'Popular Product',
              onSeeAllClicked: () {},
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ProductCard(
                      prevPrice: '\$40.00',
                      isLiked: true,
                      discountedPrice: '\$33.00',
                      onLiked: () {},
                      onCardClicked: () {
                        Navigator.push(
                            context, CustomPageRoute(child: ProductPage()));
                      },
                    ),
                    ProductCard(
                      discountedPrice: '\$40.00',
                      isLiked: false,
                      onLiked: () {},
                      onCardClicked: () {
                        Navigator.push(
                            context, CustomPageRoute(child: ProductPage()));
                      },
                    ),
                    ProductCard(
                      isLiked: false,
                      discountedPrice: '\$40.00',
                      onLiked: () {},
                      onCardClicked: () {
                        Navigator.push(
                            context, CustomPageRoute(child: ProductPage()));
                      },
                    ),
                    ProductCard(
                      isLiked: false,
                      discountedPrice: '\$40.00',
                      onLiked: () {},
                      onCardClicked: () {
                        Navigator.push(
                            context, CustomPageRoute(child: ProductPage()));
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ConnectWallet extends StatelessWidget {
  const ConnectWallet({
    super.key,
    required this.onPressed,
    required this.isConnected,
  });

  final VoidCallback onPressed;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    if (isConnected) {
      return CircleAvatar(
        radius: 28,
        foregroundImage: AssetImage('images/man.jpg'),
      );
    }
    return CustomOutlineButton(
      onPressed: onPressed,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wallet),
            SizedBox(
              width: 5,
            ),
            CustomText(
              'Connect Wallet',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
