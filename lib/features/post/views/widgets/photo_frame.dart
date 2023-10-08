import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodtree/features/post/views/image_detail_screen/image_detail_screen.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';

class PhotoFrame extends StatelessWidget {
  final String photoUrl;
  final bool readOnly;
  final Function? removePhoto;

  const PhotoFrame({
    super.key,
    required this.photoUrl,
    required this.readOnly,
    this.removePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageDetailScreen(photoUrl: photoUrl),
            ));
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: Sizes.size10,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: ColorThemes.appBackground,
                border: Border.all(
                  color: ColorThemes.primary.withOpacity(0.1),
                ),
                borderRadius: BorderRadius.circular(
                  Sizes.size5,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  Sizes.size5,
                ),
                child: Image(
                  width: Sizes.size60,
                  height: Sizes.size60,
                  fit: BoxFit.cover,
                  image: photoUrl.startsWith("/data")
                      ? FileImage(File(photoUrl))
                      : photoUrl.startsWith("https")
                          ? CachedNetworkImageProvider(photoUrl)
                              as ImageProvider
                          : AssetImage(photoUrl),
                ),
              ),
            ),
          ),
          if (readOnly == false)
            Positioned(
                top: 4,
                right: 16,
                child: GestureDetector(
                  onTap: readOnly ? null : () => removePhoto!(photoUrl),
                  child: Container(
                    padding: const EdgeInsets.all(
                      Sizes.size4,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorThemes.primary.withOpacity(0.5),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.xmark,
                      size: Sizes.size10,
                      color: ColorThemes.white,
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}
