// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/widget/fonts/bloc/font_cubit.dart';
import 'package:puzzel/widget/fonts/bloc/font_state.dart';
import 'package:puzzel/widget/fonts/helper_fonts.dart';
import '../models/menu_item.dart';

class MenuItemWidget4 extends StatelessWidget {
  final MenuItem item;

  const MenuItemWidget4({Key? key, required this.item}) : super(key: key);

  bool isWhite() {
    return item.id == '8';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontCubit, FontState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề món ăn
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: item.id,
                        style: TextStyle(
                          fontSize: 12,
                          color: isWhite() ? Colors.white : Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: '. ',style: getFontA(state,
                          color: isWhite() ? Colors.white : Colors.black)),
                      TextSpan(
                        text: item.title,
                        style: getFontA(
                          state,
                          color: isWhite() ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (item.subText != '')
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    item.subText ?? '',
                    style: getFontD(state,
                        color: isWhite() ? Colors.white : Colors.black),
                    textAlign: TextAlign.right,
                  ),
                ),
            ],
          ),

          // Mỗi option một dòng (Row)
          ...item.options.map((opt) {
            return Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cột 1: Mô tả tiếng Đức (flex: 10)
                    Expanded(
                      flex: 14,
                      child: Text(
                        item.descriptionDe,
                        style: getFontB(state,
                            color: isWhite() ? Colors.white : Colors.black),
                      ),
                    ),

                    // Cột 2: Tags (flex: 2)
                    //ko có

                    // Cột 3: Giá 300 (flex: 2)
                    //ko có

                    // Cột 4: Giá 750 (flex: 2)
                    // Expanded(
                    //   flex: 2,
                    //   child:
                    // Text(
                    //     opt.prices2.isNotEmpty ? opt.prices2 : '',
                    //     textAlign: TextAlign.right,
                    //     style: getFont(state.fontD,
                    //         fontSize: 12, fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                  ],
                ),
                Positioned(
                  right: 20,
                  top: 0,
                  bottom: 0,
                  child: Text(
                    opt.prices2.isNotEmpty ? opt.prices2 : '',
                    textAlign: TextAlign.right,
                    style: getFontD(state,
                        color: isWhite() ? Colors.white : Colors.black),
                  ),
                )
              ],
            );
          }).toList(),

          // Mô tả tiếng Anh (in nghiêng)
          Text(
            item.descriptionEn,
            style:
                getFontC(state, color: isWhite() ? Colors.white : Colors.black),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
