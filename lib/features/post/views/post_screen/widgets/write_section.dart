import 'package:flutter/material.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';

class WriteSection extends StatelessWidget {
  final String title;
  final String diary;
  final Function changeDiary;

  const WriteSection({
    super.key,
    required this.title,
    required this.diary,
    required this.changeDiary,
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
          horizontal: Sizes.size20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
            TextFormField(
              initialValue: diary,
              onChanged: (value) {
                changeDiary(value);
              },
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              scrollPadding: const EdgeInsets.only(
                bottom: 120,
              ),
              style: const TextStyle(
                fontSize: Sizes.size14,
                height: 1.5,
              ),
              decoration: const InputDecoration(
                hintText: "오늘 하루 어땠나요?",
                hintStyle: TextStyle(
                  fontSize: Sizes.size12,
                  color: ColorThemes.silver,
                  fontStyle: FontStyle.italic,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}
