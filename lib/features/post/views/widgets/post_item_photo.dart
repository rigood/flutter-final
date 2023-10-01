import 'package:flutter/material.dart';
import 'package:moodtree/features/post/views/widgets/photo_frame.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';

class PostItemPhoto extends StatelessWidget {
  final List<String> photoUrlList;

  const PostItemPhoto({
    super.key,
    required this.photoUrlList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: Sizes.size48,
          child: Center(
            child: Text(
              "사진",
              style: TextStyle(
                fontSize: Sizes.size12,
                color: ColorThemes.gray,
              ),
            ),
          ),
        ),
        Gaps.h10,
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var photoUrl in photoUrlList)
                  PhotoFrame(
                    photoUrl: photoUrl,
                    readOnly: true,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
