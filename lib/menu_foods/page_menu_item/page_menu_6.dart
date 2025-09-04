// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_6.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_7.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_8.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_9.dart';

class PageMenu6 extends StatelessWidget {
  const PageMenu6({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      boundaryMargin: EdgeInsets.all(100),
      minScale: 0.1, // zoom nhỏ hơn để vừa khung
      maxScale: 3.0,
      child: FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.topLeft,
        child: Container(
          width: 450,
          height: 800,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 0.1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 10,
              // ),
              // SizedBox(
              //   height: 3,
              // ),
              Expanded(
                child: ListView(
                  children: [
                    for (var i = 0; i < menuItems_Page6.length; i++) ...[
                      // Widget cho item hiện tại
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 450,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.transparent),
                          ),
                          // padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: (menuItems_Page6[i].id == '30')
                              ? MenuItemWidget8(
                                  item: menuItems_Page6[i],
                                  usePadding: false,
                                  usePaddingPage6: true,
                                )
                              : (menuItems_Page6[i].id == '31')
                                  ? MenuItemWidget9(
                                      item: menuItems_Page6[i],
                                      usePadding: false,
                                      usePaddingPage6: false,
                                    )
                                  : MenuItemWidget7(
                                      item: menuItems_Page6[i],
                                      usePadding: false,
                                      useLineHeight: false,
                                      usePaddingPage6: true,
                                    ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
