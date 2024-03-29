import 'package:flutter/material.dart';

import '../../../components/buttons/text_button.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_page_route.dart';
import '../../../components/custom_text.dart';
import 'image_add.dart';
import 'package:dotted_border/dotted_border.dart';

import 'nft_product_add_success.dart';

class VideoAddPage extends StatefulWidget {
  const VideoAddPage({Key? key}) : super(key: key);

  @override
  State<VideoAddPage> createState() => _VideoAddPageState();
}

class _VideoAddPageState extends State<VideoAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: CustomText(
          'Upload',
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(20),
                dashPattern: const [10, 8],
                color: Colors.black,
                strokeWidth: 2,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.blue.shade50,
                        shape: const CircleBorder(),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.videocam_rounded,
                            size: 35,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                        'Upload your Video',
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                      const CustomText(
                        'Browse',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 8],
                    color: Colors.grey.shade300,
                    strokeWidth: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add_rounded,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 8],
                    color: Colors.grey.shade300,
                    strokeWidth: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 8],
                    color: Colors.grey.shade300,
                    strokeWidth: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10, 8],
                    color: Colors.grey.shade300,
                    strokeWidth: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              label: 'Title',
              hintText: 'Title of your NFT',
              required: true,
              maxLines: 1,
            ),
            const CustomTextField(
              label: 'Description',
              hintText: 'Description of your NFT',
              maxLength: 250,
              maxLines: 6,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFilledButton(
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomText(
                  'Upload',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context, CustomPageRoute(child: const NFTAddSuccess()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
