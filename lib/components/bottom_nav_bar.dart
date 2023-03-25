import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/add%20product/image_add.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/bottom nav bar screens/add product/video_add.dart';
import 'common_login_dialog_box.dart';

final box = GetStorage('UserStatus');

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.onNavIndexChanged,
    required this.deviceSize,
  }) : super(key: key);
  final ValueChanged<int> onNavIndexChanged;
  final Size deviceSize;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int idx = 0;

  List<Widget> bnbitems() {
    List<Widget> items = [];
    List<IconData> iconDataList = [
      Icons.home_rounded,
      Icons.shopping_bag_outlined,
      Icons.notifications_none_rounded,
      Icons.person_rounded,
    ];
    for (int i = 0; i < 4; i++) {
      items.add(
        BottomNavItem(
          icon: Icon(iconDataList[i]),
          isClicked: idx == i,
          onPressed: () {
            idx = i;
            setState(() {});
            widget.onNavIndexChanged(idx);
          },
          notifications: i == 4 ? 3 : null,
        ),
      );
      if (i == 1) {
        items.add(
          CustomFAB(
            icon: const Icon(
              Icons.add_rounded,
            ),
            deviceSize: widget.deviceSize,
          ),
        );
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.07)),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        // color: Colors.red
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bnbitems(),
      ),
    );
  }
}

class BottomNavItem extends StatefulWidget {
  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.isClicked,
    this.notifications,
    required this.onPressed,
  }) : super(key: key);
  final Icon icon;
  final bool isClicked;
  final int? notifications;
  final VoidCallback onPressed;

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  bool onClick = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick = true;
        widget.onPressed();
        setState(() {});
      },
      child: AnimatedOpacity(
        opacity: onClick ? 0.5 : 1,
        duration: const Duration(milliseconds: 100),
        onEnd: () {
          onClick = false;
          setState(() {});
        },
        child: Container(
          width: 50,
          height: 40,
          // padding: EdgeInsets.all(10),
          // margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.isClicked ? Colors.black : Colors.black12,
          ),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6),
                child: IconTheme(
                  data: IconThemeData(
                    color: (widget.isClicked) ? Colors.white : Colors.black,
                  ),
                  child: widget.icon,
                ),
              ),
              if (widget.notifications != null)
                Material(
                  color: Colors.red.shade800,
                  shape: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CustomText(
                      '${widget.notifications}',
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFAB extends StatefulWidget {
  const CustomFAB(
      {Key? key,
      required this.icon,
      required this.deviceSize})
      : super(key: key);
  final Icon icon;
  final Size deviceSize;

  @override
  State<CustomFAB> createState() => _CustomFABState();
}

class _CustomFABState extends State<CustomFAB> {
  bool onClick = false;
  OverlayEntry? entry;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    entry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              entry!.remove();
            },
            child: Container(
              color: Colors.black38,
              height: widget.deviceSize.height,
              width: widget.deviceSize.width,
            ),
          ),
          Positioned(
            right: 1,
            left: 1,
            bottom: size.height,
            child: buildOverlay(),
          ),
        ],
      ),
    );
    overlay.insert(entry!);
  }

  Widget buildOverlay() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  shape: const CircleBorder(),
                  child: IconButton(
                    padding: const EdgeInsets.all(20),
                    icon: const Icon(Icons.image_rounded, size: 30,),
                    onPressed: () {
                      entry!.remove();
                      Navigator.push(context, CustomPageRoute(child: const ImageAddPage()));

                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  shape: const CircleBorder(),
                  child: IconButton(
                    padding: const EdgeInsets.all(20),
                    icon: const Icon(Icons.videocam_rounded, size: 30,),
                    onPressed: () {
                      entry!.remove();
                      Navigator.push(context, CustomPageRoute(child: const VideoAddPage()));
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            shape: const StadiumBorder(),
            color: Colors.black54,
            child: TextButton(
              child: const Icon(
                Icons.close_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                entry!.remove();
              },
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!box.read('isLogin')) {
          showDialog(context: context, builder: (_) => const CommonLoginDialogBox());
          return;
        }
        onClick = true;
        WidgetsBinding.instance
            .addPostFrameCallback((timeStamp) => showOverlay());
        // widget.onPressed();
        setState(() {});
      },
      child: AnimatedOpacity(
        opacity: onClick ? 0.5 : 1,
        duration: const Duration(milliseconds: 100),
        onEnd: () {
          onClick = false;
          setState(() {});
        },
        child: Container(
          width: 50,
          height: 40,
          // padding: EdgeInsets.all(10),
          // margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black12,
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6),
            child: IconTheme(
              data: const IconThemeData(
                color: Colors.black,
              ),
              child: widget.icon,
            ),
          ),
        ),
      ),
    );
  }
}
