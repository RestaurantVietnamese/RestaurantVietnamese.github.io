import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final int originalIndex;
  final bool isRevealed;
  final String imagePath;
  final String hiddenImagePath; // ảnh trước khi lật

  const TileWidget({
    Key? key,
    required this.originalIndex,
    required this.isRevealed,
    required this.imagePath,
    required this.hiddenImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final row = originalIndex ~/ 3;
    final col = originalIndex % 3;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (!isRevealed) {
          return ClipRect(
            key: ValueKey('unrevealed_$originalIndex'),
            child: Image.asset(
              hiddenImagePath,
              fit: BoxFit.cover,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            ),
          );
        }

        return ClipRect(
          key: ValueKey('revealed_$originalIndex'),
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: OverflowBox(
              maxWidth: constraints.maxWidth * 3,
              maxHeight: constraints.maxHeight * 3,
              alignment: FractionalOffset(col / 2, row / 2),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
