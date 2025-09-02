import 'package:puzzel/menu_foods/models/menu_item.dart';

final menuItems_Page3 = [
  MenuItem(
    id: "14",
    subText: '',
    title: "Salat",
    descriptionDe:
        "Kirschtomaten, Karotten, Gurke, Champignons.\nDazu feines Joghurt oder Balsamico Dressing. Auswahl mit:",
    descriptionEn:
        "Cherry tomatoes, carrots, cucumber, mushrooms, with fine yogurt (G) or balsamic dressing. Selection with:",
    options: [
      MenuOption(
          code: "a.",
          name: "Hühnersteak / Chicken",
          tags: [],
          prices2: "11.00"),
      MenuOption(
          code: "b.", name: "Rinderfilet / Beef", tags: [], prices2: "12.00"),
      MenuOption(
          code: "c.",
          name: "Blattsalat gemischt / mixed salad",
          tags: [],
          prices2: "9.00"),
      MenuOption(
          code: "d.", name: "Garnelen / Shrimp", tags: ["B"], prices2: "13.00"),
    ],
  ),
  MenuItem(
    id: "15",
    subText: '',
    title: "Seetang Salat",
    descriptionDe: "",
    descriptionEn: "",
    options: [
      MenuOption(code: "", name: "", tags: [], prices2: "9.50"),
    ],
  ),
  MenuItem(
    id: "16",
    subText: '',
    subIcon: true,
    title: "Rotes That-Curry",
    descriptionDe:
        "Res mit Gemüse in einer Curry Soße gekocht aus Zitronengras, Zitronenbäffler, Großer Galgant, Kokosmilch, Chili. Auswahl mit:",
    descriptionEn:
        "Rice with vegetables, a curry sauce cooked from lemongrass, lemon leaves, great galangal, coconut milk, chilli. Selection with:",
    options: [
      MenuOption(
        code: "a.",
        name:
            "Hühnerbrust (paniert (A) / unpaniert) / Chicken (breaded / nonbreaded)",
        tags: [""],
        prices2: "13.50",
      ),
      MenuOption(
        code: "b.",
        name: "Rinderfilet / Beef",
        tags: [],
        prices2: "14.00",
      ),
      MenuOption(
        code: "c.",
        name: "Enterbrust / Duck",
        tags: ['A'],
        prices2: "16.00",
      ),
      MenuOption(
        code: "d.",
        name: "Garnelen / Shrimp",
        tags: ['B'],
        prices2: "17.00",
      ),
    ],
  ),
  MenuItem(
    id: "17",
    subText: '',
    subIcon: true,
    title: "Gold That-Curry",
    descriptionDe:
        "Reis mit Gemüse in einer Curry Soße gekocht aus Zitronengras, Kurkuma, Großer Galgant, Koriander, Kokosmilch, Chili. Auswahl mit:",
    descriptionEn:
        "Rice with vegetables, a curry sauce cooked from lemongrass, turm-eric, great galangal, coriander, coconut milk, chili. Selection with:",
    options: [
      MenuOption(
        code: "a.",
        name: "Hühnerbrust / Chicken",
        tags: [""],
        prices2: "13.00",
      ),
      MenuOption(
        code: "c.",
        name: "Entenbrust / Duck",
        tags: ["A"],
        prices2: "16.00",
      ),
      MenuOption(
        code: "e.",
        name: "Lachs / Salmon",
        tags: ['D'],
        prices2: "17.00",
      ),
    ],
  ),
];
