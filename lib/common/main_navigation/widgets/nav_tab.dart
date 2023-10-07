import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';

class NavTab extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final void Function() onTap;

  const NavTab({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                icon,
                size: Sizes.size20,
                color: isSelected ? ColorThemes.primary : ColorThemes.silver,
              ),
              Gaps.v8,
              Text(
                label,
                style: TextStyle(
                  fontSize: Sizes.size10,
                  color: isSelected ? ColorThemes.primary : ColorThemes.silver,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
