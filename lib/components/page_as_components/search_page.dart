

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../routes/bottom nav bar screens/home page of e commerce/search page/results/search_results.dart';
import '../../routes/bottom nav bar screens/nft store page/nft_search_result_page.dart';
import '../bottom_sheets/nft_filter_bottom_sheet.dart';
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
