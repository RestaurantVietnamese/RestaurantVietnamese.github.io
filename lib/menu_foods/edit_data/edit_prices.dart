// Global function to edit price that can be used across the app
import 'package:puzzel/menu_foods/models/menu_item.dart';
import 'package:flutter/material.dart';

Future<void> editPrice({
  required BuildContext context,
  required MenuOption option,
  required bool isPrice1,
  required Function(void Function()) setState,
}) async {
  final controller = TextEditingController(
    text: isPrice1 ? option.prices1 : option.prices2,
  );

  final result = await showDialog<String>(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Chỉnh sửa giá"),
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(hintText: "Nhập giá mới"),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Hủy"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, controller.text),
          child: Text("Lưu"),
        ),
      ],
    ),
  );

  if (result != null) {
    setState(() {
      if (isPrice1) {
        option.prices1 = result;
      } else {
        option.prices2 = result;
      }
    });
  }
}
