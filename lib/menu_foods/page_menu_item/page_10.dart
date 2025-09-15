// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_0.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_1.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_2.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_3.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_4.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_5.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_6.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_7.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_8.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_9.dart';

class PageMenu10 extends StatelessWidget {
  final List<GlobalKey> captureKeys;
  const PageMenu10({super.key, required this.captureKeys});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 👉 user view: zoom
        InteractiveViewer(
          minScale: 0.5,
          maxScale: 3.0,
          boundaryMargin: const EdgeInsets.all(50),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                final page = [
                  const PageMenu1(),
                  const PageMenu2(),
                  const PageMenu3(),
                  const PageMenu4(),
                  const PageMenu5(),
                ][index];
                return RepaintBoundary(
                  key: captureKeys[index],
                  child: SizedBox(width: 450, height: 800, child: page),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}

class PageMenu11 extends StatelessWidget {
  final List<GlobalKey> captureKeys;
  const PageMenu11({super.key, required this.captureKeys});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 👉 user view: zoom
        InteractiveViewer(
          minScale: 0.5,
          maxScale: 3.0,
          boundaryMargin: const EdgeInsets.all(50),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                final page = [
                  const PageMenu6(),
                  const PageMenu7(),
                  const PageMenu8(),
                  const PageMenu9(),
                  const PageMenu0(),
                ][index];
                return RepaintBoundary(
                  key: captureKeys[index],
                  child: SizedBox(width: 450, height: 800, child: page),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
