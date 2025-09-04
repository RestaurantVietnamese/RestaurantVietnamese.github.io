// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_3.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_6.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_7.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu3 extends StatelessWidget {
  const PageMenu3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                for (var i = 0; i < menuItems_Page3.length; i++) ...[
                  // Widget cho item hiện tại
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: aBg,
                        border: Border.all(color: Colors.transparent),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: (menuItems_Page3[i].id == '15')
                          ? MenuItemWidget6(item: menuItems_Page3[i])
                          : MenuItemWidget7(item: menuItems_Page3[i]),
                    ),
                  ),

                  // Chèn khoảng trống giữa id 15 và 16
                  if (menuItems_Page3[i].id == '15' &&
                      i + 1 < menuItems_Page3.length &&
                      menuItems_Page3[i + 1].id == '16')
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, bottom: 10),
                      child: Text(
                        'Main',
                        style: getFont0(state),
                      ),
                    )
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
