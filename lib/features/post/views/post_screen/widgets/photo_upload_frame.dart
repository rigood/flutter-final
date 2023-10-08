import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';

class PhotoUploadFrame extends StatelessWidget {
  final Function onTap;
  final int photoCount;

  const PhotoUploadFrame({
    super.key,
    required this.onTap,
    required this.photoCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: Sizes.size60,
        height: Sizes.size60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Sizes.size5,
          ),
          border: Border.all(
            color: ColorThemes.primary.withOpacity(0.1),
          ),
          color: ColorThemes.appBackground,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.solidImage,
              size: Sizes.size16,
              color: ColorThemes.primary,
            ),
            Gaps.v4,
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: Sizes.size10,
                  color: ColorThemes.primary,
                ),
                children: [
                  TextSpan(
                    text: "$photoCount",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ColorThemes.red,
                    ),
                  ),
                  const TextSpan(
                    text: "/10",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
