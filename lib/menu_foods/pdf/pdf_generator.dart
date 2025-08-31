// import 'package:flutter/material.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/pdf.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:puzzel/menu_foods/data/menu_data.dart';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:flutter/rendering.dart';
// import 'dart:html' as html;

// Future<void> captureAndSaveImage(GlobalKey globalKey) async {
//   try {
//     final boundary =
//         globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

//     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     Uint8List pngBytes = byteData!.buffer.asUint8List();

//     // Tạo blob và tạo link download
//     final blob = html.Blob([pngBytes]);
//     final url = html.Url.createObjectUrlFromBlob(blob);
//     final anchor = html.AnchorElement(href: url)
//       ..download = "menu_image.png" // tên file tải về
//       ..click();
//     html.Url.revokeObjectUrl(url);

//     print('✅ Ảnh đã tải xuống thành công!');
//   } catch (e) {
//     print('❌ Lỗi: $e');
//   }
// }

// /// Hàm chụp và lưu ảnh dành cho Mobile
// Future<void> captureAndSaveImageMobile(GlobalKey globalKey) async {
//   try {
//     // Yêu cầu quyền lưu trữ
//     var status = await Permission.photos.request();
//     if (status.isDenied) {
//       print('❌ Quyền truy cập thư viện ảnh bị từ chối.');
//       return;
//     }

//     final boundary =
//         globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     Uint8List pngBytes = byteData!.buffer.asUint8List();

//     // Lưu ảnh vào thư viện trên mobile
//     final result = await ImageGallerySaver.saveImage(
//       pngBytes,
//       quality: 100,
//       name: "menu_image_${DateTime.now().toIso8601String()}",
//     );

//     if (result['isSuccess']) {
//       print('✅ Ảnh đã lưu vào thư viện thành công trên Mobile!');
//     } else {
//       print('❌ Lỗi khi lưu ảnh trên Mobile: ${result['errorMessage']}');
//     }
//   } catch (e) {
//     print('❌ Lỗi trên Mobile: $e');
//   }
// }
