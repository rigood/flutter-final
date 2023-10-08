import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moodtree/theme.dart';

class ImageDetailScreen extends StatelessWidget {
  final String photoUrl;

  const ImageDetailScreen({
    super.key,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorThemes.black,
      ),
      backgroundColor: ColorThemes.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
            child: Image(
          fit: BoxFit.cover,
          image: photoUrl.startsWith("/data")
              ? FileImage(File(photoUrl))
              : photoUrl.startsWith("https")
                  ? CachedNetworkImageProvider(photoUrl) as ImageProvider
                  : AssetImage(photoUrl),
        )),
      ),
    );
  }
}
