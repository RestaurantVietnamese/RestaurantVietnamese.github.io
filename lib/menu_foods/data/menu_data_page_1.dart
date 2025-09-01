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
          prices1: '8.50',
          prices2: '13.50'),
      MenuOption(
          code: "b.",
          name: bSelect,
          tags: [],
          prices1: '9.00',
          prices2: '15.00'),
      MenuOption(
          code: "c.",
          name: cSelect,
          tags: ["F"],
          prices1: '',
          prices2: '13.00'),
    ],
  ),
  MenuItem(
    id: '2',
    title: "Udon Suppe",
    descriptionDe: "Udon Nudeln mit Hühnerbrühe und Lauchzwiebeln",
    descriptionEn: "Udon noodles with chicken broth and spring onions",
    options: [
      MenuOption(
          code: "a.", name: aSelect, tags: ["A"], prices1: '', prices2: '6.50'),
      MenuOption(
          code: "c.", name: cSelect, tags: ["F"], prices1: '', prices2: '5.50'),
      MenuOption(
          code: "d.",
          name: dSelect,
          tags: ["A", "B"],
          prices1: '',
          prices2: '8.00'),
    ],
  ),
  MenuItem(
    id: '3',
    title: "Miso Suppe",
    descriptionDe: "Suppe mit Gemuse, Tofu, Seetang",
    descriptionEn: "Soup with various vegetables, tofu, seaweed",
    options: [
      MenuOption(code: "", name: "", tags: ["F"], prices1: '', prices2: '5.50'),
    ],
  ),
  MenuItem(
    id: '4',
    title: "Tom Kha Suppe",
    subIcon: true,
    descriptionDe: "Thai Kokos-Suppe mit Gemuse. Auswahl mit:",
    descriptionEn: "Thai coconut soup with vegetables. Selection with:",
    options: [
      MenuOption(
          code: "a.",
          name: aSelect,
          tags: [""],
          prices1: '6.50',
          prices2: '12.50'),
      MenuOption(
          code: "c.", name: cSelect, tags: [""], prices1: '5.50', prices2: ''),
      MenuOption(
          code: "d.",
          name: dSelect,
          tags: ["B"],
          prices1: '8.00',
          prices2: '12.50'),
    ],
  ),
  MenuItem(
    id: '5',
    title: "My Tom (500 ml)",
    descriptionDe: "Thai Kokos-Suppe mit Gemuse. Auswahl mit:",
    descriptionEn: "My Tom noodles with chicken broth and spring onions.",
    options: [
      MenuOption(
          code: "a.", name: aSelect, tags: ["A"], prices1: '', prices2: '8.00'),
      MenuOption(
          code: "b.", name: bSelect, tags: ["A"], prices1: '', prices2: '9.00'),
      MenuOption(
          code: "d.",
          name: dSelect,
          tags: ["A", "B"],
          prices1: '',
          prices2: '10.00'),
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
          code: "", name: '', tags: ["A", 'F'], prices1: '', prices2: '6.00'),
    ],
  )
];
