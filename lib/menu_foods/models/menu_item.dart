class MenuOption {
  final String code; // a, b, c
   String name; // Hühnerbrust / Chicken
   String descriptionDe;
   String descriptionEn;
  final List<String> tags; // A, B, F
  String prices1;
  String prices2;

  MenuOption({
    required this.code,
    required this.name,
    this.descriptionDe = '',
    this.descriptionEn = '',
    required this.tags,
    this.prices1 = '',
    required this.prices2,
  });
  MenuOption copy() => MenuOption(
        code: code,
        name: name,
        tags: List.from(tags),
        prices1: prices1,
        prices2: prices2,
      );
}

class MenuItem {
  final String id;
  final String? subText;
  final bool? subIcon;
  final String title;
  String descriptionDe;
  String descriptionEn;
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
  MenuItem copy() => MenuItem(
        id: id,
        title: title,
        descriptionDe: descriptionDe,
        descriptionEn: descriptionEn,
        subText: subText,
        subIcon: subIcon,
        options: options.map((e) => e.copy()).toList(),
      );
}

class MenuSection {
  final String title;
  final List<MenuItem> items;

  MenuSection({required this.title, required this.items});
}
