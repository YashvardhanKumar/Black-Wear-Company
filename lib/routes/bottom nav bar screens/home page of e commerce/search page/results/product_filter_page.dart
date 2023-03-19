import 'package:bfm/components/buttons/text_button.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../../../components/custom_app_bar.dart';
import '../../../../../components/filter_product_category_tile.dart';

class ProductFilterPage extends StatefulWidget {
  const ProductFilterPage({super.key});

  @override
  State<ProductFilterPage> createState() => _ProductFilterPageState();
}

class _ProductFilterPageState extends State<ProductFilterPage> {
  List<String> filterCategories = [
    'Gender',
    'Size',
    'Discount',
    'Brand',
    'Customer Ratings',
    'Price',
    'Neck Type',
    'Pattern',
    'Color',
    'Sleeve',
    'Offer',
    'Fabric',
    'Pack of',
  ];
  Map<String, List<String>> filters = {
    'Gender': ['Men', 'Women', 'Kids', 'Couples'],
    'Size': [],
    'Discount': [],
    'Brand': [],
    'Customer Ratings': [],
    'Price': [],
    'Neck Type': [],
    'Pattern': [],
    'Color': [],
    'Sleeve': [],
    'Offer': [],
    'Fabric': [],
    'Pack of': [],
  };
  int selected = 0;
  Map<String, List<int>> selectedFilter = {};

  List<Widget> setFilterForCategories(int idx) {
    List<Widget> list = [];
    String category = filterCategories[idx];
    List<String> totalFilt = filters[category]!;
    selectedFilter[category];
    for (int i = 0; i < totalFilt.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: selectedFilter[category]?.contains(i) ?? false,
                onChanged: (val) {
                  if (selectedFilter[category] == null) {
                    selectedFilter[category] = [];
                  }
                  if (val! != true) {
                    selectedFilter[category]!.remove(i);
                  } else {
                    selectedFilter[category]!.add(i);
                  }
                  setState(() {});
                },
                activeColor: Colors.blueAccent.shade700,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              CustomText(
                totalFilt[i],
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).viewPadding;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: const CustomText('Filters'),
        actions: [
          CustomTextButton(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomText(
                'Clear Filters',
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.blue.shade700,
              ),
            ),
            onPressed: () {
              selectedFilter = {};
              setState(() {});
            },
          )
        ],
      ),
      body: Container(
        height: size.height - kToolbarHeight - padding.vertical,
        decoration:
            BoxDecoration(border: Border.symmetric(vertical: BorderSide())),
        child: Column(
          children: [
            Divider(
              height: 1.5,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: filterCategories.length,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      itemBuilder: (context, i) => FilterProductCategory(
                        selected: i == selected,
                        onTap: () {
                          selected = i;
                          setState(() {});
                        },
                        title: filterCategories[i],
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 0,
                    thickness: 1.5,
                    color: Colors.grey,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: setFilterForCategories(selected)),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 0,
              thickness: 1.5,
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        '2,345',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        'Products found',
                        color: Colors.grey.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  CustomFilledButton(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomText(
                        'Apply',
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
