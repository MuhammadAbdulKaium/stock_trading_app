import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Color backgroundColor;
  final Color forgroundColor;
  final double borderRadius;
  final double fontSize;
  final BorderSide side;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  // final String text;
  final Widget child;
  final double? elevation;
  const CommonButton(
    {Key? key,
    this.backgroundColor = const Color(0xFF5D5FEF),
    this.forgroundColor = const Color.fromARGB(255, 255, 255, 255),
    this.borderRadius = 9,
    this.fontSize = 13,
    this.side = const BorderSide(color: Colors.transparent),
    this.padding = const EdgeInsets.only(left: 12, right: 12),
    required this.onPressed,
    // required this.text,
    required this.child,
    this.elevation,
    })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        side: side,
        backgroundColor: backgroundColor,
        foregroundColor: forgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        textStyle: TextStyle(fontSize: fontSize),
        elevation: elevation ?? 1,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}