// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_1.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_5.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_6.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_5.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_6.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_7.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_8.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_9.dart';

class PageMenu6 extends StatelessWidget {
  const PageMenu6({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 10),
        // SizedBox(height: 10),
        // // SizedBox(height: 10),
        // // SizedBox(height: 10),
        // Text(
        //   '',
        //   style: GoogleFonts.greatVibes(fontSize: 20),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Text(
        //       '',
        //       style: GoogleFonts.openSans(
        //           fontSize: 12, fontWeight: FontWeight.w700),
        //     ),
        //     SizedBox(width: 30),
        //     Text(
        //       '',
        //       style: GoogleFonts.openSans(
        //           fontSize: 12, fontWeight: FontWeight.w700),
        //     ),
        //   ],
        // ),
        // SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: [
              for (var i = 0; i < menuItems_Page6.length; i++) ...[
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: (menuItems_Page6[i].id == '30')
                        ? MenuItemWidget8(item: menuItems_Page6[i])
                        : (menuItems_Page6[i].id == '31')
                            ? MenuItemWidget9(item: menuItems_Page6[i])
                            : MenuItemWidget7(item: menuItems_Page6[i]),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
