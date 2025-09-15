import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puzzel/menu_foods/export_image/web_utils.dart'
    if (dart.library.io) 'package:puzzel/menu_foods/export_image/mobile_utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:ui' as ui;
import 'dart:html' as html;

// Note: 'package:puzzel/' is the prefix you use in your project.

Future<void> saveImage(GlobalKey globalKey) async {
  await captureAndSaveImage(globalKey);
}

Future<void> downloadAsPdf2(GlobalKey genKey) async {
  try {
    // Chụp widget
    RenderRepaintBoundary boundary =
        genKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    const double pixelRatio = 3.0;
    ui.Image image = await boundary.toImage(pixelRatio: 10);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      Uint8List pngBytes = byteData.buffer.asUint8List();

      // Lấy size widget thực tế
      final renderBox = genKey.currentContext!.findRenderObject() as RenderBox;
      final widgetWidth = renderBox.size.width;
      final widgetHeight = renderBox.size.height;

      // Quy đổi ra khổ PDF
      final pageWidth = widgetWidth * pixelRatio;
      final pageHeight = widgetHeight * pixelRatio;

      // Tạo PDF với kích thước y hệt widget
      final pdf = pw.Document();
      final imageProvider = pw.MemoryImage(pngBytes);

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(pageWidth, pageHeight),
          build: (pw.Context context) =>
              pw.Center(child: pw.Image(imageProvider, fit: pw.BoxFit.contain)),
        ),
      );

      final pdfBytes = await pdf.save();

      if (kIsWeb) {
        // 👉 Web: dùng anchor để tải
        final blob = html.Blob([pdfBytes], 'application/pdf');
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..download =
              "widget_capture_${DateTime.now().millisecondsSinceEpoch}.pdf"
          ..style.display = 'none';

        html.document.body!.append(anchor);
        anchor.click();

        Future.delayed(const Duration(seconds: 1), () {
          anchor.remove();
          html.Url.revokeObjectUrl(url);
        });

        debugPrint("✅ PDF đã được tải xuống (web)");
      } else {
        // 👉 Mobile/Desktop: dùng FileSaver
        final result = await FileSaver.instance.saveAs(
          name: "widget_capture_${DateTime.now().millisecondsSinceEpoch}",
          bytes: pdfBytes,
          ext: 'pdf',
          mimeType: MimeType.pdf,
        );

        if (result != null) {
          debugPrint("✅ PDF đã lưu thành công: $result");
        } else {
          debugPrint("❌ Lưu PDF thất bại");
        }
      }
    }
  } catch (e) {
    debugPrint("❌ Lỗi khi tạo PDF: $e");
  }
}


Future<Uint8List> _captureKeyToBytes(GlobalKey key) async {
  final boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
  final image = await boundary.toImage(pixelRatio: 2.0);
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  return byteData!.buffer.asUint8List();
}
Future<void> downloadAsPdf(List<GlobalKey> keys) async {
  final pdf = pw.Document();
  final images = <pw.Image>[];

  double totalWidth = 0;
  double maxHeight = 0;

  // Capture từng page
  for (final key in keys) {
    final bytes = await _captureKeyToBytes(key);
    final image = pw.MemoryImage(bytes);

    // giả sử tất cả cao = 800, rộng = 450
    totalWidth += 450;
    maxHeight = 800;

    images.add(pw.Image(image, width: 450, height: 800));
  }

  // Ghép vào 1 trang ngang
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat(totalWidth, maxHeight),
      build: (_) => pw.Row(children: images),
    ),
  );

  final pdfBytes = await pdf.save();

  // 👉 Tải xuống web
  final blob = html.Blob([pdfBytes], 'application/pdf');
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..download = "menu_${DateTime.now().millisecondsSinceEpoch}.pdf"
    ..style.display = 'none';
  html.document.body!.append(anchor);
  anchor.click();
  anchor.remove();
  html.Url.revokeObjectUrl(url);
}
