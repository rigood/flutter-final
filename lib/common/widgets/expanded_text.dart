import 'package:flutter/material.dart';

class ExpandedText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const ExpandedText({
    super.key,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
