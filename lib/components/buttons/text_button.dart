import 'package:flutter/material.dart';

class CustomFilledButton extends StatefulWidget {
  const CustomFilledButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.height,
    this.width,
    this.padding,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final EdgeInsets? padding;

  @override
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
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
          padding: widget.padding,
          alignment:
              (widget.width == double.infinity) ? Alignment.center : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (widget.onPressed != null)
                ? Colors.black
                : Colors.black.withOpacity(0.5),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class CustomTextButton extends StatefulWidget {
  const CustomTextButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.height,
      this.width})
      : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
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
          alignment:
              (widget.width == double.infinity) ? Alignment.center : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class CustomOutlineButton extends StatefulWidget {
  const CustomOutlineButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.height,
    this.width,
    this.borderWidth,
    this.borderColor,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final double? borderWidth;
  final Color? borderColor;

  @override
  State<CustomOutlineButton> createState() => _CustomOutlineButtonState();
}

class _CustomOutlineButtonState extends State<CustomOutlineButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
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
          alignment:
              (widget.width == double.infinity) ? Alignment.center : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: widget.borderColor ?? const Color(0xff595757),
              width: widget.borderWidth ?? 2,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
