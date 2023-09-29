import 'dart:async';
import 'package:moodtree/features/post/models/post_model.dart';
import 'package:moodtree/features/post/repos/posts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostViewModel extends FamilyAsyncNotifier<PostModel, String> {
  late final PostsRepository _postsRepository;
  late final String _docId;

  Future<PostModel> fetchPostByDocId() async {
    print("PostViewModel / fetchPostByDocId 시작");
    final post = await _postsRepository.findPost(_docId);
    return post;
  }

  @override
  FutureOr<PostModel> build(String arg) async {
    print("PostViewModel / build 시작");
    _postsRepository = ref.read(postsRepository);
    _docId = arg;

    return fetchPostByDocId();
  }

  Future<void> refreshPost() async {
    state = const AsyncLoading();
    state = AsyncValue.data(await fetchPostByDocId());
  }
}

final postProvider =
    AsyncNotifierProvider.family<PostViewModel, PostModel, String>(
  () => PostViewModel(),
);
