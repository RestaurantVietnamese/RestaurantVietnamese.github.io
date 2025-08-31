// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_1.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_4.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_5.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_6.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_7.dart';

class PageMenu4 extends StatelessWidget {
  const PageMenu4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        SizedBox(height: 10),
        // SizedBox(height: 10),
        // SizedBox(height: 10),
        Text(
          '',
          style: GoogleFonts.greatVibes(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '',
              style: GoogleFonts.openSans(
                  fontSize: 12, fontWeight: FontWeight.w700),
            ),
            SizedBox(width: 30),
            Text(
              '',
              style: GoogleFonts.openSans(
                  fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: [
              for (var i = 0; i < menuItems_Page4.length; i++) ...[
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
                    child:
                        //  (menuItems_Page4[i].id == '11' ||
                        //         menuItems_Page4[i].id == '12' ||
                        //         menuItems_Page4[i].id == '13')
                        //     ? MenuItemWidget3(item: menuItems_Page4[i])
                        //     : menuItems_Page4[i].id == '8'
                        //         ? MenuItemWidget4(item: menuItems_Page4[i])
                        //         :
                        // (menuItems_Page4[i].id == '15')
                        //     ? MenuItemWidget6(item: menuItems_Page4[i])
                        //     :
                        MenuItemWidget7(item: menuItems_Page4[i]),
                  ),
                ),

                // Chèn khoảng trống giữa id 11 và 12
                if (menuItems_Page4[i].id == '11' &&
                    i + 1 < menuItems_Page4.length &&
                    menuItems_Page4[i + 1].id == '12')
                  const SizedBox(height: 20), // <- thay 20 bằng height bạn muốn
              ],
            ],
          ),
        ),
      ],
    );
  }
}
