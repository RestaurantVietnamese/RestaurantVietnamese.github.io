// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_1.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_2.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_3.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_4.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_5.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_6.dart';
import 'package:puzzel/menu_foods/page_menu_item/page_menu_7.dart';

class DataWidget extends StatefulWidget {
  // Thêm thuộc tính pageController
  final PageController pageController;
  const DataWidget({
    super.key,
    required this.pageController,
  });

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 5, right: 5),
      // margin: EdgeInsets.only(left: 20, top: 20),
      width: 410,
      height: 800,
      child: PageView(
        // Sử dụng pageController đã được truyền từ trên xuống
        controller: widget.pageController,
        scrollDirection: Axis.horizontal,
        children: [
          PageMenu1(),
          PageMenu7(),
          PageMenu6(),
          PageMenu5(),
          PageMenu4(),
          PageMenu3(),
          PageMenu2(),
        ],
      ),
    );
  }
}
