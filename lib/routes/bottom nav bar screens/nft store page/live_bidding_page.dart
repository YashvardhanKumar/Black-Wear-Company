import 'package:bfm/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../components/cards/live_bidding_tile.dart';

class LiveBiddingPage extends StatefulWidget {
  const LiveBiddingPage({Key? key}) : super(key: key);

  @override
  State<LiveBiddingPage> createState() => _LiveBiddingPageState();
}

class _LiveBiddingPageState extends State<LiveBiddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: const [
            LiveBiddingTile(
              timeLeft: '4h 16m 27s left',
            ),
            LiveBiddingTile(
              timeLeft: '4h 16m 27s left',
            ),
            LiveBiddingTile(
              timeLeft: '4h 16m 27s left',
            ),
            LiveBiddingTile(
              timeLeft: '4h 16m 27s left',
            ),
          ],
        ),
      ),
    );
  }
}
