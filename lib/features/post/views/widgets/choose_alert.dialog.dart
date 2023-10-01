import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/common/widgets/logo_icon.dart';

class ChooseAlertDialog extends StatefulWidget {
  const ChooseAlertDialog({super.key});

  @override
  State<ChooseAlertDialog> createState() => _ChooseAlertDialogState();
}

class _ChooseAlertDialogState extends State<ChooseAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text(
        "오늘 하루 만족도를 선택해주세요.",
        textAlign: TextAlign.center,
        style: TextStyle(
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
            child: const Text(
              "확인",
              textAlign: TextAlign.center,
              style: TextStyle(
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
