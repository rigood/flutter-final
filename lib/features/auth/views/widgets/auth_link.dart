import 'package:flutter/material.dart';
import 'package:flutter_final/constants/gaps.dart';
import 'package:flutter_final/constants/sizes.dart';
import 'package:flutter_final/theme.dart';
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
        vertical: Sizes.size20,
      ),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: ColorThemes.gray,
            ),
          ),
          Gaps.h10,
          GestureDetector(
            onTap: () {
              context.goNamed(routeName);
            },
            child: Text(
              text,
              style: const TextStyle(
                fontSize: Sizes.size12,
                color: ColorThemes.gray,
              ),
            ),
          ),
          Gaps.h10,
          const Expanded(
            child: Divider(
              color: ColorThemes.gray,
            ),
          ),
        ],
      ),
    );
  }
}
