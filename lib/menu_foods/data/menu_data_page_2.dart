import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/models/menu_item.dart';
import 'package:puzzel/menu_foods/string_content_menu.dart';

final menuItems_Page2 = [
  MenuItem(
    id: "7",
    subText: '2 Stk.',
    title: "Summerroll",
    descriptionDe:
        "Reispapier gefüllt mit Kräutersalat, Gurke, Paprika,\nEier, Reisnudeln, dazu Hoisin Soße. Auswahl mit:",
    descriptionEn:
        "Rice paper filled with herb salad, cucumber, paprika,\neggs, rice noodles, with Hoisin sauce. Selection with:",
    options: [
      MenuOption(
          code: "a.",
          name: "Tempura Chicken",
          tags: ["A", "C", "F"],
          prices2: "6.50"),
      MenuOption(code: "c.", name: cSelect, tags: ["C", "F"], prices2: "6.50"),
      MenuOption(
          code: "d.",
          name: "Garnelen / Shrimp",
          tags: ["B", "C", "F"],
          prices2: "7.00"),
    ],
  ),
  MenuItem(
    id: "8",
    subText: '2 Stk.',
    title: "Nem Ran",
    descriptionDe:
        "Hausgemachte Frühlingsrollen mit Hackfleisch,\nGlasnudeln, Karotten, Zwiebeln in knusprigem Reispapier gerollt",
    descriptionEn:
        "Homemade spring rolls with minced meat, glass noodles,\ncarrots, onions rolled in crispy rice paper",
    options: [
      MenuOption(code: "", name: '', tags: [""], prices1: '', prices2: '6.50'),
    ],
  ),
  MenuItem(
      id: "9",
      subText: '5 Stk.',
      title: "Wan Tan Tashen",
      descriptionDe: "Gefüllt mit Hackfleisch, Knoblauch, Zwiebeln, Pfeffer",
      descriptionEn:
          "Wonton dough filled with minced meat, garlic, onions, pepper",
      options: [
        MenuOption(code: "", name: "", tags: ["A"], prices2: "5.50")
      ]),
  MenuItem(
      id: "10",
      subText: '6 Stk.',
      title: "Tom Chien",
      descriptionDe: "Garnelen mit Tempura Mantel, Sweet Sour Chili Soße",
      descriptionEn: "Shrimp with tempura coating with sweet sour chili sauce",
      options: [
        MenuOption(code: "", name: "", tags: ["A", "B"], prices2: "8.00")
      ]),
  MenuItem(
      id: "11",
      title: "Vorspeisen Mix",
      descriptionDe:
          "Eine Mischung aus Wan Tan Tashen,\nTom Chien und Nem Chay Mini",
      descriptionEn: "A mix of wonton, Tom Chien and Nem Chay Mini",
      options: [
        MenuOption(code: "", name: "", tags: ["A", "B"], prices2: "9.00")
      ]),
  MenuItem(
      id: "12",
      subText: '8 Stk.',
      title: "Nem Chay Mini",
      descriptionDe:
          "Vegetarische Herbstrollen gefüllt mit\nKarotten, Bohnen, Zwiebeln, Pilzen",
      descriptionEn:
          "Vegetarian autumn rolls filled with carrots, beans, onions, mushrooms",
      options: [
        MenuOption(code: "", name: "", tags: ["A"], prices2: "5.50")
      ]),
  MenuItem(
      id: "13",
      subText: '6 Stk.',
      title: "Vantastic Tom",
      descriptionDe:
          "Meeresfrüchte auf Sojabasis\nim Tempuramantel, Süß-Sauer-Soße",
      descriptionEn:
          "Soy-based seafood with tempura coating with sweet sour sauce",
      options: [
        MenuOption(code: "", name: "", tags: ["A", "F"], prices2: "6.00")
      ])
];
