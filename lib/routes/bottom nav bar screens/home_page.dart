import 'dart:async';

import 'package:bfm/components/bottom_nav_bar.dart';
import 'package:bfm/components/category_of_pref.dart';
import 'package:bfm/components/custom_app_bar.dart';
import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:bfm/routes/search_page.dart';
import 'package:flutter/material.dart';

import '../../components/buttons/category_tile.dart';
import '../../components/product_card.dart';
import '../intro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      index++;
      pageController.animateToPage(index % 5,
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
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
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Material(
          type: MaterialType.transparency,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, CustomPageRoute(child: const SearchPage()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffefe9f5),
                borderRadius: BorderRadius.circular(50),
              ),
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Color(0xff49454F),
                      ),
                    ),
                    const Expanded(
                      child: CustomText(
                        'Hinted Search Text',
                        color: Color(0xff49454F),
                        fontSize: 16,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.search_rounded,
                        color: Color(0xff49454F),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 180,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (val) {
                index = val;
                setState(() {});
              },
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('images/Banner.png'),
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
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
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
            child: const Row(
              children: [
                ProductCard(
                  prevPrice: '\$40.00',
                  isLiked: true,
                  discountedPrice: '\$33.00',
                ),
                ProductCard(
                  discountedPrice: '\$40.00',
                  isLiked: false,
                ),
                ProductCard(
                  isLiked: false,
                  discountedPrice: '\$40.00',
                ),
                ProductCard(
                  isLiked: false,
                  discountedPrice: '\$40.00',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}




