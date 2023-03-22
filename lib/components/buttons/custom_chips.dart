// import 'package:bfm/components/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../custom_text.dart';

class CustomChips extends StatefulWidget {
  const CustomChips({
    Key? key,
    required this.onPressed,
    this.height,
    this.width,
    this.borderWidth,
    this.borderColor,
    required this.selected,
    required this.text,
    this.icon, this.sizeOfWidgetChanged,
  }) : super(key: key);
  final String text;
  final Icon? icon;
  final ValueChanged<bool>? onPressed;
  final ValueChanged<Size>? sizeOfWidgetChanged;
  final double? height;
  final double? width;
  final double? borderWidth;
  final Color? borderColor;
  final bool selected;

  @override
  State<CustomChips> createState() => CustomChipsState();
}

class CustomChipsState extends State<CustomChips> {
  bool isPressed = false;
  Size size = Size.zero;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          if (widget.onPressed != null) {
            widget.onPressed!(widget.selected);
          }
          isPressed = true;
          setState(() {});
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: isPressed ? 0.5 : 1,
          onEnd: () {
            isPressed = false;
            setState(() {});
          },
          child: Container(
            height: widget.height,
            width: widget.width,
            alignment: Alignment.center,
            // (widget.width == double.infinity) ? Alignment.center : null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: widget.selected ? Colors.black : Colors.transparent,
              border: Border.all(
                color: widget.borderColor ?? Colors.black,
                width: widget.borderWidth ?? 2,
              ),
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null)
                    IconTheme(
                      data: IconThemeData(
                        color: widget.selected ? Colors.white : Colors.black,
                      ),
                      child: widget.icon!,
                    ),
                  if (widget.icon != null)
                    const SizedBox(
                      width: 12,
                    ),
                  CustomText(
                    widget.text,
                    color: widget.selected ? Colors.white : Colors.black,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    // fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            // widget.child,
          ),
        ),
      ),
    );
  }
}

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();
    Size newSize = child!.size;
    if (oldSize == newSize) return;
    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

  class MeasureSize extends SingleChildRenderObjectWidget {
    final OnWidgetSizeChange onChange;

    const MeasureSize({
      Key? key,
      required this.onChange,
      required Widget child,
    }) : super(key: key, child: child);

    @override
    RenderObject createRenderObject(BuildContext context) {
      return MeasureSizeRenderObject(onChange);
    }

    @override
    void updateRenderObject(BuildContext context,
        covariant MeasureSizeRenderObject renderObject) {
      renderObject.onChange = onChange;
    }
  }