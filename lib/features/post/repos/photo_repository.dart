import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<String>> uploadPhotoFiles(
      {required List<String> photoUrlList,
      required String uid,
      required String date}) async {
    final uploadedPhotoUrlList = await Future.wait(
      photoUrlList.map(
        (photoUrl) => uploadPhotoFile(
          photoUrl: photoUrl,
          uid: uid,
          date: date,
        ),
      ),
    );

    return uploadedPhotoUrlList;
  }

  Future<String> uploadPhotoFile({
    required String photoUrl,
    required String uid,
    required String date,
  }) async {
    if (photoUrl.startsWith("https")) {
      return photoUrl;
    } else {
      final fileRef = _storage.ref().child(
          "images/$uid/$date/${DateTime.now().millisecondsSinceEpoch.toString()}");

      final UploadTask uploadTask = fileRef.putFile(File(photoUrl));

      final uploadedPhotoUrl = await (await uploadTask).ref.getDownloadURL();

      return uploadedPhotoUrl;
    }
  }
}

final photoRepository = Provider((ref) => PhotoRepository());
