import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';

class PhotoUploadFrame extends StatelessWidget {
  final Function onTap;

  const PhotoUploadFrame({
    super.key,
    required this.onTap,
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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.solidImage,
              size: Sizes.size16,
              color: ColorThemes.primary,
            ),
          ],
        ),
      ),
    );
  }
}
