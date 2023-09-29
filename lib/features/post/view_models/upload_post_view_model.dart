import 'dart:async';
import 'package:moodtree/features/auth/repos/auth_repo.dart';
import 'package:moodtree/features/post/models/post_model.dart';
import 'package:moodtree/features/post/repos/photo_repository.dart';
import 'package:moodtree/features/post/repos/posts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadPostViewModel extends AsyncNotifier<void> {
  late final PostsRepository _postsRepository;
  late final PhotoRepository _photoRepository;

  @override
  FutureOr<void> build() {
    _postsRepository = ref.read(postsRepository);
    _photoRepository = ref.read(photoRepository);
  }

  Future<void> uploadPost({
    required String date,
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
    final uid = ref.read(authRepo).user!.uid;

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final uploadedPhotoUrlList = await _photoRepository.uploadPhotoFiles(
        photoUrlList: photoUrlList,
        uid: uid,
        date: date,
      );

      await _postsRepository.uploadPost(PostModel(
        uid: uid,
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
      ));
    });
  }
}

final uploadPostProvider = AsyncNotifierProvider<UploadPostViewModel, void>(
  () => UploadPostViewModel(),
);
