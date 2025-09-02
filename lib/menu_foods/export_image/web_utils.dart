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

      // Hiển thị dialog hoặc bottom sheet để người dùng chủ động mở ảnh
      _showMobileSaveDialog(globalKey.currentContext!, url);

      // Dọn dẹp sau 2 phút
      Future.delayed(Duration(minutes: 2), () {
        html.Url.revokeObjectUrl(url);
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

void _showMobileSaveDialog(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Lưu ảnh'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Để lưu ảnh trên thiết bị di động:'),
            SizedBox(height: 12),
            Text('1. Nhấn nút "Mở ảnh" bên dưới'),
            Text('2. Nhấn và giữ trên ảnh'),
            Text('3. Chọn "Lưu ảnh" hoặc "Save Image"'),
            SizedBox(height: 16),
            Text('Lưu ý: Cho phép popup nếu trình duyệt hỏi'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              // Mở ảnh khi người dùng chủ động nhấn nút
              html.window.open(imageUrl, "_blank");
              Navigator.of(context).pop();

              // Hiển thị hướng dẫn thêm
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ảnh đã mở. Nhấn và giữ để lưu.'),
                  duration: Duration(seconds: 5),
                ),
              );
            },
            child: Text('Mở ảnh'),
          ),
        ],
      );
    },
  );
}
