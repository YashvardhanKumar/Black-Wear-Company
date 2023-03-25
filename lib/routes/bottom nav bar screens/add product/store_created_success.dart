import 'package:flutter/material.dart';

import '../../../components/buttons/text_button.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_page_route.dart';
import '../../../components/custom_text.dart';
import 'show_store_page.dart';

class StoreCreatedSuccess extends StatelessWidget {
  const StoreCreatedSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          Container(
            width: size.width,
            height: size.width,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30.0),
            child: CircleAvatar(
              backgroundColor: Colors.lightBlue.shade50,
              radius: 80,
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomText(
                    'Created Successfully!',
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CustomText(
                    'You have successfully created your NFT Store.',
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
      bottomNavigationBar: BottomSheet(
        elevation: 0,
        onClosing: () {  },
        builder:(_) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomFilledButton(
            // width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: CustomText(
                'OK',
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                CustomPageRoute(child: const ShowStorePage()),
              );
            },
          ),
        ),
      ),
    );
  }
}
