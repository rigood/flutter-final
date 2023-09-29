import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoViewModel extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  void addPhotos(List<String> photoPaths) {
    state = [...state, for (final photoPath in photoPaths) photoPath];
  }

  void removePhoto(String photoPathToBeRemoved) {
    state = [
      for (final photoPath in state)
        if (photoPath != photoPathToBeRemoved) photoPath
    ];
  }
}

final photoProvider = NotifierProvider<PhotoViewModel, List<String>>(
  () => PhotoViewModel(),
);
