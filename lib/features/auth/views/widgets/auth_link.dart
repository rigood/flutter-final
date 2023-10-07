import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';

class AuthLink extends ConsumerWidget {
  final String text;
  final String routeName;
  final Function invalidateProvider;

  const AuthLink({
    super.key,
    required this.text,
    required this.routeName,
    required this.invalidateProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size8,
      ),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(routeName);
          invalidateProvider();
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
