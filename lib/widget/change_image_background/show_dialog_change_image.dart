import 'package:flutter/material.dart';

Future<String?> showInputDialog({
  required BuildContext context,
  String title = 'Nhập link',
  String hintText = 'https://example.com',
  String confirmText = 'OK',
  String cancelText = 'Hủy',
}) async {
  final controller = TextEditingController();

  final result = await showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: hintText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, controller.text.trim());
            },
            child: Text(confirmText),
          ),
        ],
      );
    },
  );

  return result; // Trả về null nếu nhấn Hủy hoặc chuỗi nếu nhấn OK
}
