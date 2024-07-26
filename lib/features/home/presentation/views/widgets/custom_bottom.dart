import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final TextStyle? textStyle;
  final BorderRadius borderRadius;
  const CustomBottom(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.borderRadius,
      required this.text,
      this.textStyle});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
        ),
      ),
    );
  }
}
