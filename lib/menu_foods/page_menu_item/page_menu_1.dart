// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_1.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_1.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_2.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu1 extends StatelessWidget {
  const PageMenu1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => Container(
       padding: EdgeInsets.only(left: 5,right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Supper',
                style: getFont0(state),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '300 ml',
                  style: getFontB(state),
                ),
                SizedBox(width: 20),
                Text(
                  '750 ml',
                  style: getFontB(state),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: menuItems_Page1.map((item) {
                  Widget widgetItem;
        
                  // Quyết định widget theo id
                  if (item.id == '3' || item.id == '6') {
                    widgetItem = MenuItemWidget2(item: item, id: "item.id");
                  } else {
                    widgetItem = MenuItemWidget(item: item);
                  }
        
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.transparent),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: widgetItem,
                        ),
                      ),
                      if (item.id == '5' || item.id == '6') SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
