import 'package:puzzel/menu_foods/models/menu_item.dart';

final menuItems_Page4 = [
  MenuItem(
    id: "18",
    subText: '',
    subIcon: true,
    title: "Mango Curry",
    descriptionDe:
        "Reis mit Gemüse in einer Currysoße gekocht aus\nMangopüree, Currypaste, Kokosmilch. Auswahl mit:",
    descriptionEn:
        "Rice with vegetables, a curry sauce cooked from mango puree,\ncurry paste, coconut milk. Selection with:",
    options: [
      MenuOption(
        code: "a.",
        name:
            "Hühnerbrust (paniert (A) / unpaniert) / Chicken (breaded / nonbreaded)",
        tags: [""],
        prices2: "13.00",
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
      MenuOption(
        code: "e.",
        name: "Lachs / Salmon",
        tags: ['D'],
        prices2: "17.00",
      ),
    ],
  ),
  MenuItem(
    id: "19",
    subText: '',
    title: "Chopsuey",
    descriptionDe:
        "Reis mit Gemüse, Austernsoße, Knoblauch und Sojasoße. Auswahl mit:",
    descriptionEn:
        "Rice with vegetables, oyster sauce, garlic and soy sauce.\nSelection with:",
    options: [
      MenuOption(
        code: "a.",
        name: "Hühnerbrust / Chicken",
        tags: ['F'],
        prices2: "13.00",
      ),
      MenuOption(
        code: "b.",
        name: "Rinderfilet / Beef",
        tags: ['F'],
        prices2: "14.00",
      ),
      MenuOption(
        code: "d.",
        name: "Garnelen / Shrimp",
        tags: ["B", "F"],
        prices2: "17.00",
      ),
    ],
  ),
  MenuItem(
    id: "20",
    subText: '',
    subIcon: true,
    title: "Kungpao",
    descriptionDe:
        "Reis mit Gemüse, Holsin Soße, Knoblauch und Sojasoße. Auswahl mit:",
    descriptionEn:
        "Rice with vegetables, holsin sauce, garlic and soy sauce.\nSelection with:",
    options: [
      MenuOption(
        code: "a.",
        name: "Panierte Hühnerbrust /\nBreaded Chicken",
        tags: ['A'],
        prices2: "13.50",
      ),
      MenuOption(
        code: "b.",
        name: "Enterbrust / Duck",
        tags: ['A'],
        prices2: "16.00",
      ),
      MenuOption(
        code: "c.",
        name: "Lachs / Salmon",
        tags: ['D'],
        prices2: "17.00",
      ),
    ],
  ),
  MenuItem(
    id: "21",
    subText: '',
    title: "Erdnuss",
    descriptionDe:
        "Reis mit Gemüse in einer Soße gekocht aus\nErdnüssen, cremiger Erdnussbutter und Kokosmilch.\nAuswahl mit:",
    descriptionEn:
        "Rice with vegetables, a sauce cooked from peanuts,\ncreamy peanut butter and coconut milk. Selection with:",
    options: [
      MenuOption(
        code: "a.",
        name: "Panierte Hühnerbrust /\nBreaded Chicken",
        tags: ['A', "E"],
        prices2: "13.50",
      ),
      MenuOption(
        code: "c.",
        name: "Enterbrust / Duck",
        tags: ['A', "E"],
        prices2: "16.00",
      ),
    ],
  ),
];
