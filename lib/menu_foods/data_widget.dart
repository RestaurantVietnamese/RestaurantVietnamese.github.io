// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_1.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_2.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_3.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_4.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_5.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_6.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_7.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_8.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_9.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class DataWidget extends StatefulWidget {
  final PageController pageController;
  const DataWidget({super.key, required this.pageController});

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  int currentPage = 0;

  // Mapping màu cho từng page (0-based index)
  final List<Color> pageColors = [
    // aBg, // Page 1
    // bBg, // Page 2
    // aBg, // Page 3
    // bBg, // Page 4
    // aBg, // Page 5
    // bBg, // Page 6
    // aBg, // Page 7
    aBg, // Page 8
    bBg, // Page 9
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: pageColors[currentPage], // đổi màu theo page
      width: 450,
      height: 800,
      child: PageView(
        controller: widget.pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: const [
          // PageMenu1(),
          // PageMenu2(),
          // PageMenu3(),
          // PageMenu4(),
          // PageMenu5(),
          // PageMenu6(),
          // PageMenu7(),
          PageMenu8(),
          PageMenu9(),
        ],
      ),
    );
  }
}
