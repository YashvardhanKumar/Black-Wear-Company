import 'package:bfm/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../components/buttons/text_button.dart';
import '../../../components/custom_text.dart';

class ViewLink extends StatelessWidget {
  const ViewLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('images/key.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomText(
                      'Your Link',
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomText(
                      'https://blackfoxmetaverse.io/assets/eth/oxd010d97335ac4567b0f44105d2b59/230',
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
          backgroundColor: Colors.white,
          elevation: 0,
          onClosing: () {},
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomOutlineButton(
                            // width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 12),
                              child: Row(
                                children: const [
                                  CustomText(
                                    'Copy Link',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.copy)
                                ],
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomOutlineButton(
                            // width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 12),
                              child: Row(
                                children: const [
                                  CustomText(
                                    'QR Code',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.qr_code_scanner_rounded)
                                ],
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Image.asset('images/qrcode.png'),
                                  backgroundColor: Colors.white,
                                  surfaceTintColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  actions: [
                                    FilledButton(
                                      style: FilledButton.styleFrom(
                                        backgroundColor: Colors.black,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const CustomText('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomFilledButton(
                      width: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CustomText('OK',
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
