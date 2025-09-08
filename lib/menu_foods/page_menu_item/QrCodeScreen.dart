import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatelessWidget {
  final String link = "https://zamui-restaurant.de"; // Link HTTPS của bạn

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: link, // chuỗi cần mã hóa
      version: QrVersions.auto,
    );
  }
}
