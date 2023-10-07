import 'package:flutter/material.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/common/widgets/logo_icon.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LogoIcon(size: Sizes.size60),
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
