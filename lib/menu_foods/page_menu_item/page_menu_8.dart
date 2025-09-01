// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_8.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_10.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_7.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_9.dart';

class PageMenu8 extends StatelessWidget {
  const PageMenu8({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            children: [
              for (var i = 0; i < menuItems_Page8.length; i++) ...[
                // Widget cho item hiện tại
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                        border: Border.all(color: Colors.transparent),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child:
                          // (menuItems_Page8[i].id == '32')
                          //     ? MenuItemWidget8(
                          //         item: menuItems_Page8[i],
                          //         usePadding: false,
                          //       )
                          //     :
                          (menuItems_Page8[i].id == '40' ||
                                  menuItems_Page8[i].id == '41' ||
                                  menuItems_Page8[i].id == '42')
                              ? MenuItemWidget7(item: menuItems_Page8[i])
                              : (menuItems_Page8[i].id == '43' ||
                                      menuItems_Page8[i].id == '44' ||
                                      menuItems_Page8[i].id == '45' ||
                                      menuItems_Page8[i].id == '46' ||
                                      menuItems_Page8[i].id == '47')
                                  ? MenuItemWidget10(item: menuItems_Page8[i])
                                  : MenuItemWidget9(
                                      item: menuItems_Page8[i],
                                      usePadding: false,
                                      menuPage7: true,
                                    )),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
