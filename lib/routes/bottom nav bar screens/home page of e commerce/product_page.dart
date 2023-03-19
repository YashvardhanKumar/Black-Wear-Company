import 'package:bfm/components/buttons/category_tile.dart';
import 'package:bfm/components/custom_app_bar.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:bfm/routes/intro_page.dart';
import 'package:flutter/material.dart';
import '../../../components/buttons/custom_chips.dart';
import '../../../components/buttons/icon_button.dart';
import '../../../components/buttons/text_button.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        backgroundColor: Colors.black45,
        leading: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: CustomOutlinedIconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 18,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        // isTransparent: true,
        title: const CustomText('Product Name',
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset('images/product.png'),
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.decal,
                      colors: [
                        Colors.transparent,
                        Colors.white54,
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DotIndicator(nextClickedNo: 1, itemCount: 5),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        'Product Name',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      CustomText(
                        '\$22.00',
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.grey.shade300)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                size: 20,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              CustomText(
                                '4.8',
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CustomText('125+ Reviews'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProductInfoCards(
                    description: CustomText(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                          'Adipiscing elit pellentesque habitant morbi. Massa placerat duis '
                          'ultricies lacus sed turpis tincidunt. Aenean euismod elementum nisi '
                          'quis eleifend. Lectus mauris ultrices eros in cursus turpis massa '
                          'tincidunt dui. Pharetra massa massa ultricies mi quis hendrerit '
                          'dolor magna eget. Neque volutpat ac tincidunt vitae semper quis. '
                          'Ipsum dolor sit amet consectetur adipiscing. Sit amet est placerat '
                          'in egestas erat imperdiet sed euismod. Sed viverra ipsum nunc aliquet '
                          'bibendum. Fames ac turpis egestas maecenas. Amet volutpat consequat mauris'
                          ' nunc congue. Nulla facilisi etiam dignissim diam quis enim lobortis '
                          'scelerisque. Enim nulla aliquet porttitor lacus. Enim eu turpis egestas '
                          'pretium aenean. Vitae et leo duis ut diam quam nulla porttitor.'
                          '\n\nAliquet eget sit amet tellus. Gravida quis blandit turpis cursus in hac '
                          'habitasse platea dictumst. Convallis convallis tellus id interdum velit '
                          'laoreet. Bibendum ut tristique et egestas quis. Gravida arcu ac tortor '
                          'dignissim. Aenean et tortor at risus viverra adipiscing at. Aliquet nibh '
                          'praesent tristique magna sit amet purus. Sit amet aliquam id diam maecenas '
                          'ultricies mi eget mauris. At lectus urna duis convallis convallis tellus id. '
                          'A erat nam at lectus. Elit pellentesque habitant morbi tristique. Rhoncus '
                          'mattis rhoncus urna neque viverra. Sapien pellentesque habitant morbi tristique '
                          'senectus et netus. Vitae nunc sed velit dignissim sodales ut. Varius duis at '
                          'consectetur lorem donec massa sapien faucibus et. Nunc eget lorem dolor sed '
                          'viverra ipsum nunc ',
                      fontSize: 11,
                      color: Colors.grey.shade700,
                      height: 1.7,
                    ),
                    expanded: true,
                    title: 'Product Description',
                    isChanged: (bool value) {},
                  ),
                  ProductInfoCards(
                    expanded: true,
                    title: 'Product Specification',
                    description: Column(
                      children: [
                        BulletPointsText(
                            'Oversized fit - Super Loose On Body Thoda Hawa Aane De.'),
                        BulletPointsText(
                            'Single Jersey, 100% Cotton Classic, lightweight jersey fabric comprising 100% cotton.'),
                      ],
                    ),
                    isChanged: (bool value) {},
                  ),
                  ProductInfoCards(
                    expanded: false,
                    title: 'Return & Exchange',
                    description: Column(
                      children: [
                        BulletPointsText(
                            'Oversized fit - Super Loose On Body Thoda Hawa Aane De.'),
                        BulletPointsText(
                            'Single Jersey, 100% Cotton Classic, lightweight jersey fabric comprising 100% cotton.'),
                      ],
                    ),
                    isChanged: (bool value) {},
                  ),
                  ProductInfoCards(
                    expanded: false,
                    title: 'Manufactured By',
                    description: Column(
                      children: [
                        BulletPointsText(
                            'Oversized fit - Super Loose On Body Thoda Hawa Aane De.'),
                        BulletPointsText(
                            'Single Jersey, 100% Cotton Classic, lightweight jersey fabric comprising 100% cotton.'),
                      ],
                    ),
                    isChanged: (bool value) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: CustomFilledButton(
                      width: double.infinity,
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CustomText('Write Review', color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CustomText(
                      'Customer reviews',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow.shade700,
                            ),
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow.shade700,
                            ),
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow.shade700,
                            ),
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow.shade700,
                            ),
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow.shade700,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomText(
                          '4.8 out of 5',
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CustomText(
                      '27 global ratings',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  RatingsBar(ratingPercent: 0.80, starNo: 5),
                  RatingsBar(ratingPercent: 0.10, starNo: 4),
                  RatingsBar(ratingPercent: 0.05, starNo: 3),
                  RatingsBar(ratingPercent: 0.05, starNo: 2),
                  RatingsBar(ratingPercent: 0.00, starNo: 1),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'User reviews',
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      CustomText(
                                        'Arman Rokni',
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CustomText(
                                        '1 day ago',
                                        fontSize: 8,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.yellow.shade700,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.yellow.shade700,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.yellow.shade700,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.yellow.shade700,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.yellow.shade700,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        CustomText(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                              'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                              'Adipiscing elit pellentesque habitant morbi. Massa placerat duis '
                              'ultricies lacus sed turpis tincidunt. Aenean euismod elementum nisi '
                              'quis eleifend. Lectus mauris ultrices eros in cursus turpis massa '
                              'tincidunt dui. Pharetra massa massa ultricies mi quis hendrerit '
                              'dolor magna eget. Neque volutpat ac tincidunt vitae semper quis. '
                              'Ipsum dolor sit amet consectetur adipiscing. Sit amet est placerat '
                              'in egestas erat imperdiet sed euismod. Sed viverra ipsum nunc aliquet '
                              'bibendum. Fames ac turpis egestas maecenas. Amet volutpat consequat mauris'
                              ' nunc congue. Nulla facilisi etiam dignissim diam quis enim lobortis '
                              'scelerisque. Enim nulla aliquet porttitor lacus. Enim eu turpis egestas '
                              'pretium aenean. Vitae et leo duis ut diam quam nulla porttitor.',
                          fontSize: 10,
                          color: Colors.grey,
                          height: 1.7,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomSheet(
        backgroundColor: Colors.white,
        onClosing: () {},
        enableDrag: false,
        builder: (BuildContext context) =>
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 120,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomChips(
                        icon: null,
                        text: 'S',
                        onPressed: (val) {},
                        selected: true,
                      ),
                      CustomChips(
                        icon: null,
                        text: 'M',
                        onPressed: (val) {},
                        selected: false,
                      ),
                      CustomChips(
                        icon: null,
                        text: 'L',
                        onPressed: (val) {},
                        selected: false,
                      ),
                      CustomChips(
                        icon: null,
                        text: 'XL',
                        onPressed: (val) {},
                        selected: false,
                      ),
                      CustomChips(
                        icon: null,
                        text: 'XXL',
                        onPressed: (val) {},
                        selected: false,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CustomText(
                              '\$ 239.93',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              'Total amount',
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CustomOutlineButton(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: CustomText(
                                'Add to Cart',
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                                fontSize: 12,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CustomFilledButton(
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: CustomText(
                                'Buy now',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                textAlign: TextAlign.center,
                                fontSize: 12,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

class RatingsBar extends StatelessWidget {
  const RatingsBar({
    super.key,
    required this.ratingPercent,
    required this.starNo,
  });

  final double ratingPercent;
  final int starNo;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText('$starNo star'),
        Builder(builder: (context) {
          double ratingWidth = size.width - 40 - 120;
          return Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Container(
                  width: ratingWidth,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5)),
                ),
                Container(
                  width: ratingWidth * ratingPercent,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade700,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ],
            ),
          );
        }),
        CustomText('${ratingPercent * 100}%'),
      ],
    );
  }
}

class ProductInfoCards extends StatefulWidget {
  const ProductInfoCards({
    super.key,
    required this.expanded,
    required this.title,
    required this.description,
    required this.isChanged,
  });

  final bool expanded;
  final String title;
  final Widget description;
  final ValueChanged<bool> isChanged;

  @override
  State<ProductInfoCards> createState() => _ProductInfoCardsState();
}

class _ProductInfoCardsState extends State<ProductInfoCards> {
  late bool expanded;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    expanded = widget.expanded;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: Colors.grey.shade300)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    widget.title,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                  IconButton(
                    onPressed: () {
                      expanded = !expanded;
                      setState(() {});
                      widget.isChanged(expanded);
                    },
                    icon: Icon(
                      (expanded) ? Icons.remove_rounded : Icons.add_rounded,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            if (expanded)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: widget.description,
              )
          ],
        ),
      ),
    );
  }
}

class BulletPointsText extends StatelessWidget {
  const BulletPointsText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            '',
            fontSize: 11,
            color: Colors.grey.shade700,
            height: 1.7,
          ),
          Flexible(
            child: CustomText(
              'Oversized fit - Super Loose On Body Thoda Hawa Aane De.',
              fontSize: 11,
              color: Colors.grey.shade700,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}