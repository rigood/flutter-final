import 'package:flutter/widgets.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/common/widgets/logo_icon.dart';

class NoPost extends StatelessWidget {
  const NoPost({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoIcon(
            size: Sizes.size36,
          ),
          Gaps.v20,
          Text(
            "Mood Tree가 비어 있습니다. \n 하루를 기록하면, 새로운 잎이 자라나요!",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.5,
              fontSize: Sizes.size16,
              color: ColorThemes.darkgray,
            ),
          )
        ],
      ),
    );
  }
}
