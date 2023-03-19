import 'package:bfm/components/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import '../../../components/buttons/custom_chips.dart';
import '../../../components/buttons/icon_button.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_text.dart';
class NFTProfilePage extends StatelessWidget {
  const NFTProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 70,
              pinned: true,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.white,
              leadingWidth: 0,
              titleSpacing: 0,
              leading: Container(),
              expandedHeight: 600,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                expandedTitleScale: 1,
                stretchModes: [],
                title: Container(
                  margin: const EdgeInsets.only(top: 70 + 24, bottom: 70),
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.topLeft,
                  child: const SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/cream3d.jpeg'),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText('StrongQuest', color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,),
                            Row(
                              children: [
                                Icon(CustomIcon.instagram),
                                Icon(CustomIcon.twitter),
                                Icon(Icons.share),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: Container(
                  height: 70,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomChips(
                            onPressed: (value) {
                              // pageNo = 0;
                              // controller.animateToPage(pageNo,
                              //     duration: const Duration(milliseconds: 400),
                              //     curve: Curves.ease);
                              //
                              // setState(() {});
                            },
                            selected: true,
                            // pageNo == 0,
                            text: 'Ranking',
                            icon: const Icon(Icons.bar_chart_rounded),
                          ),
                        ),
                        Expanded(
                          child: CustomChips(
                            onPressed: (value) {
                              // pageNo = 1;
                              // controller.animateToPage(pageNo,
                              //     duration: const Duration(milliseconds: 400),
                              //     curve: Curves.ease);
                              // setState(() {});
                            },
                            selected: false,
                            // pageNo == 1,
                            text: 'Activity',
                            icon: const Icon(Icons.show_chart_rounded),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              title: CustomAppBar(
                actions: [
                  CustomIconButton(
                    icon: const Icon(Icons.search_rounded),
                    onPressed: () {},
                  ),
                  CustomIconButton(
                    icon: const Icon(Icons.filter_list_rounded),
                    onPressed: () {},
                  ),
                  CustomIconButton(
                    icon: const Icon(Icons.more_vert_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ];
        },
        body: ListView(),
      ),
    );
  }
}