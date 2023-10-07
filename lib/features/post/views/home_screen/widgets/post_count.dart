import 'package:flutter/material.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';

class PostCount extends StatelessWidget {
  final int count;

  const PostCount({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.size4,
        bottom: Sizes.size12,
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: Sizes.size12,
            color: ColorThemes.darkgray,
          ),
          children: [
            const TextSpan(text: "🌱 "),
            TextSpan(
              text: "$count개의 잎",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const TextSpan(
              text: "이 자라고 있어요!",
            ),
          ],
        ),
      ),
    );
  }
}
