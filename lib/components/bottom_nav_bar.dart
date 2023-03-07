import 'package:bfm/components/custom_text.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key, required this.onNavIndexChanged,
  }) : super(key: key);
  final ValueChanged<int> onNavIndexChanged;

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
      Icons.stacked_line_chart_rounded,
      Icons.person_rounded,
      Icons.shopping_cart_rounded
    ];
    for (int i = 0; i < 5; i++) {
      items.add(
        BottomNavItem(
          icon: Icon(iconDataList[i]),
          isClicked: idx == i,
          onPressed: () {
            idx = i;
            setState(() {});
            widget.onNavIndexChanged(idx);
          },
        ),
      );
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
    this.borderRadius,
    this.notifications,
    required this.onPressed,
  }) : super(key: key);
  final Icon icon;
  final bool isClicked;
  final BorderRadius? borderRadius;
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
        duration: Duration(milliseconds: 100),
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
            borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
            color: widget.isClicked ? Colors.black : Colors.black12,
          ),
          alignment: Alignment.center,
          child: Container(
            // height: 16,
            // width: 16,
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
                    shape: CircleBorder(),
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
      ),
    );
  }
}
