import 'package:flutter/material.dart';
import '../../../components/buttons/icon_button.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_text.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: CustomAppBar(
        title: const CustomText(
          'Notification',
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          CustomIconButton(
              icon: const Icon(
                Icons.more_vert,
                size: 22,
              ),
              onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: CustomText(
                'Today, December 25 2022',
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            NotificationTile(
              title: 'Place a bid Success!',
              subtitle:
                  'You have successfully bid on the item and it will be on the list',
              notificationType: NotificationType.SUCCESS,
            ),
            NotificationTile(
              title: 'You have cancelled NFT Listing!',
              subtitle: 'You can list NFT again whenever you want',
              notificationType: NotificationType.CANCEL,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: CustomText(
                'Today, December 24 2022',
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            NotificationTile(
              title: 'New Features Available',
              subtitle: 'Now you can split window between NFT and creator',
              notificationType: NotificationType.NEWFEATURE,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: CustomText(
                'Today, December 25 2022',
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            NotificationTile(
              title: 'Place a bid Success!',
              subtitle:
                  'You have successfully bid on the item and it will be on the list',
              notificationType: NotificationType.SUCCESS,
            ),
            NotificationTile(
              title: 'You have cancelled NFT Listing!',
              subtitle: 'You can list NFT again whenever you want',
              notificationType: NotificationType.CANCEL,
            ),
          ],
        ),
      ),
    );
  }
}

enum NotificationType { SUCCESS, CANCEL, NEWFEATURE }

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.notificationType,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final NotificationType notificationType;

  IconData icon() {
    if (notificationType == NotificationType.SUCCESS) {
      return Icons.check_circle;
    } else if (notificationType == NotificationType.CANCEL) {
      return Icons.cancel;
    } else {
      return Icons.notifications_rounded;
    }
  }

  List<Color> colors() {
    if (notificationType == NotificationType.SUCCESS) {
      return [
        Colors.black54,
        Colors.black,
      ];
    } else if (notificationType == NotificationType.CANCEL) {
      return [
        Colors.grey.shade400,
        Colors.grey.shade700,
      ];
    } else {
      return [
        Colors.grey.shade500,
        Colors.grey.shade900,
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.09),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors(),
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              icon(),
              color: Colors.white,
              size: 22,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
