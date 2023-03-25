import 'package:bfm/components/custom_text.dart';
import 'package:bfm/components/cards/product_card.dart';
import 'package:flutter/material.dart';
import '../../../../../components/cards/product_filter_row.dart';
import '../../../../../components/custom_grid_view.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key, required this.query});

  final String query;

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const FilterRow(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CustomText(
                    'Result on ',
                    color: Color(0xff595757),
                  ),
                  CustomText(
                    '"${widget.query}"',
                    color: const Color(0xff595757),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              const CustomText(
                '26 results',
                color: Color(0xFFB6B4B0),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomGridView(
            itemCount: 10,
            itemBuilder: (context, i) {
              return ProductCard(
                discountedPrice: '\$33.00',
                isLiked: true,
                prevPrice: '\$40.00',
                onLiked: () {},
                onCardClicked: () {},
              );
            },
          ),
        )
      ],
    );
  }
}
