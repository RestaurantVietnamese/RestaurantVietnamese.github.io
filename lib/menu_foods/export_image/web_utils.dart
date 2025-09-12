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
      _showImagePreview(globalKey.currentContext!, url, pngBytes, globalKey);

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


void _showImagePreview(BuildContext context, String imageUrl,
    Uint8List pngBytes, GlobalKey globalKey) {
  // Lấy kích thước chính xác của widget từ globalKey
  final RenderBox renderBox =
      globalKey.currentContext!.findRenderObject() as RenderBox;
  final double widgetWidth = renderBox.size.width; // ví dụ 2250
  final double widgetHeight = renderBox.size.height; // 800

  // Tỷ lệ pixel (3.0 từ toImage(pixelRatio: 3.0))
  const double pixelRatio = 3.0;

  // Kích thước thực của ảnh được chụp
  final double imageWidth = widgetWidth * pixelRatio;
  final double imageHeight = widgetHeight * pixelRatio;

  // 👇 Thay vì fix cứng 450x800, dùng widgetWidth/widgetHeight
  double displayWidth = widgetWidth;
  double displayHeight = widgetHeight;

  // Tạo overlay
  final overlayElement = html.DivElement()
    ..style.position = 'fixed'
    ..style.top = '0'
    ..style.left = '0'
    ..style.width = '100%'
    ..style.height = '100%'
    ..style.backgroundColor = 'rgba(0,0,0,0.95)'
    ..style.zIndex = '10000'
    ..style.display = 'flex'
    ..style.flexDirection = 'column'
    ..style.justifyContent = 'center'
    ..style.alignItems = 'center'
    ..style.padding = '20px'
    ..style.overflow = 'auto'; // ✅ cho phép scroll nếu ảnh to

  // Container chính với kích thước theo widget thực
  final mainContainer = html.DivElement()
    ..style.width = '${displayWidth}px'
    ..style.height = '${displayHeight}px'
    ..style.backgroundColor = 'white'
    ..style.border = '1px solid #e0e0e0'
    ..style.overflow = 'hidden'
    ..style.boxShadow = '0 10px 30px rgba(0,0,0,0.5)'
    ..style.display = 'flex';

  // Container cho ảnh
  final imageContainer = html.DivElement()
    ..style.width = '100%'
    ..style.height = '100%'
    ..style.display = 'flex'
    ..style.justifyContent = 'center'
    ..style.alignItems = 'center';

  // Hiển thị ảnh full kích thước
  final imageElement = html.ImageElement(src: imageUrl)
    ..style.width = '${displayWidth}px'
    ..style.height = '${displayHeight}px'
    ..style.objectFit = 'contain';

  imageContainer.append(imageElement);
  mainContainer.append(imageContainer);

  // ... phần instructionContainer + closeButton giữ nguyên
  // thêm mainContainer, instructionContainer, closeButton vào overlay như cũ
  // rồi append overlay vào document.body
}


// void _showImagePreview(BuildContext context, String imageUrl,
//     Uint8List pngBytes, GlobalKey globalKey) {
//   // Lấy kích thước chính xác của widget từ globalKey
//   final RenderBox renderBox =
//       globalKey.currentContext!.findRenderObject() as RenderBox;
//   final double widgetWidth = renderBox.size.width;
//   final double widgetHeight = renderBox.size.height;

//   // Tỷ lệ pixel (3.0 từ toImage(pixelRatio: 3.0))
//   final double pixelRatio = 3.0;

//   // Kích thước thực của ảnh được chụp
//   final double imageWidth = widgetWidth * pixelRatio;
//   final double imageHeight = widgetHeight * pixelRatio;

//   // Tính toán kích thước hiển thị dựa trên tỷ lệ gốc
//   double displayWidth = 450; // Kích thước gốc của Container
//   double displayHeight = 800; // Kích thước gốc của Container

//   // Tạo một overlay để hiển thị ảnh và hướng dẫn
//   final overlayElement = html.DivElement()
//     ..style.position = 'fixed'
//     ..style.top = '0'
//     ..style.left = '0'
//     ..style.width = '100%'
//     ..style.height = '100%'
//     ..style.backgroundColor = 'rgba(0,0,0,0.95)'
//     ..style.zIndex = '10000'
//     ..style.display = 'flex'
//     ..style.flexDirection = 'column'
//     ..style.justifyContent = 'center'
//     ..style.alignItems = 'center'
//     ..style.padding = '20px';

//   // Container chính với kích thước chính xác 410x800
//   final mainContainer = html.DivElement()
//     ..style.width = '${displayWidth}px'
//     ..style.height = '${displayHeight}px'
//     ..style.backgroundColor = 'white'
//     ..style.border = '1px solid #e0e0e0'
//     ..style.borderRadius = '0px'
//     ..style.overflow = 'hidden'
//     ..style.boxShadow = '0 10px 30px rgba(0,0,0,0.5)'
//     ..style.display = 'flex'
//     ..style.flexDirection = 'column';

//   // Container cho ảnh với kích thước chính xác
//   final imageContainer = html.DivElement()
//     ..style.width = '100%'
//     ..style.height = '100%'
//     ..style.display = 'flex'
//     ..style.justifyContent = 'center'
//     ..style.alignItems = 'center'
//     ..style.overflow = 'hidden';

//   // Phần tử hiển thị ảnh
//   final imageElement = html.ImageElement(src: imageUrl)
//     ..style.width = '${displayWidth}px'
//     ..style.height = '${displayHeight}px'
//     ..style.objectFit = 'contain';

//   // Thêm ảnh vào container
//   imageContainer.append(imageElement);
//   mainContainer.append(imageContainer);

//   // Container cho hướng dẫn (bên ngoài khung ảnh)
//   final instructionContainer = html.DivElement()
//     ..style.marginTop = '20px'
//     ..style.padding = '15px'
//     ..style.backgroundColor = 'rgba(0,0,0,0.8)'
//     ..style.borderRadius = '10px'
//     ..style.maxWidth = '${displayWidth}px';

//   instructionContainer.innerHtml = '''
//     <div style="color: white; text-align: center; font-family: sans-serif;">
//       <h2 style="margin-bottom: 12px; font-size: 18px;">Để lưu ảnh:</h2>
//       <p style="margin: 8px 0; font-size: 16px;">1. Nhấn và giữ trên ảnh</p>
//       <p style="margin: 8px 0; font-size: 16px;">2. Chọn "Lưu ảnh" hoặc "Save Image"</p>
//     </div>
//   ''';

//   // Tạo nút đóng
//   final closeButton = html.ButtonElement()
//     ..text = 'Đóng'
//     ..style.marginTop = '20px'
//     ..style.padding = '12px 24px'
//     ..style.backgroundColor = '#ff4757'
//     ..style.color = 'white'
//     ..style.border = 'none'
//     ..style.borderRadius = '6px'
//     ..style.fontSize = '16px'
//     ..style.fontWeight = 'bold'
//     ..style.cursor = 'pointer'
//     ..style.boxShadow = '0 4px 10px rgba(0,0,0,0.3)';

//   closeButton.onClick.listen((_) {
//     overlayElement.remove();
//     html.Url.revokeObjectUrl(imageUrl);
//   });

//   // Thêm các phần tử vào overlay
//   overlayElement.append(mainContainer);
//   overlayElement.append(instructionContainer);
//   overlayElement.append(closeButton);

//   // Thêm overlay vào body
//   html.document.body!.append(overlayElement);

//   // Hiển thị thông báo trong app Flutter
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text('Ảnh đã được tạo. Nhấn và giữ trên ảnh để lưu.'),
//       duration: Duration(seconds: 5),
//     ),
//   );
// }