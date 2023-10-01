import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodtree/features/auth/repos/auth_repository.dart';
import 'package:moodtree/features/post/models/post_model.dart';

class PostsRepository {
  final FirebaseFirestore _firestore;

  PostsRepository(this._firestore);

  static String postPath(String uid, String postId) =>
      'users/$uid/posts/$postId';
  static String postsPath(String uid) => 'users/$uid/posts';

// create, update
  Future<void> submitPost({required String uid, required PostModel post}) =>
      _firestore.collection(postsPath(uid)).doc(post.id).set(post.toJson());

// delete
  Future<void> deletePost({required String uid, required String postId}) async {
    final postRef = _firestore.doc(postPath(uid, postId));
    await postRef.delete();
  }

// read
  Query<PostModel> queryPosts({required String uid}) =>
      _firestore.collection(postsPath(uid)).withConverter(
            fromFirestore: (snapshot, _) =>
                PostModel.fromJson(snapshot.data()!),
            toFirestore: (post, _) => post.toJson(),
          );

  Future<List<PostModel>> fetchPosts({required String uid}) async {
    final posts = await queryPosts(uid: uid).get();
    return posts.docs.map((doc) => doc.data()).toList();
  }

  Stream<List<PostModel>> watchPosts({required String uid}) =>
      queryPosts(uid: uid)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  Stream<PostModel> watchPost({required String uid, required String postId}) =>
      _firestore
          .doc(postPath(uid, postId))
          .withConverter(
            fromFirestore: (snapshot, _) =>
                PostModel.fromJson(snapshot.data()!),
            toFirestore: (post, _) => post.toJson(),
          )
          .snapshots()
          .map((snapshot) => snapshot.data()!);
}

final postsRepositoryProvider =
    Provider((ref) => PostsRepository(FirebaseFirestore.instance));

final postsStreamProvider = StreamProvider((ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser;

  final postsRepository = ref.watch(postsRepositoryProvider);
  return postsRepository.watchPosts(uid: user!.uid);
});
