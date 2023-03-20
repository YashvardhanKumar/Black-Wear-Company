import 'package:bfm/components/buttons/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leading,
    this.title,
    this.actions,
    this.isTransparent = false,
    this.onPressed,
    this.systemOverlayStyle,
    this.padding = true,
    this.isLeadingPresent = true,
    this.backgroundColor,
    this.bottom, this.toolbarHeight,
  }) : super(key: key);
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final bool isTransparent, padding;
  final VoidCallback? onPressed;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool isLeadingPresent;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;

  @override
  Widget build(BuildContext context) {
    if (systemOverlayStyle != null) {
      SystemChrome.setSystemUIOverlayStyle(systemOverlayStyle!);
    } else {
      // SystemChrome.restoreSystemUIOverlays();
    }
    return AppBar(
      toolbarHeight: toolbarHeight ?? 70,
      titleSpacing: 0,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: isTransparent
          ? Colors.transparent
          : (backgroundColor ?? Colors.white),
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: systemOverlayStyle,
      leading: Container(),
      leadingWidth: 0,
      bottom: bottom,
      title: Container(
        // margin: EdgeInsets.only(top: 24),
        padding: EdgeInsets.symmetric(
            horizontal: (padding ? 20 : 0), vertical: (padding ? 10 : 0)),
        // height: 70,
        // color: isTransparent ? Colors.transparent : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                (Navigator.canPop(context) &&
                        leading == null &&
                        isLeadingPresent)
                    ? Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: CustomOutlinedIconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 18,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    : ((leading != null)
                        ? Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: leading!,
                          )
                        : Container()),
                if (title != null)
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width -
                            (padding ? 40 : 0)),
                    child: title!,
                  )
              ],
            ),
            Row(children: actions ?? [])
          ],
        ),
      ),
      // actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}
