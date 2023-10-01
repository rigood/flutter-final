import 'package:flutter/material.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';

class PostItemDiary extends StatelessWidget {
  final String diary;
  const PostItemDiary({
    super.key,
    required this.diary,
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
              "일기",
              style: TextStyle(
                fontSize: Sizes.size12,
                color: ColorThemes.gray,
              ),
            ),
          ),
        ),
        Gaps.h10,
        Text(
          diary,
          style: const TextStyle(
            fontSize: Sizes.size12,
            color: ColorThemes.darkgray,
          ),
        )
      ],
    );
  }
}
