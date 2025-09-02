import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

bool isMobileWeb() {
  if (!kIsWeb) return false;
  final ua = html.window.navigator.userAgent.toLowerCase();
  return ua.contains("iphone") || ua.contains("ipad") || ua.contains("android");
}

// Upload ảnh lên server, trả về URL
Future<String?> uploadImageToServer(Uint8List bytes) async {
  final request =
      http.MultipartRequest('POST', Uri.parse('https://your-api.com/upload'));
  request.files.add(
      http.MultipartFile.fromBytes('file', bytes, filename: "menu_image.png"));
  final response = await request.send();
  if (response.statusCode == 200) {
    final body = await response.stream.bytesToString();
    // parse JSON nếu cần để lấy URL thật
    return body;
  } else {
    print('❌ Upload thất bại: ${response.statusCode}');
    return null;
  }
}

Future<void> captureAndSaveImage(GlobalKey globalKey) async {
  try {
    final boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();

    if (kIsWeb && isMobileWeb()) {
      // --- MOBILE WEB ---
      final imageUrl = await uploadImageToServer(bytes);
      if (imageUrl == null) {
        print('❌ Upload thất bại, không lưu được ảnh.');
        return;
      }

      // Mở ảnh trong tab mới
      html.window.open(imageUrl, "_blank");
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(
            'Trên iOS/Android web: mở tab mới và nhấn giữ để lưu ảnh.',
          ),
          duration: Duration(seconds: 5),
        ),
      );
    } else if (kIsWeb) {
      // --- DESKTOP WEB ---
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..download = "menu_image_${DateTime.now().toIso8601String()}.png"
        ..style.display = 'none';
      html.document.body!.append(anchor);
      anchor.click();
      Future.delayed(Duration(seconds: 1), () {
        anchor.remove();
        html.Url.revokeObjectUrl(url);
      });
    }
  } catch (e) {
    print('❌ Lỗi khi capture/upload/save: $e');
  }
}
