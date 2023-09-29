import 'package:flutter/material.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/theme.dart';
import 'package:go_router/go_router.dart';

class AuthLink extends StatelessWidget {
  final String text;
  final String routeName;

  const AuthLink({
    super.key,
    required this.text,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size8,
      ),
      child: GestureDetector(
        onTap: () {
          context.goNamed(routeName);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size12,
            horizontal: Sizes.size12,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: Sizes.size12,
              color: ColorThemes.gray,
            ),
          ),
        ),
      ),
    );
  }
}
