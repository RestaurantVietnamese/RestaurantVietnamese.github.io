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
      
      // Hiển thị ảnh trực tiếp trên trang web thay vì mở tab mới
      _showImagePreview(globalKey.currentContext!, url, pngBytes);
      
      // Dọn dẹp sau 10 phút
      Future.delayed(Duration(minutes: 10), () {
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

void _showImagePreview(BuildContext context, String imageUrl, Uint8List pngBytes) {
  // Tạo một overlay để hiển thị ảnh và hướng dẫn
  final overlayElement = html.DivElement()
    ..style.position = 'fixed'
    ..style.top = '0'
    ..style.left = '0'
    ..style.width = '100%'
    ..style.height = '100%'
    ..style.backgroundColor = 'rgba(0,0,0,0.8)'
    ..style.zIndex = '10000'
    ..style.display = 'flex'
    ..style.flexDirection = 'column'
    ..style.justifyContent = 'center'
    ..style.alignItems = 'center'
    ..style.padding = '20px';
  
  // Tạo phần tử hiển thị ảnh
  final imageElement = html.ImageElement(src: imageUrl)
    ..style.maxWidth = '90%'
    ..style.maxHeight = '70%'
    ..style.borderRadius = '10px'
    ..style.boxShadow = '0 4px 20px rgba(0,0,0,0.5)';
  
  // Tạo phần tử hướng dẫn
  final instructionElement = html.DivElement()
    ..innerHtml = '''
      <div style="color: white; text-align: center; margin-top: 20px; font-family: sans-serif;">
        <h2 style="margin-bottom: 15px;">Để lưu ảnh:</h2>
        <p style="margin: 8px 0; font-size: 16px;">1. Nhấn và giữ trên ảnh</p>
        <p style="margin: 8px 0; font-size: 16px;">2. Chọn "Lưu ảnh" hoặc "Save Image"</p>
      </div>
    ''';
  
  // Tạo nút đóng
  final closeButton = html.ButtonElement()
    ..text = 'Đóng'
    ..style.marginTop = '20px'
    ..style.padding = '10px 20px'
    ..style.backgroundColor = '#ff4757'
    ..style.color = 'white'
    ..style.border = 'none'
    ..style.borderRadius = '5px'
    ..style.fontSize = '16px'
    ..style.cursor = 'pointer';
  
  closeButton.onClick.listen((_) {
    overlayElement.remove();
    html.Url.revokeObjectUrl(imageUrl);
  });
  
  // Thêm các phần tử vào overlay
  overlayElement.append(imageElement);
  overlayElement.append(instructionElement);
  overlayElement.append(closeButton);
  
  // Thêm overlay vào body
  html.document.body!.append(overlayElement);
  
  // Hiển thị thông báo trong app Flutter
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Ảnh đã được tạo. Nhấn và giữ trên ảnh để lưu.'),
      duration: Duration(seconds: 5),
    ),
  );
}