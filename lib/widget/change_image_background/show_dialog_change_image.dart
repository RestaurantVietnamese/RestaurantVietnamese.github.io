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
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade400)),
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
