import 'package:bfm/components/custom_app_bar.dart';
import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:flutter/material.dart';

import '../components/buttons/icon_button.dart';
import '../components/buttons/text_button.dart';
import 'login pages/login.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int nextClickedNo = 1;
  PageController controller = PageController();
  List<String> title = [
    'The World’s largest digital marketplace for NFT E-commerce',
    'Secure your digital assets with the best one',
    'Provides a variety of cryptocurrency wallet'
  ];
  List<String> description = [
    'The World’s largest digital marketplace for crypto '
        'collectibles and non-fungible tokens. '
        'Buy, sell, and discover exclusive digital items.',
    'Baruna has partnered with some notable companies and '
        'recently partnered with Opensea to help secure non-'
        'fungible tokens artists\' and creators\'work',
    'Supports more than 150 cryptocurrency wallet. For an '
        'introduction to the non-fungible tokens world, Baruna is '
        'a great place to start'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).viewPadding;
    double height = size.height - padding.vertical;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        isTransparent: true,
        leading: CustomOutlinedIconButton(
          color: Colors.black,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18,
          ),
          onPressed: () {
            if (nextClickedNo > 1) {
              nextClickedNo--;
              controller.animateToPage(
                nextClickedNo - 1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
              );
              setState(() {});
            }
          },
        ),
        actions: [
          CustomTextButton(
            onPressed: () {
              Navigator.push(
                  context, CustomPageRoute(child: const LoginPage()));
            },
            child: const CustomText(
              'Skip',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bgIntro.webp'), fit: BoxFit.fill)),
        child: Padding(
          padding: padding,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: height * 0.5,
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        // height: height - (height * 0.5),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
        ),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    nextClickedNo = value + 1;
                    setState(() {});
                  },
                  itemBuilder: (context, i) {
                    return IntroTextsSlider(
                      title: title[i],
                      description: description[i],
                    );
                  },
                  itemCount: 3,
                ),
              ),
              const SizedBox(height: 20,),
              DotIndicator(nextClickedNo: nextClickedNo, itemCount: 3,),
              const SizedBox(height: 20,),
              CustomFilledButton(
                padding: const EdgeInsets.all(15.0),
                width: double.infinity,
                child: const CustomText(
                  'Next',
                  color: Colors.white,
                ),
                onPressed: () {
                  if (nextClickedNo < 3) {
                    controller.animateToPage(
                      nextClickedNo++,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOut,
                    );
                  } else if (nextClickedNo == 3) {
                    Navigator.push(
                      context,
                      CustomPageRoute(child: const LoginPage()),
                    );
                  }
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.nextClickedNo, required this.itemCount,
  });

  final int nextClickedNo;
  final int itemCount;

  List<Widget> dots() {
    List<Widget> dot = [];
    for(int i = 1; i <= itemCount; i++) {
      dot.add(Container(
        height: 10,
        width: 10,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: (nextClickedNo == i)
              ? Colors.black
              : Colors.black.withOpacity(0.5),
        ),
      ));
    }
    return dot;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots(),
    );
  }
}

class IntroTextsSlider extends StatelessWidget {
  const IntroTextsSlider({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          title,
          fontSize: 23,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomText(
          description,
          height: 1.5,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
