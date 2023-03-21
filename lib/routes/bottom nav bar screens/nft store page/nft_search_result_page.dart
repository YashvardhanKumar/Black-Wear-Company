import 'package:bfm/components/cards/normal_bidding_tile.dart';
import 'package:flutter/material.dart';
import '../../../components/buttons/custom_chips.dart';
import '../../../components/cards/product_card.dart';
import '../../../components/custom_grid_view.dart';
import '../../../components/custom_text.dart';

class NFTSearchResultPage extends StatefulWidget {
  const NFTSearchResultPage({
    Key? key,
    required this.query,
  }) : super(key: key);
  final String query;

  @override
  State<NFTSearchResultPage> createState() => _NFTSearchResultPageState();
}

class _NFTSearchResultPageState extends State<NFTSearchResultPage> {
  int? chipCustomSelected;
  final List<Map<String, dynamic>> categoryFilter = [
    {
      'icon': Icons.list_rounded,
      'text': 'All',
    },
    {
      'icon': Icons.palette_rounded,
      'text': 'Art',
    },
    {
      'icon': Icons.music_note_rounded,
      'text': 'Music',
    },
    {
      'icon': Icons.directions_run_rounded,
      'text': 'Sports',
    }
  ];

  List<Widget> categories() {
    List<Widget> list = [];
    for (int index = 0; index < categoryFilter.length; index++) {
      list.add(
        CustomChips(
          icon: Icon(
            categoryFilter[index]['icon'],
          ),
          text: categoryFilter[index]['text'],
          onPressed: (val) {
            if ((chipCustomSelected == index)) {
              chipCustomSelected = null;
            } else {
              chipCustomSelected = index;
            }
            setState(() {});
          },
          selected: chipCustomSelected == index,
        ),
      );
      setState(() {});
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
            child: Row(children: categories()),
          ),
        ),
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
          padding: EdgeInsets.all(10.0),
          child: CustomGridView(
            itemCount: 10,
            itemBuilder: (_, i) => NonLiveBiddingTile(),
          ),
        )
      ],
    );
  }
}
