import 'package:flutter/material.dart';
import 'package:moodtree/constants/sizes.dart';

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
      ),
    );
  }
}
