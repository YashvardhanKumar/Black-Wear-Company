import 'package:bfm/components/buttons/custom_chips.dart';
import 'package:bfm/components/buttons/icon_button.dart';
import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/nft%20store%20page/nft_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../components/buttons/text_button.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  int pageNo = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 70,
              // snap: true,
              // floating: true,
              pinned: true,
              // stretch: true,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.white,
              // titleSpacing: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: 140,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
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
                              pageNo = 0;
                              controller.animateToPage(pageNo,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.ease);
                              setState(() {});
                            },
                            selected: pageNo == 0,
                            text: 'Ranking',
                            icon: const Icon(Icons.bar_chart_rounded),
                          ),
                        ),
                        Expanded(
                          child: CustomChips(
                            onPressed: (value) {
                              pageNo = 1;
                              controller.animateToPage(pageNo,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.ease);
                              setState(() {});
                            },
                            selected: pageNo == 1,
                            text: 'Activity',
                            icon: const Icon(Icons.show_chart_rounded),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              title: const CustomText(
                'Statistic',
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
              actions: [
                CustomIconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ];
        },
        body: PageView(
          controller: controller,
          onPageChanged: (value) {
            pageNo = value;
            setState(() {});
          },
          children: [
            ListView(
              children: [
                const RankingTile(
                  nftName: '3D Cools Box',
                  userId: '3Dcoolsbox',
                  totalValuation: 263372,
                  dailyIncreaseRate: 0.2418,
                  ranking: 1,
                ),
                const RankingTile(
                  nftName: 'Duplegg',
                  userId: 'pedrogadelha',
                  totalValuation: 273347,
                  dailyIncreaseRate: -0.1618,
                  ranking: 2,
                ),
                const RankingTile(
                  nftName: 'Firemend',
                  userId: 'brunaramalho',
                  totalValuation: 237323,
                  dailyIncreaseRate: 0.2419,
                  ranking: 3,
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  height: 4,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            ListView(
              children: const [
                ActivityTile(
                    nftName: '3DMaps Cool #267',
                    userId: 'pedrogadelha',
                    activityType: 'Sale',
                    timePassed: '01 seconds ago'),
                ActivityTile(
                    nftName: '3DMaps Cool #267',
                    userId: 'pedrogadelha',
                    activityType: 'Sale',
                    timePassed: '02 seconds ago'),
                ActivityTile(
                    nftName: '3DMaps Cool #267',
                    userId: 'pedrogadelha',
                    activityType: 'Sale',
                    timePassed: '04 seconds ago'),
                ActivityTile(
                    nftName: '3DMaps Cool #267',
                    userId: 'pedrogadelha',
                    activityType: 'Sale',
                    timePassed: '06 seconds ago'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RankingTile extends StatelessWidget {
  const RankingTile({
    super.key,
    required this.nftName,
    required this.userId,
    required this.totalValuation,
    required this.dailyIncreaseRate,
    required this.ranking,
  });

  final String nftName, userId;
  final int totalValuation;
  final double dailyIncreaseRate;
  final int ranking;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          indent: 20,
          endIndent: 20,
          height: 1,
          color: Colors.grey.shade300,
        ),
        ListTile(
          minVerticalPadding: 20,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                '$ranking',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                width: 10,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('images/cream3d.jpeg'),
                radius: 30,
              ),
            ],
          ),
          onTap: () {},
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomText(
                    nftName,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'images/ethereum.png',
                      height: 18,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    CustomText(
                      '$totalValuation ETH',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          subtitle: CustomTextButton(
            onPressed: () {
              Navigator.push(context, CustomPageRoute(child: const NFTProfilePage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    '@$userId',
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    '${(dailyIncreaseRate > 0) ? '+${dailyIncreaseRate * 100}' : '${dailyIncreaseRate * 100}'}%',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: (dailyIncreaseRate > 0) ? Colors.green : Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ActivityTile extends StatelessWidget {
  const ActivityTile({
    super.key,
    required this.nftName,
    required this.userId,
    required this.activityType,
    required this.timePassed,
  });

  final String nftName, userId, activityType, timePassed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          indent: 20,
          endIndent: 20,
          height: 1,
          color: Colors.grey.shade300,
        ),
        ListTile(
          minVerticalPadding: 20,
          leading: Container(
            height: 60,
            width: 60,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.asset(
              'images/cream3d.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {},
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  nftName,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      activityType,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                    const Icon(
                      CupertinoIcons.arrow_up_right,
                      color: Colors.green,
                      size: 14,
                    )
                  ],
                ),
              ],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  '@$userId',
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  timePassed,
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
