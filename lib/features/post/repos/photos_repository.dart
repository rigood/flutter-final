import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotosRepository {
  final FirebaseStorage _storage;

  PhotosRepository(this._storage);

  Future<List<String>> uploadPhotoFiles({
    required List<String> photoUrlList,
    required String uid,
    required String postId,
  }) async {
    final uploadedPhotoUrlList = await Future.wait(
      photoUrlList.map(
        (photoUrl) => _uploadPhotoFile(
          photoUrl: photoUrl,
          uid: uid,
          postId: postId,
        ),
      ),
    );

    return uploadedPhotoUrlList;
  }

  Future<String> _uploadPhotoFile({
    required String photoUrl,
    required String uid,
    required String postId,
  }) async {
    if (photoUrl.startsWith("https")) {
      return photoUrl;
    } else {
      final fileRef = _storage.ref().child(
          "images/$uid/$postId/${DateTime.now().millisecondsSinceEpoch.toString()}");

      final UploadTask uploadTask = fileRef.putFile(File(photoUrl));

      final uploadedPhotoUrl = await (await uploadTask).ref.getDownloadURL();

      return uploadedPhotoUrl;
    }
  }

  Future<void> deleteImageFolder(
      {required String uid, required String postId}) async {
    final storageRef = _storage.ref().child("images/$uid/$postId");
    final listResult = await storageRef.listAll();

    await Future.wait(listResult.items.map((item) => item.delete()));
  }

  Future<void> deleteUnusedImageFiles(
      {required String uid,
      required String postId,
      required List<String> uploadedPhotoUrlList}) async {
    final storageRef = _storage.ref().child("images/$uid/$postId");
    final list = await storageRef.listAll();

    for (final imageRef in list.items) {
      imageRef.getDownloadURL().then((url) async {
        if (!uploadedPhotoUrlList.contains(url)) {
          await _storage.refFromURL(url).delete();
        }
      });
    }
  }
}

final photosRepositoryProvider = Provider(
  (ref) => PhotosRepository(FirebaseStorage.instance),
);
