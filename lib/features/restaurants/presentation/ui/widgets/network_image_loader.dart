import 'package:flutter/material.dart';

class NetworkImageLoader extends StatelessWidget {
  const NetworkImageLoader(
      {super.key, required this.url, required this.boxFit});

  final String url;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: boxFit,
      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent? loadingProgress,
      ) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }
}
