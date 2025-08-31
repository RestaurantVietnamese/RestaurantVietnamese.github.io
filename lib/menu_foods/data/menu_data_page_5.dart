import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/models/menu_item.dart';
import 'package:puzzel/menu_foods/string_content_menu.dart';

final menuItems_Page5 = [
  MenuItem(
    id: "22",
    subText: '',
    title: "Süß & Sauer",
    descriptionDe:
        "Reis mit Gemüse in einer Süß-Sauer-Soße gekocht aus Ananas, Äpfeln, Orangen, Tomatenmark. Auswahl mit:",
    descriptionEn:
        "Rice with vegetables, a sweet and sour sauce cooked from pineapples, apples, oranges, tomato paste. Selection with:",
    options: [
      MenuOption(
        code: "a.",
        name: "Panierte Hühnerbrust / Breaded Chicken",
        tags: ["A"],
        prices2: "13.50",
      ),
      MenuOption(
        code: "c.",
        name: "Entenbrust / Duck",
        tags: ["A"],
        prices2: "16.00",
      ),
      MenuOption(
        code: "e.",
        name: "Fischfilet paniert / Breaded Fish",
        tags: ["A", "D"],
        prices2: "17.00",
      ),
    ],
  ),
  MenuItem(
    id: "24",
    subText: '',
    title: "Gebratene Nudeln",
    descriptionDe: "Mit saisonalem Gemüse und Ei. Auswahl mit:",
    descriptionEn: "With seasonal vegetables and eggs. Selection with:",
    options: [
      MenuOption(
        code: "g.",
        name: "Gemüse / Vegetables",
        tags: ["A"],
        prices2: "12.50",
      ),
      MenuOption(
        code: "a.",
        name:
            "Hühnerbrust (paniert (A)/unpaniert) / Chicken (breaded/nonbreaded)",
        tags: ["A", "C"],
        prices2: "13.50",
      ),
      MenuOption(
        code: "c.",
        name: "Entenbrust / Duck",
        tags: ["A", "C"],
        prices2: "16.00",
      ),
    ],
  ),
  MenuItem(
    id: "25",
    subText: '',
    title: "Gebratener Reis",
    descriptionDe: "Mit saisonalem Gemüse und Ei. Auswahl mit:",
    descriptionEn: "With seasonal vegetables and eggs. Selection with:",
    options: [
      MenuOption(
        code: "g.",
        name: "Gemüse / Vegetables",
        tags: ["A"],
        prices2: "12.50",
      ),
      MenuOption(
        code: "a.",
        name:
            "Hühnerbrust (paniert (A)/unpaniert) / Chicken (breaded/nonbreaded)",
        tags: ["C"],
        prices2: "13.50",
      ),
      MenuOption(
        code: "c.",
        name: "Entenbrust / Duck",
        tags: ["A", "C"],
        prices2: "16.00",
      ),
    ],
  ),
  MenuItem(
    id: "26",
    subText: '',
    title: "Udon Nudeln",
    descriptionDe:
        "Gebratene Udon Nudeln mit Paprika, Lauch, Knoblauch und Zwiebeln. Auswahl mit:",
    descriptionEn:
        "Fried udon noodles with peppers, leek, garlic and onions. Selection with:",
    options: [
      MenuOption(
        code: "g.",
        name: "Gemüse / Vegetables",
        tags: ["A"],
        prices2: "13.50",
      ),
      MenuOption(
        code: "a.",
        name: "Hühnerbrust / Chicken",
        tags: ["A"],
        prices2: "14.00",
      ),
      MenuOption(
        code: "c.",
        name: "Entenbrust / Duck",
        tags: ["A", "C"],
        prices2: "17.00",
      ),
    ],
  ),
];
