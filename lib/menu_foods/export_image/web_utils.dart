import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;

import 'package:puzzel/puzzle_game/convert_puzzle.dart';

Future<void> captureAndSaveImage(
    GlobalKey globalKey, ) async {
  try {
    final boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Tạo blob và link download cho web
    final blob = html.Blob([pngBytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..download = "menu_image.png"
      ..click();
    html.Url.revokeObjectUrl(url);

    print('✅ Ảnh đã tải xuống thành công trên Web!');
    // showFlushBar(context, content: 'Ảnh đã tải xuống thành công trên Web!');
  } catch (e) {
    print('❌ Lỗi trên Web: $e');
  }
}
