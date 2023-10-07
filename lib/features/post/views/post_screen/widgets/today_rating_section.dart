import 'package:flutter/material.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/features/post/views/post_screen/widgets/today_rating_button.dart';

class TodayRatingSection extends StatelessWidget {
  final String title;
  final int todayRatingIndex;
  final Function changeTodayRatingIndex;

  const TodayRatingSection({
    super.key,
    required this.title,
    required this.todayRatingIndex,
    required this.changeTodayRatingIndex,
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
                TodayRatingButton(
                  color: Colors.red,
                  label: "매우불만",
                  isSelected: todayRatingIndex == 0,
                  onTap: () => changeTodayRatingIndex(0),
                ),
                TodayRatingButton(
                  color: Colors.brown,
                  label: "불만",
                  isSelected: todayRatingIndex == 1,
                  onTap: () => changeTodayRatingIndex(1),
                ),
                TodayRatingButton(
                  color: const Color(0xffFBC02D),
                  label: "보통",
                  isSelected: todayRatingIndex == 2,
                  onTap: () => changeTodayRatingIndex(2),
                ),
                TodayRatingButton(
                  color: Colors.lightGreen,
                  label: "만족",
                  isSelected: todayRatingIndex == 3,
                  onTap: () => changeTodayRatingIndex(3),
                ),
                TodayRatingButton(
                  color: Colors.green,
                  label: "매우만족",
                  isSelected: todayRatingIndex == 4,
                  onTap: () => changeTodayRatingIndex(4),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
