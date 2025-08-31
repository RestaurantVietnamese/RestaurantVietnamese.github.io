import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/models/menu_item.dart';
import 'package:puzzel/menu_foods/string_content_menu.dart';

final menuItems_Page1 = [
  MenuItem(
    id: '1',
    title: "Pho Hanoi",
    descriptionDe:
        "Reisbandnudelsuppe mit Ingwer, Lauchzwiebeln, Koriander, Basilikum und Fleischbrühe. Auswahl mit:",
    descriptionEn:
        "Flat rice noodle soup with ginger, spring onions, coriander, basil and meat broth. Selection with:",
    options: [
      MenuOption(
          code: "a.",
          name: aSelect,
          tags: [],
          prices300: '8.50',
          prices750: '13.50'),
      MenuOption(
          code: "b.",
          name: bSelect,
          tags: [],
          prices300: '9.00',
          prices750: '15.00'),
      MenuOption(
          code: "c.",
          name: cSelect,
          tags: ["F"],
          prices300: '',
          prices750: '13.00'),
    ],
  ),
  MenuItem(
    id: '2',
    title: "Udon Suppe",
    descriptionDe: "Udon Nudeln mit Hühnerbrühe und Lauchzwiebeln",
    descriptionEn: "Udon noodles with chicken broth and spring onions",
    options: [
      MenuOption(
          code: "a.",
          name: aSelect,
          tags: ["A"],
          prices300: '',
          prices750: '6.50'),
      MenuOption(
          code: "c.",
          name: cSelect,
          tags: ["F"],
          prices300: '',
          prices750: '5.50'),
      MenuOption(
          code: "d.",
          name: dSelect,
          tags: ["A", "B"],
          prices300: '',
          prices750: '8.00'),
    ],
  ),
  MenuItem(
    id: '3',
    title: "Miso Suppe",
    descriptionDe: "Suppe mit Gemuse, Tofu, Seetang",
    descriptionEn: "Soup with various vegetables, tofu, seaweed",
    options: [
      MenuOption(
          code: "", name: "", tags: ["F"], prices300: '', prices750: '5.50'),
    ],
  ),
  MenuItem(
    id: '4',
    title: "Tom Kha Suppe",
    descriptionDe: "Thai Kokos-Suppe mit Gemuse. Auswahl mit:",
    descriptionEn: "Thai coconut soup with vegetables. Selection with:",
    options: [
      MenuOption(
          code: "a.",
          name: aSelect,
          tags: [""],
          prices300: '6.50',
          prices750: '12.50'),
      MenuOption(
          code: "c.",
          name: cSelect,
          tags: [""],
          prices300: '5.50',
          prices750: ''),
      MenuOption(
          code: "d.",
          name: dSelect,
          tags: ["B"],
          prices300: '8.00',
          prices750: '12.50'),
    ],
  ),
  MenuItem(
    id: '5',
    title: "My Tom (500 ml)",
    descriptionDe: "Thai Kokos-Suppe mit Gemuse. Auswahl mit:",
    descriptionEn: "My Tom noodles with chicken broth and spring onions.",
    options: [
      MenuOption(
          code: "a.",
          name: aSelect,
          tags: ["A"],
          prices300: '',
          prices750: '8.00'),
      MenuOption(
          code: "b.",
          name: bSelect,
          tags: ["A"],
          prices300: '',
          prices750: '9.00'),
      MenuOption(
          code: "d.",
          name: dSelect,
          tags: ["A", "B"],
          prices300: '',
          prices750: '10.00'),
    ],
  ),
  MenuItem(
    id: '6',
    title: "Vegan Wan Tan Suppe",
    descriptionDe:
        "Wan Tan Teibglatter gefulltmit\nGemuse und Fleisch auf Sojabasis",
    descriptionEn:
        "Wonton pastry sheets filled with vegetables and plant-based meat",
    options: [
      MenuOption(
          code: "",
          name: '',
          tags: ["A", 'F'],
          prices300: '',
          prices750: '6.00'),
    ],
  )
];

final menuItems_Page2 = [
  MenuItem(
    id: "7",
    subText: '2 Stk.',
    title: "Summerroll",
    descriptionDe:
        "Reispapier gefüllt mit Kräutersalat, Gurke, Paprika, Eier, Reisnudeln, dazu Hoisin Soße. Auswahl mit:",
    descriptionEn:
        "Rice paper filled with herb salad, cucumber, paprika, eggs, rice noodles, with Hoisin sauce. Selection with:",
    options: [
      MenuOption(
          code: "a.",
          name: "Tempura Chicken",
          tags: ["A", "C", "F"],
          prices750: "6.50"),
      MenuOption(
          code: "c.", name: cSelect, tags: ["C", "F"], prices750: "6.00"),
      MenuOption(
          code: "d.",
          name: "Garnelen / Shrimp",
          tags: ["B", "C", "F"],
          prices750: "7.00"),
    ],
  ),
  MenuItem(
    id: "8",
    subText: '2 Stk.',
    title: "Nem Ran",
    descriptionDe:
        "Hausgemachte Frühlingsrollen mit Hackfleisch, Glasnudeln, Karotten, Zwiebeln in knuspriges Reispapier gerollt",
    descriptionEn:
        "Homemade spring rolls with minced meat, glass noodles, carrots, onions rolled in crispy rice paper",
    options: [
      MenuOption(
          code: "", name: '', tags: [""], prices300: '', prices750: '6.00'),
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
        MenuOption(code: "", name: "", tags: ["A"], prices750: "5.00")
      ]),
  MenuItem(
      id: "10",
      subText: '6 Stk.',
      title: "Tom Chien",
      descriptionDe: "Garnelen mit Tempura Mantel, Sweet Sour Chili Soße",
      descriptionEn: "Shrimp with tempura coating with sweet sour chili sauce",
      options: [
        MenuOption(code: "", name: "", tags: ["A", "B"], prices750: "8.00")
      ]),
  MenuItem(
      id: "11",
      title: "Vorspeisen Mix",
      descriptionDe:
          "Eine Mischung aus Wan Tan Tashen, Tom Chien und Nem Chay Mini",
      descriptionEn: "A mix of wonton, Tom Chien and Nem Chay Mini",
      options: [
        MenuOption(code: "", name: "", tags: ["A", "B"], prices750: "9.00")
      ]),
  MenuItem(
      id: "12",
      subText: '8 Stk.',
      title: "Nem Chay Mini",
      descriptionDe:
          "Vegetarische Herbstrollen gefüllt mit Karotten, Bohnen, Zwiebeln, Pilzen",
      descriptionEn:
          "Vegetarian autumn rolls filled with carrots, beans, onions, mushrooms",
      options: [
        MenuOption(code: "", name: "", tags: ["A"], prices750: "5.50")
      ]),
  MenuItem(
      id: "13",
          subText: '6 Stk.',
      title: "Vantastic Tom",
      descriptionDe:
          "Meeresfrüchte auf Sojabasis im Tempuramantel, Süß-Sauer-Soße",
      descriptionEn:
          "Soy-based seafood with tempura coating with sweet sour sauce",
      options: [
        MenuOption(code: "", name: "", tags: ["A", "F"], prices750: "6.00")
      ])
];
