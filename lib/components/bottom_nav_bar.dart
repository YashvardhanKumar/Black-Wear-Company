// import 'package:bfm/components/custom_text.dart';
// import 'package:flutter/material.dart';
//
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({
//     Key? key, required this.onNavIndexChanged,
//   }) : super(key: key);
//   final ValueChanged<int> onNavIndexChanged;
//
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int idx = 0;
//
//   List<Widget> bnbitems() {
//     List<Widget> items = [];
//     List<IconData> iconDataList = [
//       Icons.home_rounded,
//       Icons.shopping_bag_outlined,
//       Icons.stacked_line_chart_rounded,
//       Icons.person_rounded,
//       Icons.shopping_cart_rounded
//     ];
//     for (int i = 0; i < 5; i++) {
//       items.add(
//         BottomNavItem(
//           icon: Icon(iconDataList[i]),
//           isClicked: idx == i,
//           onPressed: () {
//             idx = i;
//             setState(() {});
//             widget.onNavIndexChanged(idx);
//           },
//         ),
//       );
//     }
//     return items;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 90,
//       width: double.infinity,
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.black.withOpacity(0.07)),
//         borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//         // color: Colors.red
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: bnbitems(),
//       ),
//     );
//   }
// }
//
// class BottomNavItem extends StatefulWidget {
//   const BottomNavItem({
//     Key? key,
//     required this.icon,
//     required this.isClicked,
//     this.borderRadius,
//     this.notifications,
//     required this.onPressed,
//   }) : super(key: key);
//   final Icon icon;
//   final bool isClicked;
//   final BorderRadius? borderRadius;
//   final int? notifications;
//   final VoidCallback onPressed;
//
//   @override
//   State<BottomNavItem> createState() => _BottomNavItemState();
// }
//
// class _BottomNavItemState extends State<BottomNavItem> {
//   bool onClick = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onClick = true;
//         widget.onPressed();
//         setState(() {});
//       },
//       child: AnimatedOpacity(
//         opacity: onClick ? 0.5 : 1,
//         duration: Duration(milliseconds: 100),
//         onEnd: () {
//           onClick = false;
//           setState(() {});
//         },
//         child: Container(
//           width: 50,
//           height: 40,
//           // padding: EdgeInsets.all(10),
//           // margin: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
//             color: widget.isClicked ? Colors.black : Colors.black12,
//           ),
//           alignment: Alignment.center,
//           child: Container(
//             // height: 16,
//             // width: 16,
//             child: Stack(
//               alignment: Alignment.topRight,
//               children: [
//                 Padding(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6),
//                   child: IconTheme(
//                     data: IconThemeData(
//                       color: (widget.isClicked) ? Colors.white : Colors.black,
//                     ),
//                     child: widget.icon,
//                   ),
//                 ),
//                 if (widget.notifications != null)
//                   Material(
//                     color: Colors.red.shade800,
//                     shape: CircleBorder(),
//                     child: Padding(
//                       padding: const EdgeInsets.all(3.0),
//                       child: CustomText(
//                         '${widget.notifications}',
//                         fontSize: 10,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bfm/components/custom_page_route.dart';
import 'package:bfm/components/custom_text.dart';
import 'package:bfm/routes/bottom%20nav%20bar%20screens/add%20product/image_add.dart';
import 'package:flutter/material.dart';

import '../routes/bottom nav bar screens/add product/video_add.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.onNavIndexChanged,
    required this.onPlusClicked,
    required this.deviceSize,
  }) : super(key: key);
  final ValueChanged<int> onNavIndexChanged;
  final VoidCallback onPlusClicked;
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
            onPressed: widget.onPlusClicked,
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
      required this.onPressed,
      required this.deviceSize})
      : super(key: key);
  final Icon icon;
  final VoidCallback onPressed;
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
    final offset = renderBox.localToGlobal(Offset.zero);
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
                  shape: CircleBorder(),
                  child: IconButton(
                    padding: EdgeInsets.all(20),
                    icon: Icon(Icons.image_rounded, size: 30,),
                    onPressed: () {
                      entry!.remove();
                      Navigator.push(context, CustomPageRoute(child: ImageAddPage()));

                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  shape: CircleBorder(),
                  child: IconButton(
                    padding: EdgeInsets.all(20),
                    icon: Icon(Icons.videocam_rounded, size: 30,),
                    onPressed: () {
                      entry!.remove();
                      Navigator.push(context, CustomPageRoute(child: VideoAddPage()));
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Material(
            shape: StadiumBorder(),
            color: Colors.black54,
            child: TextButton(
              child: Icon(
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
          child: Container(
            // height: 16,
            // width: 16,
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
      ),
    );
  }
}
