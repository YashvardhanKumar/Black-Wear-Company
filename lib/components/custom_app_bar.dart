import 'package:bfm/components/buttons/icon_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leading,
    this.title,
    this.actions,
    this.isTransparent = false,
    this.onPressed,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final bool isTransparent;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        // height: 70,
        color: isTransparent ? Colors.transparent : Colors.white,
        // alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                (Navigator.canPop(context) && leading == null)
                    ? CustomOutlinedIconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    : ((leading != null) ? leading! : Container()),
                const SizedBox(
                  width: 15,
                ),
                if (title != null) title!
              ],
            ),
            Row(children: actions ?? [])
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}
