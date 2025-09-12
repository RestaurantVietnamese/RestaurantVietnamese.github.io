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
  final pngBytes = await captureCroppedImage(globalKey);

  if (kIsWeb) {
    if (isMobileWeb()) {
      final blob = html.Blob([pngBytes], 'image/png');
      final url = html.Url.createObjectUrlFromBlob(blob);
      _showImagePreview(globalKey.currentContext!, url, pngBytes, globalKey);
      Future.delayed(const Duration(minutes: 10), () {
        html.Url.revokeObjectUrl(url);
      });
    } else {
      final blob = html.Blob([pngBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..download = "menu_image_${DateTime.now().toIso8601String()}.png"
        ..style.display = 'none';
      html.document.body!.append(anchor);
      anchor.click();
      Future.delayed(const Duration(seconds: 1), () {
        anchor.remove();
        html.Url.revokeObjectUrl(url);
      });
    }
  }
}

Future<Uint8List> captureCroppedImage(GlobalKey key) async {
  final boundary =
      key.currentContext!.findRenderObject() as RenderRepaintBoundary;

  // chụp ảnh gốc
  final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  final pngBytes = byteData!.buffer.asUint8List();

  // decode lại thành Image để cắt
  final codec = await ui.instantiateImageCodec(pngBytes);
  final frame = await codec.getNextFrame();
  final ui.Image fullImage = frame.image;

  // lấy đúng kích thước widget (theo pixelRatio)
  final renderBox = key.currentContext!.findRenderObject() as RenderBox;
  final targetWidth = (renderBox.size.width * 3.0).toInt();
  final targetHeight = (renderBox.size.height * 3.0).toInt();

  // cắt đúng khung
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final paint = Paint();
  canvas.drawImageRect(
    fullImage,
    Rect.fromLTWH(0, 0, targetWidth.toDouble(), targetHeight.toDouble()),
    Rect.fromLTWH(0, 0, targetWidth.toDouble(), targetHeight.toDouble()),
    paint,
  );

  final cropped =
      await recorder.endRecording().toImage(targetWidth, targetHeight);
  final croppedBytes =
      await (await cropped.toByteData(format: ui.ImageByteFormat.png))!
          .buffer
          .asUint8List();

  return croppedBytes;
}

void _showImagePreview(BuildContext context, String imageUrl,
    Uint8List pngBytes, GlobalKey globalKey) {
  // Lấy kích thước chính xác của widget từ globalKey
  final RenderBox renderBox =
      globalKey.currentContext!.findRenderObject() as RenderBox;
  final double widgetWidth = renderBox.size.width;
  final double widgetHeight = renderBox.size.height;

  // Tỷ lệ pixel (3.0 từ toImage(pixelRatio: 3.0))
  final double pixelRatio = 3.0;

  // Kích thước thực của ảnh được chụp
  final double imageWidth = widgetWidth * pixelRatio;
  final double imageHeight = widgetHeight * pixelRatio;

  // Tính toán kích thước hiển thị dựa trên tỷ lệ gốc
  double displayWidth = 450; // Kích thước gốc của Container
  double displayHeight = 800; // Kích thước gốc của Container

  // Tạo một overlay để hiển thị ảnh và hướng dẫn
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
    ..style.padding = '20px';

  // Container chính với kích thước chính xác 410x800
  final mainContainer = html.DivElement()
    ..style.width = '${displayWidth}px'
    ..style.height = '${displayHeight}px'
    ..style.backgroundColor = 'white'
    ..style.border = '1px solid #e0e0e0'
    ..style.borderRadius = '0px'
    ..style.overflow = 'hidden'
    ..style.boxShadow = '0 10px 30px rgba(0,0,0,0.5)'
    ..style.display = 'flex'
    ..style.flexDirection = 'column';

  // Container cho ảnh với kích thước chính xác
  final imageContainer = html.DivElement()
    ..style.width = '100%'
    ..style.height = '100%'
    ..style.display = 'flex'
    ..style.justifyContent = 'center'
    ..style.alignItems = 'center'
    ..style.overflow = 'hidden';

  // Phần tử hiển thị ảnh
  final imageElement = html.ImageElement(src: imageUrl)
    ..style.width = '${displayWidth}px'
    ..style.height = '${displayHeight}px'
    ..style.objectFit = 'contain';

  // Thêm ảnh vào container
  imageContainer.append(imageElement);
  mainContainer.append(imageContainer);

  // Container cho hướng dẫn (bên ngoài khung ảnh)
  final instructionContainer = html.DivElement()
    ..style.marginTop = '20px'
    ..style.padding = '15px'
    ..style.backgroundColor = 'rgba(0,0,0,0.8)'
    ..style.borderRadius = '10px'
    ..style.maxWidth = '${displayWidth}px';

  instructionContainer.innerHtml = '''
    <div style="color: white; text-align: center; font-family: sans-serif;">
      <h2 style="margin-bottom: 12px; font-size: 18px;">Để lưu ảnh:</h2>
      <p style="margin: 8px 0; font-size: 16px;">1. Nhấn và giữ trên ảnh</p>
      <p style="margin: 8px 0; font-size: 16px;">2. Chọn "Lưu ảnh" hoặc "Save Image"</p>
    </div>
  ''';

  // Tạo nút đóng
  final closeButton = html.ButtonElement()
    ..text = 'Đóng'
    ..style.marginTop = '20px'
    ..style.padding = '12px 24px'
    ..style.backgroundColor = '#ff4757'
    ..style.color = 'white'
    ..style.border = 'none'
    ..style.borderRadius = '6px'
    ..style.fontSize = '16px'
    ..style.fontWeight = 'bold'
    ..style.cursor = 'pointer'
    ..style.boxShadow = '0 4px 10px rgba(0,0,0,0.3)';

  closeButton.onClick.listen((_) {
    overlayElement.remove();
    html.Url.revokeObjectUrl(imageUrl);
  });

  // Thêm các phần tử vào overlay
  overlayElement.append(mainContainer);
  overlayElement.append(instructionContainer);
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

void _showImagePreview2(BuildContext context, String imageUrl,
    Uint8List pngBytes, GlobalKey globalKey) {
  // Lấy kích thước thực của widget được chụp
  final RenderBox renderBox =
      globalKey.currentContext!.findRenderObject() as RenderBox;
  final double widgetWidth = renderBox.size.width;
  final double widgetHeight = renderBox.size.height;

  // Tính tỷ lệ để hiển thị ảnh đúng kích thước
  double maxPreviewWidth = html.window.innerWidth! * 0.9;
  double maxPreviewHeight = html.window.innerHeight! * 0.7;

  double previewWidth = widgetWidth;
  double previewHeight = widgetHeight;

  // Đảm bảo ảnh không vượt quá kích thước màn hình
  if (previewWidth > maxPreviewWidth) {
    double ratio = maxPreviewWidth / previewWidth;
    previewWidth = maxPreviewWidth;
    previewHeight = previewHeight * ratio;
  }

  if (previewHeight > maxPreviewHeight) {
    double ratio = maxPreviewHeight / previewHeight;
    previewHeight = maxPreviewHeight;
    previewWidth = previewWidth * ratio;
  }

  // Tạo một overlay để hiển thị ảnh và hướng dẫn
  final overlayElement = html.DivElement()
    ..style.position = 'fixed'
    ..style.top = '0'
    ..style.left = '0'
    ..style.width = '100%'
    ..style.height = '100%'
    ..style.backgroundColor = 'rgba(0,0,0,0.9)'
    ..style.zIndex = '10000'
    ..style.display = 'flex'
    ..style.flexDirection = 'column'
    ..style.justifyContent = 'center'
    ..style.alignItems = 'center'
    ..style.padding = '20px'
    ..style.overflow = 'auto';

  // Tạo container cho ảnh để có viền và đổ bóng
  final imageContainer = html.DivElement()
    ..style.width = '${previewWidth}px'
    ..style.height = '${previewHeight}px'
    ..style.borderRadius = '8px'
    ..style.overflow = 'hidden'
    ..style.boxShadow = '0 10px 30px rgba(0,0,0,0.5)'
    ..style.display = 'flex'
    ..style.justifyContent = 'center'
    ..style.alignItems = 'center';

  // Tạo phần tử hiển thị ảnh
  final imageElement = html.ImageElement(src: imageUrl)
    ..style.width = '100%'
    ..style.height = '100%'
    ..style.objectFit = 'contain';

  // Tạo phần tử hướng dẫn
  final instructionElement = html.DivElement()
    ..innerHtml = '''
      <div style="color: white; text-align: center; margin-top: 20px; font-family: sans-serif; background: rgba(0,0,0,0.7); padding: 15px; border-radius: 10px;">
        <h2 style="margin-bottom: 12px; font-size: 18px;">Để lưu ảnh:</h2>
        <p style="margin: 8px 0; font-size: 16px;">1. Nhấn và giữ trên ảnh</p>
        <p style="margin: 8px 0; font-size: 16px;">2. Chọn "Lưu ảnh" hoặc "Save Image"</p>
      </div>
    ''';

  // Tạo nút đóng
  final closeButton = html.ButtonElement()
    ..text = 'Đóng'
    ..style.marginTop = '20px'
    ..style.padding = '12px 24px'
    ..style.backgroundColor = '#ff4757'
    ..style.color = 'white'
    ..style.border = 'none'
    ..style.borderRadius = '6px'
    ..style.fontSize = '16px'
    ..style.fontWeight = 'bold'
    ..style.cursor = 'pointer'
    ..style.boxShadow = '0 4px 10px rgba(0,0,0,0.3)';

  closeButton.onClick.listen((_) {
    overlayElement.remove();
    html.Url.revokeObjectUrl(imageUrl);
  });

  // Thêm các phần tử vào container và overlay
  imageContainer.append(imageElement);
  overlayElement.append(imageContainer);
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

void _showImagePreview1(
    BuildContext context, String imageUrl, Uint8List pngBytes) {
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
