import 'dart:async';
import 'package:get_storage/get_storage.dart';

import '../../../components/buttons/category_of_pref.dart';
import '../../../components/common_login_dialog_box.dart';
import '../../../components/custom_page_route.dart';
import 'product_page.dart';
import 'package:flutter/material.dart';
import '../../../components/buttons/icon_button.dart';
import '../../../components/buttons/search_button.dart';
import '../../../components/buttons/text_button.dart';
import '../../../components/cards/product_card.dart';
import '../../../components/custom_text.dart';
import 'cart_page.dart';

final box = GetStorage('UserStatus');

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
    int page = suggestsPageController.page!.round();
    page = left ? page - 1 : page + 1;
    page = page % 5;
    suggestsPageController.animateToPage(page,
        duration: duration, curve: curve);
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      indexOfSuggests++;
      changePage(false);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    suggestsPageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  int indexOfSuggests = 0;
  int indexOfFeaturedProducts = 0;
  final PageController suggestsPageController = PageController();
  final PageController featuredProductsPageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      extendBody: true,
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
                      icon: const Icon(
                        Icons.shopping_cart_rounded,
                        color: Color(0xff49454F),
                      ),
                      onPressed: () {
                        if (!box.read('isLogin')!) {
                          showDialog(
                              context: context,
                              builder: (_) => const CommonLoginDialogBox());
                        } else {
                          Navigator.push(context,
                              CustomPageRoute(child: const CartPage()));
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 4),
                      child: Material(
                        color: Colors.red.shade800,
                        shape: const CircleBorder(),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
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
                const SizedBox(
                  width: 16,
                )
              ],
            ),
          ];
        },
        body: ListView(
          children: [
            SizedBox(
              // margin: const EdgeInsets.all(10),
              height: 400,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: suggestsPageController,
                    onPageChanged: (val) {
                      indexOfSuggests = val;
                      setState(() {});
                      timer?.cancel();
                      timer =
                          Timer.periodic(const Duration(seconds: 5), (timer) {
                        indexOfSuggests++;
                        changePage(false);
                        // pageController.animateToPage(pageController.page!.round(),
                        //     duration: const Duration(milliseconds: 400), curve: Curves.ease);
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: deviceSize.width,
                        child: Image.asset(
                          'images/bfm_suggest.png',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    itemCount: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Stack(
                      children: [
                        Container(
                          width: deviceSize.width - 40,
                          height: 5,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              width: (deviceSize.width - 40) *
                                  (indexOfSuggests / 5),
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10)),
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.ease,
                            ),
                            Container(
                              width: (deviceSize.width - 40) / 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(height: 10,),
            // DotIndicator(
            //   nextClickedNo: index + 1,
            //   itemCount: 5,
            // ),
            const SizedBox(
              height: 10,
            ),
            CategoryOfPreference(
                heading: 'Featured Products', onSeeAllClicked: () {}),
            Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 500,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView.builder(
                        controller: featuredProductsPageController,
                        onPageChanged: (val) {
                          indexOfFeaturedProducts = val;
                          setState(() {});
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SizedBox(
                                width: deviceSize.width,
                                child: Image.asset(
                                  'images/product1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                // height: 150,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                              child: CustomText(
                                            'Golden Skull T shirt',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          )),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              CustomText(
                                                '4.2',
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow.shade800,
                                                size: 25,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(),
                                              SizedBox(width: 10,),
                                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    'Creator',
                                                    color: Colors.white54,
                                                    fontSize: 14,
                                                  ),
                                                  CustomText(
                                                    'Thappier Fresco',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              CustomText(
                                                'Price',
                                                color: Colors.white54,
                                                fontSize: 14,
                                              ),
                                              CustomText(
                                                '6.38 \$',
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        itemCount: 5,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        width: deviceSize.width - 40,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            width: (deviceSize.width - 40) *
                                (indexOfFeaturedProducts / 5),
                            height: 5,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.ease,
                          ),
                          Container(
                            width: (deviceSize.width - 40) / 5,
                            height: 5,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Row(
            //       children: const [
            //         CategoryTile(),
            //         CategoryTile(),
            //         CategoryTile(),
            //         CategoryTile(),
            //         CategoryTile(),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: CustomTextButton(
                onPressed: () {},
                child: const CustomText(
                  'VIEW MORE',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CategoryOfPreference(
              heading: 'Featured Brands',
              onSeeAllClicked: () {},
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Row(
            //       children: [
            //         ProductCard(
            //           prevPrice: '\$40.00',
            //           isLiked: true,
            //           discountedPrice: '\$33.00',
            //           onLiked: () {},
            //           onCardClicked: () {
            //             Navigator.push(context,
            //                 CustomPageRoute(child: const ProductPage()));
            //           },
            //         ),
            //         ProductCard(
            //           discountedPrice: '\$40.00',
            //           isLiked: false,
            //           onLiked: () {},
            //           onCardClicked: () {
            //             Navigator.push(context,
            //                 CustomPageRoute(child: const ProductPage()));
            //           },
            //         ),
            //         ProductCard(
            //           isLiked: false,
            //           discountedPrice: '\$40.00',
            //           onLiked: () {},
            //           onCardClicked: () {
            //             Navigator.push(context,
            //                 CustomPageRoute(child: const ProductPage()));
            //           },
            //         ),
            //         ProductCard(
            //           isLiked: false,
            //           discountedPrice: '\$40.00',
            //           onLiked: () {},
            //           onCardClicked: () {
            //             Navigator.push(context,
            //                 CustomPageRoute(child: const ProductPage()));
            //           },
            //         )
            //       ],
            //     ),
            //   ),
            // )
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: deviceSize.width - 40,
                    child: Image.asset('images/thesouledstore.png'),
                  ),
                  SizedBox(
                    width: deviceSize.width - 40,
                    child: Image.asset('images/bewakoof.png'),
                  ),
                  SizedBox(
                    width: deviceSize.width - 40,
                    child: Image.asset('images/uniqlo.png'),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: CustomTextButton(
                onPressed: () {},
                child: const CustomText(
                  'VIEW MORE',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CategoryOfPreference(
                heading: 'Featured Products', onSeeAllClicked: () {}),
            Column(
              children: [
                Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 300,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView.builder(
                        controller: featuredProductsPageController,
                        onPageChanged: (val) {
                          indexOfFeaturedProducts = val;
                          setState(() {});
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SizedBox(
                                width: deviceSize.width,
                                child: Image.asset(
                                  'images/product1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                // height: 150,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                              child: CustomText(
                                                'Golden Skull T shirt',
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              )),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              CustomText(
                                                '4.2',
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow.shade800,
                                                size: 25,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(),
                                              SizedBox(width: 10,),
                                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    'Creator',
                                                    color: Colors.white54,
                                                    fontSize: 14,
                                                  ),
                                                  CustomText(
                                                    'Thappier Fresco',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              CustomText(
                                                'Price',
                                                color: Colors.white54,
                                                fontSize: 14,
                                              ),
                                              CustomText(
                                                '6.38 \$',
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        itemCount: 5,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        width: deviceSize.width - 40,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            width: (deviceSize.width - 40) *
                                (indexOfFeaturedProducts / 5),
                            height: 5,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.ease,
                          ),
                          Container(
                            width: (deviceSize.width - 40) / 5,
                            height: 5,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
      return const CircleAvatar(
        radius: 28,
        foregroundImage: AssetImage('images/man.jpg'),
      );
    }
    return CustomOutlineButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
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
