import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final double width;
  final double height;
  final String url;
  final String assetUrl;

  AppImage(
      {super.key,
      this.width = 100,
      this.height = 100,
      required this.url,
      this.assetUrl = ""});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child; // The image is fully loaded.
        }
        return Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        if (assetUrl.isNotEmpty)
          return Image.asset(
            assetUrl,
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
        else
          return Container(
            width: width,
            height: height,
            color: Colors.grey[300],
            child: Icon(
              Icons.broken_image,
              color: Colors.grey[700],
              size: width / 2,
            ),
          );
      },
    );
  }
}
