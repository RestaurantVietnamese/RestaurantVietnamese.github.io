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
  final GlobalKey captureKey;
  const PageMenu10({super.key, required this.captureKey});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: captureKey,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            SizedBox(width: 450, height: 800, child: PageMenu1()),
            SizedBox(width: 450, height: 800, child: PageMenu2()),
            SizedBox(width: 450, height: 800, child: PageMenu3()),
            SizedBox(width: 450, height: 800, child: PageMenu4()),
            SizedBox(width: 450, height: 800, child: PageMenu5()),
          ],
        ),
      ),
    );
  }
}

class PageMenu11 extends StatelessWidget {
  final GlobalKey captureKey;
  const PageMenu11({super.key, required this.captureKey});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: captureKey,
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 450, height: 800, child: PageMenu6()),
            SizedBox(width: 450, height: 800, child: PageMenu7()),
            SizedBox(width: 450, height: 800, child: PageMenu8()),
            SizedBox(width: 450, height: 800, child: PageMenu9()),
            SizedBox(width: 450, height: 800, child: PageMenu0()),
          ],
        ),
      ),
    );
  }
}
