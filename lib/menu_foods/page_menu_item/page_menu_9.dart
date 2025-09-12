// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/menu_foods/data/menu_data_page_9.dart';
import 'package:puzzel/menu_foods/edit_data/edit_prices.dart';
import 'package:puzzel/menu_foods/widgets/menu_item_widget_11.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';

class PageMenu9 extends StatefulWidget {
  const PageMenu9({super.key});

  @override
  State<PageMenu9> createState() => _PageMenu9State();
}

class _PageMenu9State extends State<PageMenu9> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) =>
          // InteractiveViewer(
          //   boundaryMargin: EdgeInsets.all(100),
          //   minScale: 0.1, // zoom nhỏ hơn để vừa khung
          //   maxScale: 3.0,
          //   child:
          Container(
            color: bBg,
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
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          for (var i = 0; i < menuItems_Page9.length; i++) ...[
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
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: (menuItems_Page9[i].id == '')
                                      ? MenuItemWidget11(
                                          item: menuItems_Page9[i],
                                          usePadding: true,
                                          onEditPrice: (option, isPrice1) =>
                                              editPrice(
                                            context: context,
                                            option: option,
                                            isPrice1: isPrice1,
                                            setState: setState,
                                          ),
                                          onEditDescription:
                                              (option, isDescriptionDe) =>
                                                  editDescriptionOption(
                                            context: context,
                                            option: option,
                                            isDescriptionDe: isDescriptionDe,
                                            setState: setState,
                                          ),
                                          onEditName: (option) => editName(
                                            context: context,
                                            option: option,
                                            setState: setState,
                                          ),
                                        )
                                      : Container()),
                            ),
                            if (menuItems_Page9[i].title == 'Maki Rolls')
                              SizedBox(height: 12),
                            if (menuItems_Page9[i].title == 'Tempura Rolls')
                              SizedBox(height: 12)
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
                top: -30,
                left: -20,
                child: Image.asset(
                  'assets/images/black_paint.png',
                  color: Colors.white,
                  height: 100,
                  width: 140,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
              Positioned(
                top: 5,
                left: 15,
                child: Text(
                  'Sushi',
                  style: getFont0(state),
                ),
              ),
              //
              //
              //
            ],
                    ),
                  ),
          ),
      // ),
    );
  }
}
