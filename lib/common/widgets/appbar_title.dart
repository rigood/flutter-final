import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/gaps.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Mood"),
        Gaps.h2,
        FaIcon(
          FontAwesomeIcons.leaf,
          color: ColorThemes.primary,
          size: 14,
        ),
        Gaps.h2,
        Text("Tree"),
      ],
    );
  }
}
