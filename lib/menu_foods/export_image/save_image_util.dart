import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/export_image/web_utils.dart'
    if (dart.library.io) 'package:puzzel/menu_foods/export_image/mobile_utils.dart';

// Note: 'package:puzzel/' is the prefix you use in your project.

Future<void> saveImage(GlobalKey key, PageController controller) async {
  await WidgetsBinding.instance.endOfFrame;
  if (controller.hasClients) {
    final p = controller.page ?? controller.initialPage.toDouble();
    final target = p.round();
    if ((p - target).abs() > 0.001) {
      await controller.animateToPage(
        target,
        duration: const Duration(milliseconds: 1),
        curve: Curves.linear,
      );
      await WidgetsBinding.instance.endOfFrame;
    }
  }
  await captureAndSaveImage(key);
}

