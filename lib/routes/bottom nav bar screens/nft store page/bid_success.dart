import 'package:flutter/material.dart';
import '../../../components/buttons/text_button.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_text.dart';

class BidSuccessPage extends StatelessWidget {
  const BidSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/thumbsup.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomText(
                      'Place a bid Success!',
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomText(
                      'You have successfully bid on the item and it will be on the list',
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox()
          ],
        ),
      ),
      bottomNavigationBar: BottomSheet(
        elevation: 0,
        backgroundColor: Colors.white,
        onClosing: () {},
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomFilledButton(
              // width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomText('View Item',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    textAlign: TextAlign.center,
                    color: Colors.white),
              ),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
