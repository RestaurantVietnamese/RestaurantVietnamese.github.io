import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/models/menu_item.dart';
import 'package:puzzel/menu_foods/string_content_menu.dart';

final menuItems_Page6 = [
  MenuItem(
    id: "23",
    subText: '',
    title: "Unagt",
    descriptionDe: "Reis mit Gemüse in Unagt Soße. Auswahl mit:",
    descriptionEn: "Rice with vegetables, a curry sauce. Selection with:",
    options: [
      MenuOption(
        code: "a.",
        name:
            "Hühnerbrust (paniert (A) / unpaniert) / Chicken (breaded / nonbreaded)",
        tags: [],
        prices2: "13.50",
      ),
      MenuOption(
        code: "c.",
        name: "Entenbrust / Duck",
        tags: ['A'],
        prices2: "16.00",
      ),
    ],
  ),
  MenuItem(
    id: "27",
    subText: '',
    title: "Pad Thai",
    descriptionDe:
        "Gebratene Reisbandnudeln mit Gemüse, Limette,\nKoriander, Erdnüssen, Röstzwiebeln. Auswahl mit:",
    descriptionEn:
        "Fried flat rice noodles with vegetables, lime, coriander,\npeanuts, fried onions. Selection with:",
    options: [
      MenuOption(
        code: "a.",
        name: "Hühnerbrust / Chicken",
        tags: ["E"],
        prices2: "14.50",
      ),
      MenuOption(
        code: "b.",
        name: "Rinderfilet / Beef",
        tags: ["E"],
        prices2: "15.50",
      ),
      MenuOption(
        code: "c.",
        name: "Tofu",
        tags: ["F", "E"],
        prices2: "13.50",
      ),
      MenuOption(
        code: "d.",
        name: "Garnelen / Shrimp",
        tags: ["B", "E"],
        prices2: "17.50",
      ),
    ],
  ),
  MenuItem(
    id: "28",
    subText: '',
    title: "Bun Thai Xao",
    descriptionDe:
        "Gebratene Reisnudeln mit saisonalem Gemüse,\nThai Soße, Paprika, Zwiebeln, Lauch. Auswahl mit:",
    descriptionEn:
        "Fried rice noodles with seasonal vegetables,\nThai sauce, paprika, onions, leeks. Selection with:",
    options: [
      MenuOption(
        code: "a.",
        name: "Gemüse / Vegetables",
        tags: [],
        prices2: "13.50",
      ),
      MenuOption(
        code: "b.",
        name: "Hühnerbrust / Chicken",
        tags: [],
        prices2: "14.50",
      ),
      MenuOption(
        code: "c.",
        name: "Rinderfilet / Beef",
        tags: [],
        prices2: "15.50",
      ),
      MenuOption(
        code: "d.",
        name: "Garnelen / Shrimp",
        tags: ["B"],
        prices2: "17.50",
      ),
    ],
  ),
  MenuItem(
    id: "29",
    subText: '',
    title: "Xao Sa Ot",
    descriptionDe:
        "Reis mit Zitronengras, Knoblauch, Zwiebeln, Paprika, Lauch.",
    descriptionEn:
        "Rice with lemongrass, garlic, onions, paprika, leek. Selection with:",
    options: [
      MenuOption(
        code: "a.",
        name: "Hühnerbrust / Chicken",
        tags: [],
        prices2: "14.50",
      ),
      MenuOption(
        code: "b.",
        name: "Garnelen / Shrimp",
        tags: ["B"],
        prices2: "17.50",
      ),
    ],
  ),
  MenuItem(
    id: "30",
    subText: '',
    title: "Bun Nem",
    descriptionDe:
        "Reisnudeln mit Frühlingsrollen, Salat, Karotten,\nErdnüssen, Röstzwiebeln und vietnamesischer Fischsoße",
    descriptionEn:
        "Rice noodles with spring rolls, lettuce, carrots, peanuts,\nfried onions and Vietnamese fish sauce",
    options: [
      MenuOption(
        code: "",
        name: "",
        tags: ["E", "D"],
        prices2: "14.00",
      )
    ],
  ),
  MenuItem(
    id: "31",
    subText: '',
    title: "Bun Bo Nan Bo",
    descriptionDe:
        "Reisnudeln mit gebratenem Rindfleisch,\nSalat, Knoblauch, Zwiebeln, Karotten, Bohnensprossen, Röstzwiebeln und vietnamesischer Fischsoße",
    descriptionEn:
        "Rice noodles with fried beef, lettuce, garlic, onions, carrots, bean sprouts, fried onions and Vietnamese fish sauce",
    options: [
      MenuOption(
        code: "",
        name: "",
        tags: ["D"],
        prices2: "16.50",
      )
    ],
  ),
];
