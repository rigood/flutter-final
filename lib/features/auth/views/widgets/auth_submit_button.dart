import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';

class AuthSubmitButton extends ConsumerWidget {
  final String text;
  final bool isActive;
  final void Function() onTap;

  const AuthSubmitButton({
    super.key,
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size14,
          ),
          decoration: BoxDecoration(
            color: isActive ? ColorThemes.primary : ColorThemes.primarygray,
            borderRadius: BorderRadius.circular(Sizes.size5),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: Sizes.size14,
              color: ColorThemes.white,
            ),
          ),
        ),
      ),
    );
  }
}
