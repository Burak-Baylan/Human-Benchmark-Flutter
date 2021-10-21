import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.primary = Colors.white,
    this.borderSideColor = Colors.white,
    this.borderSideWidth = 0,
    this.elevation = 0,
    this.borderRadius = 0,
    this.size = const Size(50, 50),
  }) : super(key: key);

  Color primary;
  Color borderSideColor;
  double borderSideWidth;
  double elevation;
  double borderRadius;
  Function onPressed;
  Widget? child;
  Size size;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: widget.size,
        primary: widget.primary,
        side: BorderSide(color: widget.borderSideColor, width: widget.borderSideWidth),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
        ),
      ),
      onPressed: () => widget.onPressed(),
      child: widget.child,
    );
  }
}
