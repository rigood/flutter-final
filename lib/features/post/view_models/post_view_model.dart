import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodtree/features/post/models/emoji_model.dart';
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
    required int todayRatingIndex,
    required List<EmojiModel> feelings,
    required List<EmojiModel> weather,
    required List<EmojiModel> meals,
    required List<EmojiModel> food,
    required List<EmojiModel> people,
    required List<EmojiModel> outing,
    required List<EmojiModel> activities,
    required List<EmojiModel> health,
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
          todayRatingIndex: todayRatingIndex,
          feelings: feelings,
          weather: weather,
          meals: meals,
          food: food,
          people: people,
          outing: outing,
          activities: activities,
          health: health,
          photoUrlList: uploadedPhotoUrlList,
          diary: diary,
          updatedAt: DateTime.now(),
        ),
      );
    });

    return state.hasError == false;
  }

  Future<void> deletePost(String postId) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser!;

    final postsRepository = ref.read(postsRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => postsRepository.deletePost(uid: currentUser.uid, postId: postId),
    );
  }
}

final postProvider = AsyncNotifierProvider<PostViewModel, void>(
  () => PostViewModel(),
);
