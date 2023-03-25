import 'package:flutter/material.dart';
import '../../routes/bottom nav bar screens/home page of e commerce/search page/results/product_filter_page.dart';
import '../buttons/text_button.dart';
import '../custom_page_route.dart';
import '../custom_text.dart';
class FilterRow extends StatelessWidget {
  const FilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CustomOutlineButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
                child: Row(
                  children: const [
                    CustomText(
                      'Sort',
                      fontSize: 14,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 18,
                    )
                  ],
                ),
              ),
              onPressed: () {},
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomOutlineButton(
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.filter_list_rounded,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        CustomText(
                          'Filter',
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, CustomPageRoute(child: const ProductFilterPage()));
                  },
                ),
              ),
              Material(
                color: Colors.red.shade800,
                shape: const CircleBorder(),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CustomText(
                    '3',
                    fontSize: 10,
                    color: Colors.white,
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