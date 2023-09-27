import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_final/theme.dart';
import 'package:flutter_final/constants/sizes.dart';

class AuthSubmitButton extends ConsumerWidget {
  final String text;
  final void Function() onTap;
  final bool isActive;
  final double? fontSize;

  const AuthSubmitButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.isActive,
    this.fontSize = Sizes.size14,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: fontSize! / 2,
            horizontal: fontSize!,
          ),
          decoration: BoxDecoration(
            color: isActive ? ColorThemes.primary : ColorThemes.primarygray,
            borderRadius: BorderRadius.circular(Sizes.size5),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              color: ColorThemes.white,
            ),
          ),
        ),
      ),
    );
  }
}
