import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Future<void> captureAndSaveImage(GlobalKey globalKey) async {
  final boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData!.buffer.asUint8List();

  final blob = html.Blob([pngBytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);

  // Thông báo cho user: “Tap để download nếu trên mobile”
  final anchor = html.AnchorElement(href: url)
    ..download = "menu_image_${DateTime.now().toIso8601String()}.png";

  // Một số trình duyệt mobile cần append anchor vào DOM để trigger download
  html.document.body!.append(anchor);
  anchor.click();
  anchor.remove();

  html.Url.revokeObjectUrl(url);

  print('✅ Ảnh đã tải về Web thành công! (Mobile web sẽ lưu vào Downloads)');
}
