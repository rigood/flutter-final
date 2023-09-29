import 'package:flutter/material.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/features/post/views/widgets/today_feeling_emoji_button.dart';
import 'package:moodtree/theme.dart';

class TodayFeelingSelectSection extends StatelessWidget {
  final String title;
  final int todayFeelingIndex;
  final Function changeTodayFeelingIndex;

  const TodayFeelingSelectSection({
    super.key,
    required this.title,
    required this.todayFeelingIndex,
    required this.changeTodayFeelingIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorThemes.white,
        borderRadius: BorderRadius.circular(
          Sizes.size16,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w700,
                      color: ColorThemes.primary,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v10,
            Wrap(
              children: [
                TodayFeelingEmojiButton(
                  emoji: "😢",
                  label: "우울해요",
                  isSelected: todayFeelingIndex == 0,
                  onTap: () => changeTodayFeelingIndex(0),
                ),
                TodayFeelingEmojiButton(
                  emoji: "😣",
                  label: "짜증나요",
                  isSelected: todayFeelingIndex == 1,
                  onTap: () => changeTodayFeelingIndex(1),
                ),
                TodayFeelingEmojiButton(
                  emoji: "😔",
                  label: "피곤해요",
                  isSelected: todayFeelingIndex == 2,
                  onTap: () => changeTodayFeelingIndex(2),
                ),
                TodayFeelingEmojiButton(
                  emoji: "🙂",
                  label: "괜찮아요",
                  isSelected: todayFeelingIndex == 3,
                  onTap: () => changeTodayFeelingIndex(3),
                ),
                TodayFeelingEmojiButton(
                  emoji: "😊",
                  label: "기분좋아",
                  isSelected: todayFeelingIndex == 4,
                  onTap: () => changeTodayFeelingIndex(4),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
