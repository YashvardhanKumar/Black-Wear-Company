import 'package:flutter/material.dart';
import '../custom_text.dart';

class ShareBidDialog extends StatelessWidget {
  const ShareBidDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomText(
              'Share',
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShareAppButtons(
                        image: 'whatsapplogo.png',
                        appName: 'WhatsApp',
                      ),
                      ShareAppButtons(
                        image: 'twitterlogo.png',
                        appName: 'Twitter',
                      ),
                      ShareAppButtons(
                        image: 'facebooklogo.png',
                        appName: 'Facebook',
                      ),
                      ShareAppButtons(
                        image: 'instagramlogo.jpg',
                        appName: 'Instagram',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShareAppButtons(
                        image: 'yahoologo.jpg',
                        appName: 'Yahoo',
                      ),
                      ShareAppButtons(
                        image: 'tiktoklogo.png',
                        appName: 'Tiktok',
                      ),
                      ShareAppButtons(
                        image: 'chatLogo.jpg',
                        appName: 'Chat',
                      ),
                      ShareAppButtons(
                        image: 'wechatlogo.png',
                        appName: 'WeChat',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShareAppButtons extends StatelessWidget {
  const ShareAppButtons({
    super.key,
    required this.image,
    required this.appName,
  });

  final String image, appName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 70,
      // width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('images/$image', height: 50),
          ),
          CustomText(
            appName,
            fontWeight: FontWeight.w700,
            fontSize: 10,
            // color: Colors.white,
          ),
        ],
      ),
    );
  }
}
