// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/menu_foods/data/menu_data.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_2.dart';

class PageMenu1 extends StatelessWidget {
  const PageMenu1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          'Suffer',
          style: GoogleFonts.greatVibes(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '300 ml',
              style: GoogleFonts.openSans(
                  fontSize: 12, fontWeight: FontWeight.w700),
            ),
            SizedBox(width: 30),
            Text(
              '750 ml',
              style: GoogleFonts.openSans(
                  fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: menuItems_Page1.map((item) {
              Widget widgetItem;

              // Quyết định widget theo id
              if (item.id == '3' || item.id == '6') {
                widgetItem = MenuItemWidget2(item: item);
              } else {
                widgetItem = MenuItemWidget(item: item);
              }

              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                    border: Border.all(color: Colors.red),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: widgetItem,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
