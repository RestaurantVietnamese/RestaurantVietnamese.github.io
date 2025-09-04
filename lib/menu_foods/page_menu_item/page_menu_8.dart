// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_8.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_10.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_7.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_9.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu8 extends StatelessWidget {
  const PageMenu8({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => InteractiveViewer(
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.1, // zoom nhỏ hơn để vừa khung
        maxScale: 3.0,
        child: FittedBox(
          fit: BoxFit.contain,
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Container(
                width: 450,
                height: 800,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          for (var i = 0; i < menuItems_Page8.length; i++) ...[
                            // Widget cho item hiện tại
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  width: 450,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.transparent,
                                    border:
                                        Border.all(color: Colors.transparent),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: (menuItems_Page8[i].id == '40' ||
                                          menuItems_Page8[i].id == '41' ||
                                          menuItems_Page8[i].id == '42')
                                      ? MenuItemWidget7(
                                          item: menuItems_Page8[i],
                                          usePadding: false,
                                        )
                                      : (menuItems_Page8[i].id == '43' ||
                                              menuItems_Page8[i].id == '44' ||
                                              menuItems_Page8[i].id == '45' ||
                                              menuItems_Page8[i].id == '46' ||
                                              menuItems_Page8[i].id == '47')
                                          ? MenuItemWidget10(
                                              item: menuItems_Page8[i])
                                          : MenuItemWidget9(
                                              item: menuItems_Page8[i],
                                              usePadding: false,
                                              menuPage7: true,
                                            )),
                            ),
                            if (menuItems_Page8[i].id == '42')
                            SizedBox(height: 50,)
                              // Padding(
                              //   padding: const EdgeInsets.only(right: 15),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       Column(
                              //         children: [
                              //           SizedBox(height: 6),
                              //           Text(
                              //             'Beilagen',
                              //             style: getFont0(state),
                              //           ),
                              //           SizedBox(height: 10),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              // ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //
              //
              //
              Positioned(
                bottom: 110,
                right: -80,
                child: SizedBox(
                  width: 210,
                  height: 40,
                  child: Image.asset(
                    'assets/images/black_paint.png',
                    color: Colors.white,
                    fit: BoxFit.fitWidth,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),
              ),
              Positioned(
                bottom: 110,
                right: 15,
                child: Text(
                  'Beilagen',
                  style: getFont0(state),
                ),
              ),
              //
              //
              //
              //
              //
              //
              Positioned(
                  bottom: 110,
                  right: 15,
                  left: 15,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 15,
                  child: Container(
                    height: 110,
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  right: 15,
                  child: Container(
                    height: 110,
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                    ),
                  )),

              //
              //
              //
            ],
          ),
        ),
      ),
    );
  }
}
