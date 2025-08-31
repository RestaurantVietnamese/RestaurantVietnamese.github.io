import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:puzzel/menu_foods/data/menu_data.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'dart:html' as html;

Future<pw.Document> generateMenuPdf({bool showBorder = false}) async {
  final pdf = pw.Document();

  for (var item in menuItems_Page1) {
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Tiêu đề món ăn
              pw.Text(item.title,
                  style: pw.TextStyle(
                      fontSize: 18,
                      fontStyle: pw.FontStyle.italic,
                      fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 5),
              // Mô tả tiếng Đức
              pw.Text(item.descriptionDe, style: pw.TextStyle(fontSize: 12)),
              // Mô tả tiếng Anh (in nghiêng)
              pw.Text(item.descriptionEn,
                  style: pw.TextStyle(
                      fontSize: 11, fontStyle: pw.FontStyle.italic)),
              pw.SizedBox(height: 8),

              // Bảng option
              pw.Table(
                border: showBorder ? pw.TableBorder.all() : pw.TableBorder(),
                columnWidths: {
                  0: pw.FixedColumnWidth(20), // code a., b.
                  1: pw.FlexColumnWidth(3), // name
                  2: pw.FlexColumnWidth(1), // tags
                  3: pw.FlexColumnWidth(2), // prices
                },
                children: [
                  ...item.options.map((opt) {
                    return pw.TableRow(
                      children: [
                        pw.Padding(
                            padding: pw.EdgeInsets.all(2),
                            child: pw.Text(opt.code)),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(2),
                            child: pw.Text(opt.name)),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(2),
                            child: pw.Text(opt.tags.join(", "))),
                        // pw.Padding(padding: pw.EdgeInsets.all(2), child: pw.Text(opt.prices.map((p) => p.toStringAsFixed(2)).join("   "))),
                      ],
                    );
                  }).toList(),
                ],
              ),
              pw.SizedBox(height: 15),
            ],
          )
        ],
      ),
    );
  }

  return pdf;
}

Future<void> captureAndSaveImage(GlobalKey globalKey) async {
  try {
    // RenderRepaintBoundary boundary =
    //     _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Tạo blob và tạo link download
    final blob = html.Blob([pngBytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..download = "menu_image.png" // tên file tải về
      ..click();
    html.Url.revokeObjectUrl(url);

    print('✅ Ảnh đã tải xuống thành công!');
  } catch (e) {
    print('❌ Lỗi: $e');
  }
}
