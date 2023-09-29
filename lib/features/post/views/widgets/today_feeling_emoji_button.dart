import 'package:flutter/material.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';

class TodayFeelingEmojiButton extends StatelessWidget {
  final String emoji;
  final String label;
  final bool isSelected;
  final Function onTap;

  const TodayFeelingEmojiButton({
    super.key,
    required this.emoji,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? ColorThemes.primarygray : Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size4,
            vertical: Sizes.size8,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: const TextStyle(
                fontSize: Sizes.size32,
              ),
            ),
            Gaps.v8,
            Text(
              label,
              style: TextStyle(
                fontSize: Sizes.size12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                color: isSelected ? ColorThemes.primary : ColorThemes.darkgray,
              ),
            ),
          ],
        ));
  }
}
