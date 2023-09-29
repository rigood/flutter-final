import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          FontAwesomeIcons.leaf,
          size: Sizes.size60,
          color: ColorThemes.primary,
        ),
        Gaps.v20,
        SizedBox(
          width: Sizes.size96,
          child: LinearProgressIndicator(
            backgroundColor: ColorThemes.primarygray,
            color: ColorThemes.primary,
          ),
        )
      ],
    );
  }
}
