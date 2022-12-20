// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class GestureButton extends StatelessWidget {
  var onTap;
  var padding;
  String text;
  Color textColor;
  Color boxColor;
  double fontSize;
  bool isBold;

  GestureButton({
    super.key,
    required this.onTap, // onTap
    required this.text, // Text
    this.textColor = Colors.white, // Text Color
    this.boxColor = Colors.black, // BoxColor
    this.fontSize = 18, // FontSize
    this.padding = const EdgeInsets.all(18), // Padding
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
