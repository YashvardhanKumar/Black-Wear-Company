import 'package:bfm/components/buttons/custom_chips.dart';
import 'package:flutter/material.dart';
import 'buttons/category_filter.dart';
import 'cards/resent_search_tile.dart';
import 'custom_text.dart';

class SearchSuggestions extends StatefulWidget {
  const SearchSuggestions({
    super.key,
  });

  @override
  State<SearchSuggestions> createState() => _SearchSuggestionsState();
}

class _SearchSuggestionsState extends State<SearchSuggestions> {
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
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: CustomText(
            'Recent Search',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const RecentSearchListTile(
          query: '3D Character',
        ),
        const RecentSearchListTile(
          query: 'CryptoPunks',
        ),
        const RecentSearchListTile(
          query: 'Anime',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
        const RecentSearchListTile(
          query: 'Cartoon',
        ),
      ],
    );
  }
}
