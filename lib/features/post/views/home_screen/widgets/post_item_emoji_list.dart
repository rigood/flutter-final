import 'package:flutter/material.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/features/post/models/emoji_model.dart';
import 'package:moodtree/theme.dart';

class PostItemEmojiList extends StatelessWidget {
  final List<EmojiModel> emojiList;

  const PostItemEmojiList({
    super.key,
    required this.emojiList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: Sizes.size48,
          child: Center(
            child: Text(
              "요약",
              style: TextStyle(
                fontSize: Sizes.size12,
                color: ColorThemes.gray,
              ),
            ),
          ),
        ),
        Gaps.h10,
        Flexible(
          child: Wrap(
            direction: Axis.horizontal,
            spacing: Sizes.size2,
            runSpacing: Sizes.size4,
            children: [
              for (final emoji in emojiList)
                Text(
                  emoji.emoji,
                  style: const TextStyle(
                    fontSize: Sizes.size16,
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
