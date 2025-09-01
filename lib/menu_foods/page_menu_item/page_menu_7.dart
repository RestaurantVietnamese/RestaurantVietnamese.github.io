// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_7.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_7.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_8.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_9.dart';

class PageMenu7 extends StatelessWidget {
  const PageMenu7({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            children: [
              for (var i = 0; i < menuItems_Page7.length; i++) ...[
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
                      padding: menuItems_Page7[i].title == 'Salmon Bowl'
                          ? EdgeInsets.only(left: 10, right: 0)
                          : EdgeInsets.symmetric(horizontal: 10),
                      child: (menuItems_Page7[i].id == '32')
                          ? MenuItemWidget8(
                              item: menuItems_Page7[i],
                              usePadding: false,
                            )
                          : (menuItems_Page7[i].id == '38')
                              ? MenuItemWidget7(item: menuItems_Page7[i])
                              : MenuItemWidget9(
                                  item: menuItems_Page7[i],
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
