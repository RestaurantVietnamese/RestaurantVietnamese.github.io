// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/menu_foods/data/menu_data.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget.dart';
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
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Suffer',
              style: getFont(state.font0, fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '300 ml',
                style: getFont(state.fontB,
                    fontSize: 12, fontWeight: FontWeight.w700),
              ),
              SizedBox(width: 30),
              Text(
                '750 ml',
                style: getFont(state.fontB,
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
                      border: Border.all(color: Colors.transparent),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: widgetItem,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
