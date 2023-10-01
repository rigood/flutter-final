import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:moodtree/features/auth/repos/auth_repository.dart';
import 'package:moodtree/features/post/models/post_model.dart';
import 'package:moodtree/features/post/repos/photos_repository.dart';
import 'package:moodtree/features/post/repos/posts_repository.dart';

class PostViewModel extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> submitPost({
    String? id,
    required DateTime date,
    required int todayFeelingIndex,
    required List<String> weather,
    required List<String> meals,
    required List<String> food,
    required List<String> people,
    required List<String> outing,
    required List<String> activities,
    required List<String> health,
    required List<String> photoUrlList,
    required String diary,
  }) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser!;
    final postId = id ?? const Uuid().v4();

    state = const AsyncLoading().copyWithPrevious(state);

    final photosRepository = ref.read(photosRepositoryProvider);
    final postsRepository = ref.read(postsRepositoryProvider);

    state = await AsyncValue.guard(() async {
      final uploadedPhotoUrlList = await photosRepository.uploadPhotoFiles(
        photoUrlList: photoUrlList,
        uid: currentUser.uid,
        postId: postId,
      );

      await postsRepository.submitPost(
        uid: currentUser.uid,
        post: PostModel(
          id: postId,
          date: date,
          todayFeelingIndex: todayFeelingIndex,
          weather: weather,
          meals: meals,
          food: food,
          people: people,
          outing: outing,
          activities: activities,
          health: health,
          photoUrlList: uploadedPhotoUrlList,
          diary: diary,
        ),
      );
    });

    return state.hasError == false;
  }
}

final postProvider = AsyncNotifierProvider<PostViewModel, void>(
  () => PostViewModel(),
);
