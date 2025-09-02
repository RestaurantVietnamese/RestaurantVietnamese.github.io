import 'dart:typed_data';
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

bool isMobileWeb() {
  if (!kIsWeb) return false;
  final ua = html.window.navigator.userAgent.toLowerCase();
  return ua.contains("iphone") || ua.contains("ipad") || ua.contains("android");
}

Future<void> captureAndSaveImage(GlobalKey globalKey) async {
  final boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData!.buffer.asUint8List();

  if (kIsWeb) {
    if (isMobileWeb()) {
      // --- MOBILE WEB ---
      // Tạo URL object từ blob
      final blob = html.Blob([pngBytes], 'image/png');
      final url = html.Url.createObjectUrlFromBlob(blob);
      
      // Tạo một iframe để mở ảnh
      final iframe = html.IFrameElement()
        ..style.display = 'none'
        ..src = url;
      
      html.document.body!.append(iframe);
      
      // Hiển thị hướng dẫn cho người dùng
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        SnackBar(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Ảnh đã sẵn sàng để lưu:'),
              SizedBox(height: 8),
              Text('1. Nhấn và giữ trên ảnh', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('2. Chọn "Lưu ảnh" hoặc "Save Image"'),
            ],
          ),
          duration: Duration(seconds: 8),
          action: SnackBarAction(
            label: 'Mở ảnh',
            onPressed: () {
              html.window.open(url, "_blank");
            },
          ),
        ),
      );
      
      // Tự động mở ảnh trong tab mới sau 1 giây
      Future.delayed(Duration(seconds: 1), () {
        html.window.open(url, "_blank");
      });
      
      // Dọn dẹp sau 10 giây
      Future.delayed(Duration(seconds: 10), () {
        html.Url.revokeObjectUrl(url);
        iframe.remove();
      });
    } else {
      // --- DESKTOP WEB ---
      final blob = html.Blob([pngBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..download = "menu_image_${DateTime.now().toIso8601String()}.png"
        ..style.display = 'none';
      
      html.document.body!.append(anchor);
      anchor.click();
      
      // Dọn dẹp
      Future.delayed(Duration(seconds: 1), () {
        anchor.remove();
        html.Url.revokeObjectUrl(url);
      });
    }
  } else {
    // Xử lý cho mobile app (không phải web)
    // ... thêm code xử lý cho mobile app nếu cần
  }
}