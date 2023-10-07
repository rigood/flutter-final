import 'package:flutter/material.dart';
import 'package:moodtree/features/post/models/emoji_model.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/features/post/views/post_screen/widgets/emoji_button.dart';

class EmojiSelectSection extends StatelessWidget {
  final String title;
  final String sectionName;
  final List<EmojiModel> emojiList;
  final List<EmojiModel> selectedEmojiList;
  final Function toggleEmoji;

  const EmojiSelectSection({
    super.key,
    required this.title,
    required this.sectionName,
    required this.emojiList,
    required this.selectedEmojiList,
    required this.toggleEmoji,
  });

  bool _getIsSelected(List<EmojiModel> selectedEmojiList, String label) {
    return selectedEmojiList
        .map((emoji) => emoji.label == label)
        .contains(true);
  }

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
                    emoji: item.emoji,
                    label: item.label,
                    isSelected: _getIsSelected(selectedEmojiList, item.label),
                    onTap: () => toggleEmoji(sectionName, item),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
