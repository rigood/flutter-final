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
}

final photosRepositoryProvider = Provider(
  (ref) => PhotosRepository(FirebaseStorage.instance),
);
