import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/export_image/web_utils.dart'
    if (dart.library.io) 'package:puzzel/menu_foods/export_image/mobile_utils.dart';

// Note: 'package:puzzel/' is the prefix you use in your project.

Future<void> saveImage(GlobalKey globalKey) async {
  await captureAndSaveImage(globalKey);
}

const double kMobileMaxWidth = 600.0;
