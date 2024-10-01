import 'package:flutter/material.dart';

//Custom Text
class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign align;
  final int maxLines;
  final TextOverflow overFlow;
  CustomText({
    required this.text,
    required this.style,
    this.align = TextAlign.start,
    this.maxLines = 1,
    this.overFlow = TextOverflow.ellipsis
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overFlow,
    );
  }
}