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

Future<void> editDescription({
  required BuildContext context,
  required MenuItem item,
  required bool isDescriptionDe,
  required Function(void Function()) setState,
}) async {
  final controller = TextEditingController(
    text: isDescriptionDe ? item.descriptionDe : item.descriptionEn,
  );

  final result = await showDialog<String>(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Chỉnh sửa Mô tả"),
      content: TextField(
        controller: controller,
        // keyboardType: TextInputType.number,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(hintText: "Nhập mô tả mới"),
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
      if (isDescriptionDe) {
        item.descriptionDe = result;
      } else {
        item.descriptionEn = result;
      }
    });
  }
}

Future<void> editDescriptionOption({
  required BuildContext context,
  required MenuOption option,
  required bool isDescriptionDe,
  required Function(void Function()) setState,
}) async {
  final controller = TextEditingController(
    text: isDescriptionDe ? option.descriptionDe : option.descriptionEn,
  );

  final result = await showDialog<String>(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Chỉnh sửa Mô tả"),
      content: TextField(
        controller: controller,
        // keyboardType: TextInputType.number,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(hintText: "Nhập mô tả mới"),
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
      if (isDescriptionDe) {
        option.descriptionDe = result;
      } else {
        option.descriptionEn = result;
      }
    });
  }
}

Future<void> editName({
  required BuildContext context,
  required MenuOption option,
  required Function(void Function()) setState,
}) async {
  final controller = TextEditingController(
    text: option.name,
  );

  final result = await showDialog<String>(
    context: context,
    builder: (_) => AlertDialog(
      title: Text("Chỉnh sửa"),
      content: TextField(
        controller: controller,
        // keyboardType: TextInputType.number,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(hintText: "Nhập nội dung mới"),
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
      option.name = result;
    });
  }
}
