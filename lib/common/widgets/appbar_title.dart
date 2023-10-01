import 'package:flutter/material.dart';
import 'package:moodtree/common/widgets/logo_icon.dart';
import 'package:moodtree/constants/sizes.dart';
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
        LogoIcon(size: Sizes.size14),
        Gaps.h2,
        Text("Tree"),
      ],
    );
  }
}
