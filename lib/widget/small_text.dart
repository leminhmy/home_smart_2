import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    Key? key, required this.text, this.color = Colors.grey, this.fontWeight = FontWeight.normal,  this.fontSize = 16,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
    );
  }
}