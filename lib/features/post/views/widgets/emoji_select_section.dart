import 'package:flutter/material.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/features/post/views/widgets/emoji_button.dart';
import 'package:moodtree/theme.dart';

class EmojiSelectSection extends StatelessWidget {
  final String title;
  final String sectionName;
  final List<String> selectedEmojiLabels;
  final List<Map<String, dynamic>> emojiList;
  final Function toggleEmoji;

  const EmojiSelectSection({
    super.key,
    required this.title,
    required this.sectionName,
    required this.selectedEmojiLabels,
    required this.emojiList,
    required this.toggleEmoji,
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
                horizontal: Sizes.size20,
              ),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w700,
                      color: ColorThemes.primary,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v10,
            Wrap(
              spacing: Sizes.size10,
              runSpacing: Sizes.size8,
              children: [
                for (var item in emojiList)
                  EmojiButton(
                    emoji: item["emoji"],
                    label: item["label"],
                    isSelected: selectedEmojiLabels.contains(item["label"]),
                    onTap: () => toggleEmoji(sectionName, item["label"]),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
