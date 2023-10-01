import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodtree/common/widgets/logo_icon.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';

class TodayRatingButton extends StatelessWidget {
  final Color color;
  final String label;
  final bool isSelected;
  final Function onTap;

  const TodayRatingButton({
    super.key,
    required this.color,
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
              isSelected ? color.withOpacity(0.2) : Colors.transparent,
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
            LogoIcon(
              icon: FontAwesomeIcons.envira,
              size: Sizes.size32,
              color: color,
            ),
            Gaps.v8,
            Text(
              label,
              style: TextStyle(
                fontSize: Sizes.size12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                color: isSelected ? color : ColorThemes.darkgray,
              ),
            ),
          ],
        ));
  }
}
