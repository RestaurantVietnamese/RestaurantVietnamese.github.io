import 'dart:typed_data';
import 'dart:html' as html;
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

  final anchor = html.AnchorElement(href: url)
    ..download = "menu_image_${DateTime.now().toIso8601String()}.png";

  // Append anchor vào DOM trước khi click
  html.document.body!.append(anchor);

  // Click trực tiếp từ sự kiện user (bắt buộc trên iOS)
  anchor.click();
  anchor.remove();
  html.Url.revokeObjectUrl(url);

  // Thông báo user trên iOS
  ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(
        'Trên iOS: mở menu Share và chọn "Save to Files" để lưu ảnh.',
      ),
    ),
  );
}
