import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';

class CustomAlertDialog extends StatelessWidget {
  final String text;
  final String actionButtonText;

  const CustomAlertDialog({
    super.key,
    required this.text,
    this.actionButtonText = "확인",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: Sizes.size16,
          color: ColorThemes.black,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: ColorThemes.primary,
              borderRadius: BorderRadius.circular(Sizes.size5),
            ),
            child: Text(
              actionButtonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: Sizes.size14,
                color: ColorThemes.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
