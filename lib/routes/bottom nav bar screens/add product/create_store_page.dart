import 'package:bfm/components/buttons/text_button.dart';
import 'package:bfm/components/cards/product_card.dart';
import 'package:bfm/components/custom_app_bar.dart';
import 'package:bfm/components/custom_grid_view.dart';
import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/add%20product/store_created_success.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/home%20page%20of%20e%20commerce/product_page.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_text.dart';

class CreateStorePage extends StatefulWidget {
  const CreateStorePage({Key? key}) : super(key: key);

  @override
  State<CreateStorePage> createState() => _CreateStorePageState();
}

class _CreateStorePageState extends State<CreateStorePage> {
  bool isLoading = true;
  List<int> selected = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: (isLoading) ? null : CustomText((selected.isEmpty) ? 'Create your Store': '${selected.length} Selected'),
      ),
      body: (isLoading)
          ? CreateStoreProgressPage()
          : CustomGridView(
              itemCount: 10,
              itemBuilder: (_, i) {
                return Stack(
                  // alignment: Alignment.center,
                  children: [
                    ProductCard(
                      discountedPrice: '\$33.00',
                      isLiked: true,
                      onLiked: () {},
                      onCardLongPress: () {
                        if (selected.contains(i)) {
                          selected.remove(i);
                        } else {
                          selected.add(i);
                        }
                        setState(() {});
                      },
                      onCardClicked: () {
                        if (selected.contains(i)) {
                          selected.remove(i);
                          setState(() {});
                        } else {
                          if (selected.isNotEmpty) {
                            selected.add(i);
                            setState(() {});
                            return;
                          }
                          Navigator.push(
                              context, CustomPageRoute(child: ProductPage()));
                        }
                      },
                    ),
                    if (selected.contains(i))
                      Container(
                        // alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundColor: Colors.green.withOpacity(0.1),
                          radius: 30,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
      // extendBody: true,
      bottomNavigationBar: (!isLoading)
          ? Container(
              child: BottomSheet(
                backgroundColor: Colors.white,
                onClosing: () {},
                builder: (_) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomFilledButton(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomText(
                        'Create',
                        color: Colors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: (selected.isEmpty) ? null : () {
                      Navigator.push(context, CustomPageRoute(child: StoreCreatedSuccess()));
                    },
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

class CreateStoreProgressPage extends StatelessWidget {
  const CreateStoreProgressPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'images/robot.png',
              width: size.width,
              height: size.width,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomText(
                    'Wait for few seconds',
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CustomText(
                    'We created a one-of-a-kind retail store where you can sell '
                    'your NFTs as things. Simply choose the products you '
                    'wish to sell as merchandise and you’re ready to start.',
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
