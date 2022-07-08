import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText({
    Key? key, required this.text, this.color = Colors.black, this.fontWeight = FontWeight.bold,  this.fontSize = 18,
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