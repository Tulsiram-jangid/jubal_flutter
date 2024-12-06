import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {

  final double imgSize;
  final String url;

  AppImage({
    super.key,
    this.imgSize = 100,
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: imgSize,
      height: imgSize,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child; // The image is fully loaded.
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
                : null,
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return Container(
          width: imgSize,
          height: imgSize,
          color: Colors.grey[300],
          child: Icon(
            Icons.broken_image,
            color: Colors.grey[700],
            size: imgSize / 2,
          ),
        );
      },
    );
  }
  
}
