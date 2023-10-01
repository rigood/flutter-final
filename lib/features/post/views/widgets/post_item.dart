import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:moodtree/common/widgets/logo_icon.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/features/post/models/post_model.dart';
import 'package:moodtree/features/post/views/widgets/delete_alert_dialog.dart';
import 'package:moodtree/features/post/views/widgets/post_item_diary.dart';
import 'package:moodtree/features/post/views/widgets/post_item_emoji_list.dart';
import 'package:moodtree/features/post/views/widgets/post_item_photo.dart';
import 'package:moodtree/router.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/utils.dart';

class PostItem extends ConsumerStatefulWidget {
  final PostModel post;

  const PostItem({
    super.key,
    required this.post,
  });

  @override
  ConsumerState<PostItem> createState() => _PostItemState();
}

class _PostItemState extends ConsumerState<PostItem> {
  late final post = widget.post;
  late final postDate =
      DateFormat("M월 d일 (E) aa h:mm", 'ko').format(post.date).toString();

  void _showAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return DeleteAlertDialog(
          postId: post.id,
          postDate: postDate,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final allEmojiList = [
      ...post.feelings,
      ...post.weather,
      ...post.meals,
      ...post.food,
      ...post.people,
      ...post.outing,
      ...post.activities,
      ...post.health
    ];

    return GestureDetector(
      onLongPress: _showAlertDialog,
      onTap: () => context.pushNamed(
        AppRoute.editPost.name,
        pathParameters: {'id': post.id},
        extra: post,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: Sizes.size16,
          right: Sizes.size20,
          top: Sizes.size16,
          bottom: Sizes.size12,
        ),
        decoration: BoxDecoration(
          color: getColorByIndex(post.todayRatingIndex).withOpacity(0.1),
          borderRadius: BorderRadius.circular(
            Sizes.size16,
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: Sizes.size48,
                height: Sizes.size52,
                decoration: BoxDecoration(
                  color: ColorThemes.appBackground,
                  borderRadius: BorderRadius.circular(
                    Sizes.size16,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat("d").format(post.date),
                      style: const TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w700,
                        color: ColorThemes.darkgray,
                      ),
                    ),
                    Text(
                      DateFormat("E", 'ko').format(post.date),
                      style: const TextStyle(
                        fontSize: Sizes.size10,
                        color: ColorThemes.darkgray,
                      ),
                    )
                  ],
                ),
              ),
              Gaps.h10,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getColorLabelByIndex(post.todayRatingIndex),
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w700,
                            color: getColorByIndex(post.todayRatingIndex),
                          ),
                        ),
                        Gaps.v2,
                        Text(
                          DateFormat("aa h:mm", 'ko').format(post.date),
                          style: const TextStyle(
                            fontSize: Sizes.size11,
                            color: ColorThemes.gray,
                          ),
                        ),
                      ],
                    ),
                    Gaps.h20,
                    LogoIcon(
                      icon: FontAwesomeIcons.pagelines,
                      size: Sizes.size36,
                      color: getColorByIndex(post.todayRatingIndex),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (allEmojiList.isNotEmpty) Gaps.v10,
          if (allEmojiList.isNotEmpty)
            PostItemEmojiList(
              emojiList: allEmojiList,
            ),
          if (post.photoUrlList.isNotEmpty) Gaps.v8,
          if (post.photoUrlList.isNotEmpty)
            PostItemPhoto(
              photoUrlList: post.photoUrlList,
            ),
          if (post.diary.isNotEmpty) Gaps.v8,
          if (post.diary.isNotEmpty)
            PostItemDiary(
              diary: post.diary,
            ),
        ]),
      ),
    );
  }
}
