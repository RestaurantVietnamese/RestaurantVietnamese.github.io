import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:puzzel/puzzle_game/convert_puzzle.dart';

Future<void> captureAndSaveImage(GlobalKey globalKey) async {
  try {
    // Yêu cầu quyền lưu trữ
    var status = await Permission.photos.request();
    if (status.isDenied) {
      print('❌ Quyền truy cập thư viện ảnh bị từ chối.');
      return;
    }

    final boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Lưu ảnh vào thư viện trên mobile
    final result = await ImageGallerySaver.saveImage(
      pngBytes,
      quality: 100,
      name: "menu_image_${DateTime.now().toIso8601String()}",
    );

    if (result['isSuccess']) {
      print('✅ Ảnh đã lưu vào thư viện thành công trên Mobile!');
      // showFlushBar(context,
      //     content: 'Ảnh đã lưu vào thư viện thành công trên Mobile!');
    } else {
      print('❌ Lỗi khi lưu ảnh trên Mobile: ${result['errorMessage']}');
    }
  } catch (e) {
    print('❌ Lỗi trên Mobile: $e');
  }
}
