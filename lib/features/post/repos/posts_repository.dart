import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moodtree/features/post/models/post_model.dart';

class PostsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> uploadPost(PostModel post) async {
    print("PostsRepository / Post 업로드 시작");

    await _db
        .collection("posts")
        .doc("${post.uid}_${post.date}")
        .set(post.toJson());

    print("PostsRepository / Post 업로드 끝");
  }

  Future<PostModel> findPost(String docId) async {
    print("PostsRepository / Post 찾기 시작 docId : $docId");

    final doc = await _db.collection("posts").doc(docId).get();

    final postJsonData = doc.data();

    if (postJsonData != null) {
      print("PostsRepository / Post 있음 -> $postJsonData");
      return PostModel.fromJson(postJsonData);
    }

    print("PostsRepository / Post 없음");
    return PostModel.empty();
  }
}

final postsRepository = Provider((ref) => PostsRepository());
