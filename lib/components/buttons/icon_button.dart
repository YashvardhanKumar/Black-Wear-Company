import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final Icon icon;
  final VoidCallback? onPressed;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool onClick = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick = true;
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
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
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFE4EBFD),
          ),
          child: IconTheme(
            data: const IconThemeData(
              color: Colors.black,
            ),
            child: widget.icon,
          ),
        ),
      ),
    );
  }
}

class CustomOutlinedIconButton extends StatefulWidget {
  const CustomOutlinedIconButton({
    Key? key,
    required this.icon,
    required this.onPressed, this.color,
  }) : super(key: key);
  final Icon icon;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  State<CustomOutlinedIconButton> createState() => _CustomOutlinedIconButtonState();
}

class _CustomOutlinedIconButtonState extends State<CustomOutlinedIconButton> {
  bool onClick = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick = true;
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
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
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: widget.color ?? Color(0xFFD8DADC))
          ),
          child: IconTheme(
            data: IconThemeData(
              color: Colors.black,
            ),
            child: widget.icon,
          ),
        ),
      ),
    );
  }
}