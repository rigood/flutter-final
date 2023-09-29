import 'package:flutter/material.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/theme.dart';

class AuthTitle extends StatelessWidget {
  final String text;

  const AuthTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: Sizes.size24,
        fontWeight: FontWeight.w700,
        color: ColorThemes.black,
      ),
    );
  }
}
