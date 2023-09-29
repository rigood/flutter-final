import 'package:flutter/material.dart';
import 'package:moodtree/common/widgets/loading_indicator.dart';
import 'package:moodtree/features/post/views/widgets/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodtree/features/auth/repos/auth_repo.dart';
import 'package:moodtree/features/post/view_models/post_view_model.dart';
import 'package:moodtree/theme.dart';

class PostScreen extends ConsumerStatefulWidget {
  final String date;

  const PostScreen({
    super.key,
    required this.date,
  });

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final uid = ref.read(authRepo).user!.uid;
    final docId = "${uid}_${widget.date}";

    final postValue = ref.watch(postProvider(docId));

    print(
        "PostScreen / build 시작 / uid: $uid, date: ${widget.date}, docId: $docId, postValue: $postValue");

    return postValue.when(
      loading: () => Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorThemes.appBackground,
        child: const Center(
          child: LoadingIndicator(),
        ),
      ),
      error: (error, stackTrace) => const Center(
        child: Text(
          "에러 발생",
          style: TextStyle(
            color: ColorThemes.primary,
          ),
        ),
      ),
      data: (post) => Post(
        post: post,
        docId: docId,
        currentDate: widget.date,
      ),
    );
  }
}
