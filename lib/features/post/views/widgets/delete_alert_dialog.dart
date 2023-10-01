import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moodtree/common/widgets/logo_icon.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/features/post/view_models/post_view_model.dart';
import 'package:moodtree/theme.dart';

class DeleteAlertDialog extends ConsumerStatefulWidget {
  final String postId;
  final String postDate;

  const DeleteAlertDialog({
    super.key,
    required this.postId,
    required this.postDate,
  });

  @override
  ConsumerState<DeleteAlertDialog> createState() => _DeleteAlertDialogState();
}

class _DeleteAlertDialogState extends ConsumerState<DeleteAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const LogoIcon(size: Sizes.size24),
              Gaps.h10,
              Text(
                widget.postDate,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w700,
                  color: ColorThemes.primary,
                ),
              ),
            ],
          ),
          Gaps.v10,
          const Text(
            "기록을 삭제하시겠습니까?",
            style: TextStyle(
              fontSize: Sizes.size16,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text(
            "취소",
            style: TextStyle(
              fontSize: Sizes.size16,
              color: ColorThemes.primary,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            ref.read(postProvider.notifier).deletePost(widget.postId);
            context.pop();
          },
          child: const Text(
            "삭제",
            style: TextStyle(
              fontSize: Sizes.size16,
              color: ColorThemes.primary,
            ),
          ),
        ),
      ],
    );
  }
}
