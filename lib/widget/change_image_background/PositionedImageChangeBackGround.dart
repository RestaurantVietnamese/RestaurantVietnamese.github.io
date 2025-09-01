// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PositionedImageChangeBackGround extends StatelessWidget {
  const PositionedImageChangeBackGround({
    super.key,
    required this.imageUrl,
    this.heightImage,
  });

  final String? imageUrl;
  final double? heightImage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        width: 410,
        height: heightImage, //110,
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.9),
        ),
        child: imageUrl == null || imageUrl!.isEmpty
            ? const Center(
                child: Text(
                  '',
                  style: TextStyle(color: Colors.transparent),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  opacity: AlwaysStoppedAnimation(0.3),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'Không tải được ảnh',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}