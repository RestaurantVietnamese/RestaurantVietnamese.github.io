import 'package:flutter/material.dart';

class MenuOption {
  final String code; // a, b, c
  final String name; // Hühnerbrust / Chicken
  final String descriptionDe;
  final String descriptionEn;
  final List<String> tags; // A, B, F
  final String prices1;
  final String prices2;

  MenuOption({
    required this.code,
    required this.name,
    this.descriptionDe = '',
    this.descriptionEn = '',
    required this.tags,
     this.prices1='',
    required this.prices2,
  });
}

class MenuItem {
  final String id;
   final String? subText;
  final IconData? subIcon;
  final String title;
  final String descriptionDe;
  final String descriptionEn;
  final List<MenuOption> options;

  MenuItem({
    required this.id,
    this.subText,
    this.subIcon,
    required this.title,
    required this.descriptionDe,
    required this.descriptionEn,
    required this.options,
  });
}
class MenuSection {
  final String title;
  final List<MenuItem> items;

  MenuSection({required this.title, required this.items});
}

