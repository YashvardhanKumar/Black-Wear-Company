

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../routes/bottom nav bar screens/home page of e commerce/search page/results/search_results.dart';
import '../../routes/bottom nav bar screens/nft store page/nft_search_result_page.dart';
import '../buttons/custom_chips.dart';
import '../buttons/text_button.dart';
import '../custom_text.dart';
import '../search_bar.dart';

import '../custom_app_bar.dart';
import '../search_suggestions_recent.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    this.appendInQuery = '',
    required this.isNFTResults,
  }) : super(key: key);
  final String appendInQuery;
  final bool isNFTResults;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String query;
  bool searchClicked = false;
  bool nextPage = false;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    query = widget.appendInQuery;
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(searchClicked);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isLeadingPresent: false,
        padding: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor:
              searchClicked ? Colors.transparent : const Color(0xffefe9f5),
        ),
        title: Row(
          children: [
            Flexible(
              child: CustomSearchBar(
                filterIcon: widget.isNFTResults
                    ? IconButton(
                        icon: const Icon(Icons.filter_list),
                        onPressed: () {
                          showModalBottomSheet(
                            // enableDrag: false,
                            isScrollControlled: true,
                            context: context,
                            builder: (_) =>
                                NFTFilterBottomSheet(screenSize: size),
                          );
                        },
                      )
                    : null,
                focusNode: focusNode,
                onChanged: (val) {
                  if (searchClicked == true) {
                    searchClicked = false;
                    focusNode.unfocus();
                  }
                  query = val;
                  setState(() {});
                },
                onTap: () {
                  if (searchClicked == true) {
                    searchClicked = false;
                    setState(() {});
                  }
                },
                onSearchClicked: () {
                  if (query.isNotEmpty) {
                    searchClicked = true;
                    focusNode.unfocus();
                    setState(() {});
                  }
                },
                searchClicked: searchClicked,
              ),
            ),
          ],
        ),
      ),
      body: (searchClicked)
          ? (widget.isNFTResults
              ? NFTSearchResultPage(query: query)
              : SearchResultsPage(query: query))
          : const SearchSuggestions(),
    );
  }
}

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
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: CustomText(
                      'Apply',
                      color: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onPressed: filtered.isEmpty ? null : () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
