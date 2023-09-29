import 'package:flutter/material.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/features/post/views/widgets/photo_frame.dart';
import 'package:moodtree/features/post/views/widgets/photo_upload_frame.dart';
import 'package:moodtree/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PhotoSection extends ConsumerStatefulWidget {
  final String title;
  final List<String> photoUrlList;
  final Function addPhotos;
  final Function removePhoto;

  const PhotoSection({
    super.key,
    required this.title,
    required this.photoUrlList,
    required this.addPhotos,
    required this.removePhoto,
  });

  @override
  ConsumerState<PhotoSection> createState() => _PhotoSectionState();
}

class _PhotoSectionState extends ConsumerState<PhotoSection> {
  Future<void> _uploadPhotos() async {
    final photos = await ImagePicker().pickMultiImage();

    if (photos.isNotEmpty) {
      List<String> photoPaths = photos.map((photo) => photo.path).toList();
      widget.addPhotos(photoPaths);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorThemes.white,
        borderRadius: BorderRadius.circular(
          Sizes.size16,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
              ),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w700,
                      color: ColorThemes.primary,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v10,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: Sizes.size20,
                  ),
                  child: PhotoUploadFrame(
                    onTap: _uploadPhotos,
                  ),
                ),
                Gaps.h10,
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (var photoUrl in widget.photoUrlList)
                          PhotoFrame(
                            photoUrl: photoUrl,
                            removePhoto: widget.removePhoto,
                          ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}