
import 'package:flutter/material.dart';

import '../buttons/custom_chips.dart';
import '../buttons/text_button.dart';
import '../custom_text.dart';

class NFTFilterBottomSheet extends StatefulWidget {
  const NFTFilterBottomSheet({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  State<NFTFilterBottomSheet> createState() => _NFTFilterBottomSheetState();
}

class _NFTFilterBottomSheetState extends State<NFTFilterBottomSheet> {
  final Map<String, List<String>> listOfFilters = {
    'itemType': [
      'All Items',
      'Single',
      'Bundles',
    ],
    'status': [
      'Buy Now',
      'On Auction',
      'New Product',
      'Has Offers',
    ],
    'sortBy': [
      'Recently Created',
      'Most Viewed',
      'Oldest',
      'Low to High',
      'High to Low',
    ]
  };
  Map<String, int?> filtered = {};
  double widthSize = 0;

  List<Widget> arrangeUsingWidth(String filterName) {
    List<Widget> listOfRows = [];
    for (int i = 0; i < listOfFilters[filterName]!.length; i++) {
      listOfRows.add(
        CustomChips(
          // key: key,
          onPressed: (val) {
            if (val == true) {
              filtered[filterName] = null;
            } else {
              filtered[filterName] = i;
            }
            setState(() {});
          },
          selected: filtered[filterName] != null && filtered[filterName] == i,
          text: listOfFilters[filterName]![i],
        ),
      );
    }
    return listOfRows;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenSize.width,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomText(
                'Select Filter',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomText(
              'Item Type',
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: arrangeUsingWidth('itemType')),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomText(
              'Status',
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: arrangeUsingWidth('status')),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomText(
              'Sort By',
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: arrangeUsingWidth('sortBy')),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomOutlineButton(
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CustomText(
                        'Reset',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      filtered = {};
                      setState(() {});
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: CustomFilledButton(
                  onPressed: filtered.isEmpty ? null : () {},
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: CustomText(
                      'Apply',
                      color: Colors.white,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,

                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
