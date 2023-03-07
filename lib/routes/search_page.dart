import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/category_filter.dart';
import '../components/custom_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Color(0xffefe9f5)),
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Material(
          type: MaterialType.transparency,
          child: Container(
            color: Color(0xffefe9f5),
            height: kToolbarHeight + 24,
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Color(0xff49454F),
                  ),
                ),
                Expanded(
                  child: TextField(
                    autofocus: true,
                    cursorColor: Color(0xff49454F),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xff49454F),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
              child: Row(
                children: [
                  Categories(
                    icon: Icon(
                      Icons.list_rounded,
                    ),
                    text: 'All',
                  ),
                  Categories(
                    icon: Icon(
                      Icons.palette_rounded,
                    ),
                    text: 'Art',
                  ),
                  Categories(
                    icon: Icon(
                      Icons.music_note_rounded,
                    ),
                    text: 'Music',
                  ),
                  Categories(
                    icon: Icon(
                      Icons.directions_run_rounded,
                    ),
                    text: 'Photography',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomText(
              'Recent Search',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          RecentSearchListTile(query: '3D Character',),
          RecentSearchListTile(query: 'CryptoPunks',),
          RecentSearchListTile(query: 'Anime',),
          RecentSearchListTile(query: 'Cartoon',),
        ],
      ),
    );
  }
}

class RecentSearchListTile extends StatelessWidget {
  const RecentSearchListTile({
    super.key, required this.query,
  });
  final String query;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      onTap: () {},
      leading: Icon(
        Icons.access_time_rounded,
        color: Color(0xff595757),
      ),
      title: CustomText(
        query,
        color: Color(0xff595757),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.close_rounded,
          color: Color(0xff595757),
        ),
      ),
    );
  }
}
