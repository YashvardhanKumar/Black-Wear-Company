import 'package:flutter/material.dart';
import '../../../components/cards/normal_bidding_tile.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_text.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  Key? key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: const CustomAppBar(
        title: CustomText(
          'Favorite',
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
          itemCount: (10 / 2).ceil(),
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 2,
          //   childAspectRatio: ((size.width / 2) - 10) /300,
          // ),
          itemBuilder: (context, i) {
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: NonLiveBiddingTile(onLiked: () {  }, isLiked: i%2 == 0,),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: NonLiveBiddingTile(onLiked: () {  }, isLiked: i%2 == 0,),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
